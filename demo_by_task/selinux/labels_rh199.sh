echo Show selinux label on filesystem objects
touch ~/demofile.txt
echo -n 'ls -Z ~/demofile.txt'
read -sp '' promptvar
echo ''
ls -Z ~/demofile.txt
echo ''

echo Installing selinux tools
echo -n 'dnf install -y setools-console setools setroubleshoot-server'
read -sp '' promptvar
echo ''
dnf install -y setools-console setools setroubleshoot-server
echo ''

echo Make selinux permissive
echo -n 'setenforce 0'
read -sp '' promptvar
echo ''
setenforce 0
echo ''


echo -n 'getenforce'
read -sp '' promptvar
echo ''
getenforce
echo ''

echo Make selinux enforcing
echo -n 'setenforce 1'
read -sp '' promptvar
echo ''
setenforce 1
echo ''

echo -n 'getenforce'
read -sp '' promptvar
echo ''
getenforce
echo ''

echo Install Apache website and setup a file with the wrong label as index.html
setenforce 1

echo -n 'dnf -y install httpd' 
read -sp '' promptvar
echo ''
sudo dnf -y install httpd
echo ''

echo Enable and start the Apache web server
echo -n 'systemctl enable --now httpd'
read -sp '' promptvar
echo ''
systemctl enable --now httpd

echo echo \"This is a demo web site\" > ~/index.html 
sudo echo "This is a demo web site" > ~/index.html

echo -n 'echo "This is a demo web site" > ~/index.html'
read -sp '' promptvar
echo ''
sudo echo "This is a demo web site" > ~/index.html
echo ''

echo Moving index.html from home dir to web server dir
echo -n 'mv ~/index.html /var/www/html'
read -sp '' promptvar
echo ''
sudo mv ~/index.html /var/www/html
echo ''

echo Access the Apache web site
echo -n 'curl localhost'
read -sp '' promptvar
echo ''
curl localhost
echo ''

echo Discover the selinux violation
echo -n 'ausearch -m avc | tail -n 1'
read -sp '' promptvar
echo ''
sudo ausearch -m avc | tail -n 1
echo ''

echo What selinux label is on the Apache web server process
echo -n 'ps -efZ | grep httpd'
read -sp '' promptvar
echo ''
ps -efZ | grep httpd
echo ''

echo httpd_t is the label for the web server process
echo ''

echo Search for the label that should be on the index.html file
echo -n "semanage fcontext -l | grep '^/var/www(/.*)?'"
read -sp '' promptvar
echo ''
sudo semanage fcontext -l | grep '^/var/www(/.*)?'
echo The label for the files in the www directory should be httpd_sys_content_t
echo ''

echo Search for selinux policies that control httpd process access
echo -n "sesearch --allow | grep 'allow httpd_t httpd_sys_content_t'"
read -sp '' promptvar
echo ''
sesearch --allow | grep 'allow httpd_t httpd_sys_content_t'
echo ''

echo Because the file_contexts file already have a labelling convention
echo for this directory we can use restorecon to re-label the files
echo -n 'restorecon -Rv /var/www/'
read -sp '' promptvar
echo ''
restorecon -Rv /var/www/
echo ''

echo Check the web site again
echo -n 'curl localhost'
read -sp '' promptvar
echo ''
curl localhost
echo ''
