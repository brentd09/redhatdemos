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
  
  echo 'Create a GPT partition table'
  echo 'parted $DISK --script mklabel gpt'
  read -sp '' promptvar
  parted $DISK --script mklabel gpt
  
  echo Create the first swap partition of 500 MB
  echo 'parted $DISK --script mkpart primary ext4 2001MB 2500MB'
  read -sp '' promptvar
  parted $DISK --script mkpart primary ext4 2001MB 2500MB
  
  echo 'Create the second partition'
  echo 'parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB'
  read -sp '' promptvar
  parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB
  
  echo 'Print the partition table to verify'
  echo 'parted $DISK --script print'
  parted $DISK --script print
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
