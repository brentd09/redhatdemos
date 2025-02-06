#!/bin/bash

#me=$(whoami)
#if [[ $me != root ]];then
#  echo 'Usage: Must be run as root on serverb'
#fi

#this_machine=$(hostname)
#if [[ $this_machine != serverb ]];then
#  echo 'Usage: Must be run as root on serverb'
#  exit1
#fi

dnf install -y nfs-utils
systemctl enable --now nfs-server rpcbind nfs-mountd
systemctl status nfs-server
firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=rpc-bind 
firewall-cmd --permanent --add-service=mountd 
firewall-cmd --reload 
firewall-cmd --list-all
   
mkdir -p /srv/nfs_share
chown -R nobody:nobody /srv/nfsr_hare
chmod 777 /srv/nfsr_hare
echo '/srv/nfs_share  192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
# Refresh exports
exportfs -r
systemctl restart nfs-server.service 
# Show exports verbose option
exportfs -v
tree /srv/
