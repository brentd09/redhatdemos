#!/bin/bash

me=$(whoami)

if [[ $me != root ]];then
  echo 'Usage: Must be run as root '
  exit 1
fi

echo -n "dnf install -y httpd"
read -sp '' promptvar
echo ''
dnf install -y httpd
echo ''

echo -n "systemctl enable --now httpd"
read -sp '' promptvar
echo ''
systemctl enable --now httpd
echo ''

echo 'Brents test website' > /var/www/html/index.html

echo "Change the port number from 80 to 8078"
echo -n "vi /etc/httpd/conf/httpd.conf"
read -sp '' promptvar
echo ''
vi /etc/httpd/conf/httpd.conf
echo ''

echo -n "systemctl restart httpd"
read -sp '' promptvar
echo ''
systemctl restart httpd
echo ''

echo -n "systemctl status httpd"
read -sp '' promptvar
echo ''
systemctl status httpd
echo ''

echo -n "journalctl | grep http"
read -sp '' promptvar
echo ''
journalctl | grep http
echo ''

echo -n "semanage port -l | grep http"
read -sp '' promptvar
echo ''
semanage port -l | grep http
echo ''

echo -n "semanage port -a -t http_port_t -p tcp 8078"
read -sp '' promptvar
echo ''
semanage port -a -t http_port_t -p tcp 8078
echo ''

echo -n "semanage port -l | grep http"
read -sp '' promptvar
echo ''
semanage port -l | grep http
echo ''

echo -n "systemctl restart httpd"
read -sp '' promptvar
echo ''
systemctl restart httpd
echo ''

echo -n "systemctl status httpd"
read -sp '' promptvar
echo ''
systemctl status httpd
echo ''

echo -n "curl localhost:8078"
read -sp '' promptvar
echo ''
curl localhost:8078
echo ''
