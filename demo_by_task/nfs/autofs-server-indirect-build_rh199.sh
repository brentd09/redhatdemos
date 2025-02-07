#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
fi

this_machine=$(hostname)
if [[ $this_machine != serverb ]];then
  echo 'Usage: Must be run as root on serverb'
  exit1
fi

echo -n "dnf install -y nfs-utils"
read -sp '' promptvar
echo ''
dnf install -y nfs-utils
echo ''


echo -n "systemctl enable --now nfs-server rpcbind nfs-mountd"
read -sp '' promptvar
echo ''
systemctl enable --now nfs-server rpcbind nfs-mountd
echo ''

echo -n "firewall-cmd --permanent --add-service=nfs"
read -sp '' promptvar
echo ''
firewall-cmd --permanent --add-service=nfs
echo ''

echo -n "firewall-cmd --permanent --add-service=rpc-bind"
read -sp '' promptvar
echo ''
firewall-cmd --permanent --add-service=rpc-bind
echo ''


echo -n "firewall-cmd --permanent --add-service=mountd"
read -sp '' promptvar
echo ''
firewall-cmd --permanent --add-service=mountd
echo ''

echo -n "firewall-cmd --reload"
read -sp '' promptvar
echo ''
firewall-cmd --reload
echo ''


echo -n "mkdir -p /srv/project1 /srv/project2 /srv/project3"
read -sp '' promptvar
echo ''
mkdir -p /srv/project1 /srv/project2 /srv/project3 
echo ''



echo -n "chown -R nobody:nobody /srv/project*"
read -sp '' promptvar
echo ''
chown -R nobody:nobody /srv/project*
echo ''


echo -n "chmod 755 /srv/project*"
read -sp '' promptvar
echo ''
chmod 755 /srv/project*
echo ''

echo '/srv/project1 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
echo '/srv/project2 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
echo '/srv/project3 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports


echo -n "vi /etc/exports"
read -sp '' promptvar
echo ''
vi /etc/exports
echo ''

echo -n "exportfs -r"
read -sp '' promptvar
echo ''
exportfs -r
echo ''


echo -n "systemctl restart nfs-server.service"
read -sp '' promptvar
echo ''
systemctl restart nfs-server.service
echo ''


# Show exports verbose option
echo -n "exportfs -v"
read -sp '' promptvar
echo ''
exportfs -v
echo ''
