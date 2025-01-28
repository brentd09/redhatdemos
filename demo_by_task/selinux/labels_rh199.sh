echo Show selinux label on filesystem objects
touch ~/demofile.txt
echo ls -Z ~/demofile.txt
read -sp '' promptvar
ls -Z ~/demofile.txt
echo ''

echo Installing selinux tools
echo sudo dnf install -y setools-console setools
read -sp '' promptvar
sudo dnf install -y setools-console setools
echo ''

echo Make selinux permissive
echo setenforce 0
sudo setenforce 0
getenforce
echo ''

echo Make selinux enforcing
echo setenforce 1
sudo setenforce 1
getenforce
echo ''

echo Install Apache website and setup a file with the wrong label as index.html
sudo setenforce 1
echo dnf -y install httpd 
read -sp '' promptvar
sudo dnf -y install httpd
echo ''
echo Enable and start the Apache web server
echo systemctl enable --now httpd
read -sp '' promptvar
sudo systemctl enable --now httpd
echo echo \"This is a demo web site\" > ~/index.html 
sudo echo "This is a demo web site" > ~/index.html
echo ''
echo Moving index.html from home dir to web server dir
echo mv ~/index.html /var/www/html
read -sp '' promptvar
sudo mv ~/index.html /var/www/html
echo ''
echo Access the Apache web site
echo curl localhost
read -sp '' promptvar
curl localhost
echo ''

echo Discover the selinux violation
echo ausearch -m avc | tail -n 1
read -sp '' promptvar
sudo ausearch -m avc | tail -n 1
echo ''

echo What selinux label is on the Apache web server process
echo 'ps -efZ | grep httpd'
read -sp '' promptvar
ps -efZ | grep httpd
echo httpd_t is the label for the web server process
echo ''

echo Search for the label that should be on the index.html file
echo "semanage fcontext -l | grep '^/var/www(/.*)?'"
read -sp '' promptvar
sudo semanage fcontext -l | grep '^/var/www(/.*)?'
echo The label for the files in the www directory should be httpd_sys_content_t
echo ''

echo Search for selinux policies that control httpd process access
echo "sesearch --allow | grep 'allow httpd_t httpd_sys_content_t'"
read -sp '' promptvar
sesearch --allow | grep 'allow httpd_t httpd_sys_content_t'
echo ''

echo Because the file_contexts file already have a labelling convention
echo for this directory we can use restorecon to re-label the files
echo 'restorecon -Rv /var/www/'
read -sp '' promptvar
restorecon -Rv /var/www/
echo ''

echo Check the web site again
echo curl localhost
read -sp '' promptvar
curl localhost
