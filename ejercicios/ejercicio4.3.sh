# Guardar imagenes
podman save [-o FILE_NAME] IMAGE_NAME[:TAG]

## Guardar en tar la imagen del contenedor
podman save -o mysql.tar registry.redhat.io/rhel8/mysql-80


## El comando load es el opuesto al comando save. Por ejemplo, este comando cargaría una imagen guardada en un archivo denominado :mysql.tar
podman load [-i FILE_NAME]
podman load -i mysql.tar

## Borrar imagenes
podman rmi 

## Borra imagenes aunque esten en uso y borra sus contenedores
podman rmi --force

## Borra imagenes que no estan en uso
podman rmi -a

## Modificacion de imagenes
podman commit [OPTIONS] CONTAINER [REPOSITORY[:PORT]/]IMAGE_NAME[:TAG]
podman ps

##Ver las diferencias entre dos imagenes
podman diff mysql-basic

## Para recuperar la lista de archivos y directorios montados para un contenedor en ejecución, utilice el comando:diffpodman inspect
podman inspect \
-f "{{range .Mounts}}{{println .Destination}}{{end}}" CONTAINER_NAME/ID

## Para confirmar los cambios en otra imagen, ejecute el siguiente comando:
podman commit mysql-basic  mysql-custom

## Para etiquetar una imagen, utilice el comando:podman TAG

podman tag [OPTIONS] IMAGE[:TAG] [REGISTRYHOST/][USERNAME/]NAME[:TAG]