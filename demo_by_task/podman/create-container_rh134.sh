#!/bin/bash

me=$(whoami)

if [[ $me != root ]];then
  echo 'Usage: Must be run as root on servera'
  exit 1
fi

echo -n "dnf install -y podman cockpit-podman cockpit"
read -sp '' promptvar
echo ''
dnf install -y podman cockpit-podman cockpit
echo ''

echo -n "systemctl enable --now podman"
read -sp '' promptvar
echo ''
systemctl enable --now podman
echo ''

echo -n "podman pull registry.access.redhat.com/ubi9/ubi"
read -sp '' promptvar
echo ''
podman pull registry.access.redhat.com/ubi9/ubi
echo ''

echo -n "podman image list"
read -sp '' promptvar
echo ''
podman image list
echo ''

echo -n "podman container list"
read -sp '' promptvar
echo ''
podman container list
echo ''

echo -n "podman ps"
read -sp '' promptvar
echo ''
podman ps
echo ''

echo -n "podman network create mynet"
read -sp '' promptvar
echo ''
podman network create mynet
echo ''

echo -n "podman run -d --name ubi-demo-container --network=mynet  -p 8080:80 registry.access.redhat.com/ubi9/ubi  /bin/bash -c 'dnf install -y httpd && echo "PODMAN demo website" > /var/www/html/index.html && httpd -D FOREGROUND'"
read -sp '' promptvar
echo ''
podman run -d --name ubi-demo-container --network=mynet -p 8080:80 registry.access.redhat.com/ubi9/ubi /bin/bash -c 'dnf install -y httpd && echo "PODMAN demo website" > /var/www/html/index.html && httpd -D FOREGROUND'
echo ''

echo -n "podman ps"
read -sp '' promptvar
echo ''
podman ps
echo ''

echo -n "podman stop ubi-demo-container"
read -sp '' promptvar
echo ''
podman stop ubi-demo-container
echo ''

cat <<EOF > Containerfile
FROM registry.access.redhat.com/ubi9/ubi
RUN dnf install -y httpd && echo "PODMAN demo website from container" > /var/www/html/index.html
EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
EOF

echo -n "podman build -t demo_image_rh134 ."
read -sp '' promptvar
echo ''
podman build -t demo_image_rh134 .
echo ''

echo -n "podman run -d -p 8080:80 --name demo_container_rh134 localhost/demo_image_rh134:latest"
read -sp '' promptvar
echo ''
podman run -d -p 8080:80 --name demo_container_rh134 localhost/demo_image_rh134:latest
echo ''
