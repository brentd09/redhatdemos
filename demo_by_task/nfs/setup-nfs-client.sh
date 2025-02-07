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

echo -n "dnf install -y nfs-utils"
read -sp '' promptvar
echo ''
dnf install -y nfs-utils
echo ''

echo -n "mkdir -p /mnt/serverb_nfs"
read -sp '' promptvar
echo ''
mkdir -p /mnt/serverb_nfs
echo ''

echo -n "mount -t nfs serverb:/srv/nfs_share /mnt/serverb_nfs"
read -sp '' promptvar
echo ''
mount -t nfs serverb:/srv/nfs_share /mnt/serverb_nfs
echo ''

echo -n "touch /mnt/serverb_nfs/newfile"
read -sp '' promptvar
echo ''
touch /mnt/serverb_nfs/newfile
echo ''

echo to make the mount persistent add it to the /etc/fstab file
echo -n "vim /etc/fstab"
read -sp '' promptvar
echo "serverb:/srv/nfs_share  /mnt/serverb_nfs nfs rw 0 0" >> /etc/fstab
echo ''
vi /etc/fstab
echo ''

echo 'When unmounting the NFS mount point, first check to see if anyone is using the NFS share'
echo -n "cd /mnt/serverb_nfs/"
cd /mnt/serverb_nfs/
echo -n "lsof /mnt/serverb_nfs/"
read -sp '' promptvar
echo ''
lsof /mnt/serverb_nfs/ 2> /dev/null
echo ''
echo -n "cd "
cd
echo -n "lsof /mnt/serverb_nfs/"
read -sp '' promptvar
echo ''
lsof /mnt/serverb_nfs/ 2> /dev/null
echo ''

echo -n "umount /mnt/serverb_nfs"
read -sp '' promptvar
echo ''
umount /mnt/serverb_nfs
echo ''
