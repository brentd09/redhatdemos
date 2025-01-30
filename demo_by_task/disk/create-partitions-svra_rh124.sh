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
  echo 'DISK="/dev/vdb"'
  read -sp '' promptvar
  DISK="/dev/vdb"
  
  # Automate partitioning of using parted
  
  diskparttype=$(parted -sm $DISK)
  if [[ $diskparttype =~ 'unknown' ]];then 
    echo 'Create a GPT partition table'
    echo 'parted $DISK --script mklabel gpt'
    read -sp '' promptvar
    parted $DISK --script mklabel gpt
  fi
  
  echo Create the first partition of 500 MB
  echo 'parted $DISK --script mkpart primary ext4 0% 500MB'
  read -sp '' promptvar
  parted $DISK --script mkpart primary ext4 0% 500MB
  
  echo 'Create the second partition'
  echo 'parted $DISK --script mkpart primary ext4 500MB 2000MB'
  read -sp '' promptvar
  parted $DISK --script mkpart primary ext4 500MB 2000MB
  
  echo 'Print the partition table to verify'
  echo 'parted $DISK --script print'
  parted $DISK --script print

  echo Format the partitions
  echo "Partitions created on $DISK."
  echo "mkfs.ext4 ${DISK}1 ; mkfs.ext4 ${DISK}2"
  read -sp '' promptvar
  mkfs.ext4 -F ${DISK}1
  mkfs.ext4 -F ${DISK}2
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
