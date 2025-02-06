bash setup-nfs-client.sh 
dnf install autofs
vi /etc/auto.master
vi /etc/auto.projects
mkdir /projects
chmod 755 /projects/
systemctl restart autofs
