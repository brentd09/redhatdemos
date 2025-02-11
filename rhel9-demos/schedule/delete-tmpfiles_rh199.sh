#!/bin/bash

echo '# Store this file as /etc/tmpfiles.d/myapp.conf' > /etc/tmpfiles.d/myapp.conf
echo '# Create a directory with 755 mode' >> /etc/tmpfiles.d/myapp.conf
echo 'd /var/tmp/myapp 755 root root -' >> /etc/tmpfiles.d/myapp.conf
echo '' >> /etc/tmpfiles.d/myapp.conf
echo '# Create a temporary file with 600 mode' >> /etc/tmpfiles.d/myapp.conf
echo 'f /var/tmp/myapp/createdfile.txt 600 root root -' >> /etc/tmpfiles.d/myapp.conf
echo '' >> /etc/tmpfiles.d/myapp.conf
echo '# Remove files that have not been accessed in 1 min' >> /etc/tmpfiles.d/myapp.conf
echo 'x /var/tmp/myapp - - - 1m' >> /etc/tmpfiles.d/myapp.conf

echo -n 'cat /etc/tmpfiles.d/myapp.conf'
read -sp '' promptvar
echo ''
cat /etc/tmpfiles.d/myapp.conf
echo ''

echo 'Check to see if the myapp directory exists, it will probably not exist yet'
echo -n 'tree /usr/tmp/myapp'
read -sp '' promptvar
echo ''
tree /usr/tmp/myapp
echo ''

echo 'Have systemd-tmpfiles create the files and directories we need'
echo -n 'systemd-tmpfiles --create'
read -sp '' promptvar
echo ''
systemd-tmpfiles --create
echo ''

echo 'Add a file to the /usr/tmp/myapp directory'
echo -n 'touch /usr/tmp/myapp/demofile.txt'
read -sp '' promptvar
echo ''
touch /usr/tmp/myapp/demofile.txt
tree /usr/tmp/myapp/
echo ''

echo 'Wait 90 seconds'
echo -n 'sleep 90'
read -sp '' promptvar
echo ''
sleep 90
echo ''

echo 'Have systemd-tmpfiles clean the temp directories '
echo -n 'systemd-tmpfiles --clean'
read -sp '' promptvar
echo ''
systemd-tmpfiles --clean
echo ''

echo 'Check the tmp directory again, demofile.txt should be deleted'
echo -n 'tree /usr/tmp/myapp'
echo ''
read -sp '' promptvar
tree /usr/tmp/myapp
