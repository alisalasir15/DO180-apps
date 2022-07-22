mkdir -pv /home/student/DO180-apps/ejercicios/mysql

sudo semanage fcontext -a -t container_file_t '/home/student/DO180-apps/ejercicios/mysql(/.*)?'

sudo restorecon -R /home/student/DO180-apps/ejercicios/mysql
ls -ldZ /home/student/DO180-apps/ejercicios/mysql

podman unshare chown 27:27 /home/student/DO180-apps/ejercicios/mysql
podman login registry.redhat.io
podman pull registry.redhat.io/rhel8/mysql-80:1

podman run --name persist-db \
-d -v /home/student/DO180-apps/ejercicios/mysql:/var/lib/mysql/data \
-e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 \
-e MYSQL_DATABASE=items -e MYSQL_ROOT_PASSWORD=r00tpa55 \
registry.redhat.io/rhel8/mysql-80:1

podman ps --format="{{.ID}} {{.Names}} {{.Status}}"

ls -ld /home/student/DO180-apps/ejercicios/mysql/items

podman unshare ls -ld /home/student/DO180-apps/ejercicios/mysql/items