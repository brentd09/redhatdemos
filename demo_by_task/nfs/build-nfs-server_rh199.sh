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

echo "dnf install -y nfs-utils"
read -sp '' promptvar
dnf install -y nfs-utils
echo ''

echo "systemctl enable --now nfs-server rpcbind nfs-mountd"
read -sp '' promptvar
systemctl enable --now nfs-server rpcbind nfs-mountd
echo ''

echo "systemctl status nfs-server"
read -sp '' promptvar
systemctl status nfs-server
echo ''

echo "firewall-cmd --permanent --add-service=nfs"
read -sp '' promptvar
firewall-cmd --permanent --add-service=nfs
echo ''

echo "firewall-cmd --permanent --add-service=rpc-bind"
read -sp '' promptvar
firewall-cmd --permanent --add-service=rpc-bind
echo ''

echo "firewall-cmd --permanent --add-service=mountd"
read -sp '' promptvar
firewall-cmd --permanent --add-service=mountd
echo ''

echo "firewall-cmd --reload"
read -sp '' promptvar
firewall-cmd --reload
echo ''

echo "firewall-cmd --list-all"
read -sp '' promptvar
firewall-cmd --list-all
echo ''

echo ""
read -sp '' promptvar

echo ''

echo "mkdir -p /srv/nfs_share"
read -sp '' promptvar
mkdir -p /srv/nfs_share
echo ''

echo "chown -R nobody:nobody /srv/nfs_share"
read -sp '' promptvar
chown -R nobody:nobody /srv/nfs_share
echo ''

echo "chmod 777 /srv/nfs_share"
read -sp '' promptvar
chmod 777 /srv/nfs_share
echo ''

echo '/srv/nfs_share 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
# Refresh exports
echo "exportfs -r"
read -sp '' promptvar
exportfs -r
echo ''

echo "systemctl restart nfs-server.service"
read -sp '' promptvar
systemctl restart nfs-server.service
echo ''

# Show exports verbose option
echo "exportfs -v"
read -sp '' promptvar
exportfs -v
echo ''

echo "tree /srv/"
read -sp '' promptvar
tree /srv/
echo ''
