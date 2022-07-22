mkdir -pv /home/student/local/mysql

sudo semanage fcontext -a -t container_file_t '/home/student/local/mysql(/.*)?'

sudo restorecon -R /home/student/local/mysql
ls -ldZ /home/student/local/mysql

podman unshare chown     27:27 /home/student/local/mysql
podman unshare chown -Rv 27:27 /home/student/local/mysql
podman login registry.redhat.io
podman pull registry.redhat.io/rhel8/mysql-80:1

podman run --name mysql-1 -p 13306:3306 \
-d -v /home/student/local/mysql:/var/lib/mysql/data \
-e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 \
-e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 \
registry.redhat.io/rhel8/mysql-80:1

podman ps --format="{{.ID}} {{.Names}}"
ls -ld /home/student/local/mysql/items

mysql -uuser1 -h 127.0.0.1 -pmypa55 -P13306 items < /home/student/DO180/labs/manage-review/db.sql

mysql -uuser1 -h 127.0.0.1 -pmypa55 -P13306 items -e "SELECT * FROM Item"
#podman stop mysql-1
#podman unshare ls -ld /home/student/local/mysql/items

#CONTENEDOR 2 con el mismo almacenamiento del CONTENEDOR 1
podman run --name mysql-2 \
-d -v /home/student/local/mysql:/var/lib/mysql/data \
-p 13306:3306 \
-e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 \
-e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 \
registry.redhat.io/rhel8/mysql-80:1

podman ps --format="{{.ID}} {{.Names}}"
podman ps -a > /tmp/my-containers

podman exec -it mysql-2 /bin/bash

mysql -uuser1 -h workstation.lab.example.com -pmypa55 -P13306 items

#insert into Item (description, done) values ('Finished lab', 1);

lab manage-review grade