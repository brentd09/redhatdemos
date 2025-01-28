#!/bin/bash

echo Installing Apache web server
sudo dnf -y install httpd
sudo systemctl enable --now httpd
echo ''

echo Making the public_html directory under the home dir
mkdir ~/public_html
echo ''

echo Creating a trial webpage 
echo 'Brents demo website' > ~/public_html/index.html
echo ''

echo Try to access home web page
echo "curl localhost/~/index.html"
curl localhost/~/index.html
echo ''

echo Check selinux booleans
echo getsebool -a
read -sp '' promptvar
getsebool -a
echo ''
echo One of these booleans can allow the httpd web server to access home directories
getsebool -a | grep httpd_enable_homedirs
echo ''

echo Set the httpd_enable_homedirs on
echo setsebool httpd_enable_homedirs on
read -sp '' promptvar
sudo setsebool httpd_enable_homedirs on
getsebool -a | grep httpd_enable_homedirs
echo ''

echo Edit the httpd userdir.conf to enable home dir access
echo "vim -c '%s/UserDir disabled/#UserDir disabled/g' -c '%s/#UserDir public_html/UserDir public_html/g' -c 'wq' /etc/httpd/conf.d/userdir.conf"
read -sp '' promptvar
sudo vim -c '%s/UserDir disabled/#UserDir disabled/g' -c '%s/#UserDir public_html/UserDir public_html/g' -c 'wq' /etc/httpd/conf.d/userdir.conf
echo ''

echo Changing the permisions on the home dir 
sudo chmod 711 ~
