#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then
  echo 'Define the disk and assign it the variable DISK  (e.g., /dev/sda)'
  echo -n 'DISK="/dev/vdb"'
  read -sp '' promptvar
  echo ''
  DISK="/dev/vdb"
  echo ''
  
  # Automate partitioning of using parted
  
  diskparttype=$(parted -sm $DISK print 2> /dev/null | paste -sd ' '| grep vdb)
  if [[ $diskparttype =~ 'unknown' ]];then 
    echo 'Create a GPT partition table'
    echo -n 'parted $DISK --script mklabel gpt'
    read -sp '' promptvar
    echo ''
    parted $DISK --script mklabel gpt
    echo ''
  fi
  
  echo Create the first partition of 500 MB
  echo -n 'parted $DISK --script mkpart primary ext4 0% 500MB'
  read -sp '' promptvar
  echo ''
  parted $DISK --script mkpart primary ext4 0% 500MB
  echo ''
  
  echo 'Create the second partition'
  echo -n 'parted $DISK --script mkpart primary ext4 500MB 2000MB'
  read -sp '' promptvar
  echo ''
  parted $DISK --script mkpart primary ext4 500MB 2000MB
  echo ''
  
  echo 'Print the partition table to verify'
  echo -n 'parted $DISK --script print'
  read -sp '' promptvar
  echo ''
  parted $DISK --script print
  echo ''

  echo Format the partitions
  echo "Partitions created on $DISK."
  echo -n "mkfs.ext4 ${DISK}1 ; mkfs.ext4 ${DISK}2"
  read -sp '' promptvar
  echo ''
  mkfs.ext4 -F ${DISK}1
  mkfs.ext4 -F ${DISK}2
  echo ''
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
