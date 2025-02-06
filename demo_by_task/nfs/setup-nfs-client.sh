#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
fi

this_machine=$(hostname)
if [[ $this_machine != servera ]];then
  echo 'Usage: Must be run as root on serverb'
  exit1
fi

echo "dnf install -y nfs-utils"
read -sp '' promptvar
dnf install -y nfs-utils
echo ''

echo "mkdir -p /mnt/serverb_nfs"
read -sp '' promptvar
mkdir -p /mnt/serverb_nfs
echo ''

echo "mount -t nfs serverb:/srv/nfs_share /mnt/serverb_nfs"
read -sp '' promptvar
mount -t nfs serverb:/srv/nfs_share /mnt/serverb_nfs
echo ''

echo "touch /mnt/serverb_nfs/newfile"
read -sp '' promptvar
touch /mnt/serverb_nfs/newfile
echo ''

echo to make the mount persistent add it to the /etc/fstab file
echo "vim /etc/fstab"
read -sp '' promptvar
echo "serverb:/srv/nfs_share  /mnt/serverb_nfs nfs rw 0 0" >> /etc/fstab
vi /etc/fstab
echo ''

echo 'When unmounting the NFS mount point, first check to see if anyone is using the NFS share'
echo "lsof /mnt/serverb_nfs/"
read -sp '' promptvar
lsof /mnt/serverb_nfs/
echo ''

echo "umount /mnt/serverb_nfs"
read -sp '' promptvar
umount /mnt/serverb_nfs
echo ''
