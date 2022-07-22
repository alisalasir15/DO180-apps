podman login registry.redhat.io
podman ps --format "{{.ID}} {{.Image}} {{.Names}}"
podman exec -it mysql-basic /bin/bash


CREATE TABLE Projects (id int NOT NULL,
name varchar(255) DEFAULT NULL,
code varchar(255) DEFAULT NULL,
PRIMARY KEY (id));

insert into Projects (id, name, code);

sudo podman run --rm --name asroot -ti registry.access.redhat.com/ubi8:latest /bin/bash
podman run --rm --name asuser -ti registry.access.redhat.com/ubi8:latest /bin/bash

podman run -d -p 8080:80 --name httpd-basic quay.io/redhattraining/httpd-parent:2.4
podman exec -it httpd-basic /bin/bash