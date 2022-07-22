#configurar el directorio host:
mkdir /home/student/dbfiles


#El usuario que ejecuta los procesos en el contenedor debe ser capaz de escribir archivos en el directorio. El permiso debe definirse con el ID de usuario numérico (UID) del contenedor. Para el servicio MySQL proporcionado por Red Hat, el UID es 27. El comando proporciona una sesión para ejecutar comandos dentro del mismo espacio de nombres de usuario que el proceso que se ejecuta dentro del contenedor.podman unshare

podman unshare chown -R 27:27 /home/student/dbfiles
#Aplique el contexto al directorio (y a todos los subdirectorios) para permitir que los contenedores accedan a todo su contenido.container_file_t
sudo semanage fcontext -a -t container_file_t '/home/student/dbfiles(/.*)?'

#Aplique la directiva de contenedor seLinux que configuró en el primer paso al directorio recién creado:
sudo restorecon -Rv /home/student/dbfiles

#El directorio host debe estar configurado antes iniciando el contenedor que utiliza el directorio.

#Montaje de un volumen
#Después de crear y configurar el directorio host, el siguiente paso es montar este directorio en un contenedor. Para enlazar montar un directorio host a un contenedor, agregue la opción al comando, especificando la ruta del directorio host y la ruta de almacenamiento del contenedor, separadas por dos puntos (:).-vpodman run
podman run -v /home/student/dbfiles:/var/lib/mysql rhmap47/mysql

