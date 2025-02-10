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
curl localhost/~student/
echo ''

echo Check selinux booleans
echo -n 'getsebool -a'
read -sp '' promptvar
echo ''
getsebool -a
echo ''
echo One of these booleans can allow the httpd web server to access home directories
getsebool -a | grep httpd_enable_homedirs
echo ''

echo Set the httpd_enable_homedirs on
echo -n 'setsebool httpd_enable_homedirs on'
read -sp '' promptvar
echo ''
sudo setsebool httpd_enable_homedirs on
getsebool -a | grep httpd_enable_homedirs
echo ''

echo Edit the httpd userdir.conf to enable home dir access
echo -n "vim -n -c '%s/UserDir disabled/#UserDir disabled/g' -c '%s/#UserDir public_html/UserDir public_html/g' -c 'wq' /etc/httpd/conf.d/userdir.conf"
read -sp '' promptvar
echo ''
vim -n -c '%s/UserDir disabled/#UserDir disabled/g' -c '%s/#UserDir public_html/UserDir public_html/g' -c 'wq' /etc/httpd/conf.d/userdir.conf
echo ''

echo Restaring the Apache web server
echo systemctl restart httpd
systemctl restart httpd
echo ''

echo Changing the permisions on the home dir 
sudo chmod 711 ~
echo ''

echo Try the home dir website again
curl localhost/~student/
