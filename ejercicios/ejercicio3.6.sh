podman run --name mysqldb-port \
-d -v /home/student/local/mysql:/var/lib/mysql/data -p 13306:3306 \
-e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 \
-e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 \
registry.redhat.io/rhel8/mysql-80:1

podman ps --format="{{.ID}} {{.Names}} {{.Ports}}"

mysql -uuser1 -h 127.0.0.1 -pmypa55 \
-P13306 items < /home/student/DO180/labs/manage-networking/db.sql

podman exec -it mysqldb-port \
mysql -uroot items -e "SELECT * FROM Item"

mysql -uuser1 -h 127.0.0.1 -pmypa55 \
-P13306 items -e "SELECT * FROM Item"

#podman exec -it mysqldb-port /bin/bash