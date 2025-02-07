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

echo -n "systemctl status nfs-server"
read -sp '' promptvar
echo ''
systemctl status nfs-server
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

echo -n "firewall-cmd --list-all"
read -sp '' promptvar
echo ''
firewall-cmd --list-all
echo ''



echo ''
echo -n "mkdir -p /srv/nfs_share"
read -sp '' promptvar
echo ''
mkdir -p /srv/nfs_share
echo ''

echo -n "chown -R nobody:nobody /srv/nfs_share"
read -sp '' promptvar
echo ''
chown -R nobody:nobody /srv/nfs_share
echo ''

echo -n "chmod 777 /srv/nfs_share"
read -sp '' promptvar
echo ''
chmod 777 /srv/nfs_share
echo ''

echo -n '/srv/nfs_share 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
# Refresh exports
echo "exportfs -r"
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

echo -n "tree /srv/"
read -sp '' promptvar
echo ''
tree /srv/
echo ''
