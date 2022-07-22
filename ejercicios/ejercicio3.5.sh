podman run -d --name apache1 -p           8080:8080 registry.redhat.io/rhel8/httpd-24

#IP restringida para aceder al contenedor
podman run -d --name apache2 -p 127.0.0.1:8081:8080 registry.redhat.io/rhel8/httpd-24

#Puerto asignado aleatoriamente
podman run -d --name apache3 -p 127.0.0.1::8080     registry.redhat.io/rhel8/httpd-24

podman port apache3
curl 127.0.0.1:35134

podman run -d --name apache4 -p 8080 registry.redhat.io/rhel8/httpd-24
podman port apache4