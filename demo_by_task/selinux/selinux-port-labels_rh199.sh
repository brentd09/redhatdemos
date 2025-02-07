#!/bin/bash

dnf install -y httpd
systemctl enable --now httpd
echo 'Brents test website' > /var/www/html/index.html
vi /etc/httpd/conf/httpd.conf
systemctl restart httpd
systemctl status httpd
journalctl | grep http
semanage port -l | grep http
semanage port -a -t http_port_t -p tcp 8078
semanage port -l | grep http
systemctl restart httpd
systemctl status httpd
curl localhost:8078
