echo Show selinux label on filesystem objects
touch ~/demofile.txt
echo ls -Z 
read -sp '' promptvar
sudo setenforce permissive
getenforce
echo ''

echo Install Apache website and setup a file with the wrong label as index.html
echo dnf -y install httpd 
read -sp '' promptvar
sudo dnf -y install httpd
echo systemctl enable --now httpd
read -sp '' promptvar
sudo systemctl enable --now httpd
echo echo \"This is a demo web site\" > ~/index.html 
read -sp '' promptvar
sudo echo "This is a demo web site" > ~/index.html
echo mv ~/index.html /var/www/html
read -sp '' promptvar
sudo mv ~/index.html /var/www/html
echo Curl to the Apache web site
echo curl localhost
read -sp '' promptvar
curl localhost
