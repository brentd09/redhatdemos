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

dnf install -y nfs-utils


systemctl enable --now nfs-server rpcbind nfs-mountd

firewall-cmd --permanent --add-service=nfs
firewall-cmd --permanent --add-service=rpc-bind
firewall-cmd --permanent --add-service=mountd
firewall-cmd --reload

mkdir -p /srv/project1 /srv/project2 /srv/project3 
chown -R nobody:nobody /srv/project*
chmod 777 /srv/project*
echo '/srv/project1 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
echo '/srv/project2 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports
echo '/srv/project3 192.168.122.0/24(rw,sync,no_root_squash)' >> /etc/exports

vi /etc/exports

exportfs -r
systemctl restart nfs-server.service

# Show exports verbose option
echo "exportfs -v"
read -sp '' promptvar
exportfs -v
echo ''
