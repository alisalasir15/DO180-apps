# Creación de una imagen de contenedor de Apache personalizada

podman login quay.io

## Crear un contenedor
podman run -d --name official-httpd -p 8180:80 quay.io/redhattraining/httpd-parent

## Meterse dentro del contenedor y crear una nueva pagina web
podman exec -it official-httpd /bin/bash
    bash-4.4# echo "DO180 Page" > /var/www/html/do180.html

## Ver las diferencias de la imagen
podman diff official-httpd

## Crear una nueva imagen con los cambios creados por el contenedor en ejecucion
podmain stop official-httpd
podman commit -a 'alisalasir15@gmail.com' official-httpd do180-custom-httpd
podmain images

## Etiquetar la imagen
podman tag do180-custom-httpd quay.io/${RHT_OCP4_QUAY_USER}/do180-custom-httpd:v1.0

## Piublicar la imagen en quay.io
podman push quay.io/${RHT_OCP4_QUAY_USER}/do180-custom-httpd:v1.0

## Comprobar la imagen creada y publicada en https://quay.io/repository/alisalasir15/do180-custom-httpd
podman pull -q quay.io/${RHT_OCP4_QUAY_USER}/do180-custom-httpd:v1.0

## Crear un nuevo contenedor
podman run -d --name test-httpd -p 8280:80 quay.io/${RHT_OCP4_QUAY_USER}/do180-custom-httpd:v1.0