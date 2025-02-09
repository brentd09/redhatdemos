#!/bin/bash

#me=$(whoami)


#if [[ $me != root ]];then
#  echo 'Usage: Must be run as root on servera'
#  exit 1
#fi


dnf install -y podman cockpit-podman cockpit
systemctl enable --now podman

podman pull registry.access.redhat.com/ubi9/ubi

podman image list
podman container list
podman ps
podman network create mynet
podman run -d --name ubi-demo-container --network=mynet  -p 8080:80 registry.access.redhat.com/ubi9/ubi  /bin/bash -c 'dnf install -y httpd && echo "PODMAN demo website" > /var/www/html/index.html && httpd -D FOREGROUND' 
podman ps
podman stop ubi-demo-container

 
#cat <<EOF  > Containerfile
#FROM registry.access.redhat.com/ubi9/ubi
#RUN dnf install -y httpd && echo "PODMAN demo website from container" > /var/www/html/index.html
#EXPOSE 80
#CMD ["httpd", "-D", "FOREGROUND"]
#EOF

podman build -t demo_image_rh134 .
podman run -d -p 8080:80 --name demo_container_rh134 localhost/demo_image_rh134:latest
