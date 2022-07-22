#Me conecto al registro/repositorio de imagenes
podman login  registry.redhat.io

#Ejecuto la creacion del contenedor. Dara fallo por que le faltan parametros
podman run --name mysql-db registry.redhat.io/rhel8/mysql-80:1

#Ejecucion del contenedor de mysql
podman run --name mysql -d -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 registry.redhat.io/rhel8/mysql-80:1

podman ps

#Cppio un archivo de ejemplo al raiz del contenedor
podman cp /home/student/DO180/labs/manage-lifecycle/db.sql mysql:/

#Ejecuta el comando dentro del contenedor para crear la BBDD y tabla del archivo db.sql
podman exec mysql /bin/bash -c 'mysql -uuser1 -pmypa55 items < /db.sql'


#Contenedor que no funciona por que ejecuta otro comando.
podman run --name mysql-2 -it registry.redhat.io/rhel8/mysql-80:1 /bin/bash

#Hacer una consulta al servidor/contenedor mysql 
podman exec mysql /bin/bash -c 'mysql -uuser1 -pmypa55 -e "select * from items.Projects;"'