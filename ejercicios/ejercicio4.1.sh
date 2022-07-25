podman login -u alisalasir15@gmail.com -p Canto5Sirena_ registry.access.redhat.com
podman login registry.redhat.io

podman pull registry.redhat.io/rhel8/mysql-80:1
podman run  registry.redhat.io/rhel8/mysql-80:1