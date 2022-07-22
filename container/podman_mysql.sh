podman run --name mysql-custom -p 3306  \
-e MYSQL_USER=redhat -e MYSQL_PASSWORD=r3dh4t \
-e MYSQL_ROOT_PASSWORD=r3dh4t \
-d registry.redhat.io/rhel8/mysql-80
