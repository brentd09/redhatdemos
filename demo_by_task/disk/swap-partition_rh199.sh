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
  
  echo Create the first swap partition of 500 MB
  echo 'parted $DISK --script mkpart swap1 linux-swap 2001MB 2500MB'
  read -sp '' promptvar
  parted $DISK --script mkpart swap1 linux-swap 2001MB 2500MB
  
  echo 'Create the second partition'
  echo 'parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB'
  read -sp '' promptvar
  parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB
  
  echo 'Print the partition table to verify'
  echo 'parted $DISK --script print'
  parted $DISK --script print
  echo ''

  echo 'Wait for device actions to complete before proceeding'
  echo 'udevadm settle'
  read -sp '' promptvar
  udevadm settle

  echo Locating the swap partition device names then format and activate them
  echo 'devnames=$(lsblk -o KNAME,PARTTYPENAME | grep swap | awk {print "/dev/"$1})'
  echo 'for device in $devnames;do'
  echo '  mkswap $device'
  echo '  swapon $device'
  echo 'done'
  read -sp '' promptvar
  devnames=$(lsblk -o KNAME,PARTTYPENAME | grep swap | awk '{print "/dev/"$1}')
  for device in $devnames;do
    mkswap $device
    swapon $device
  done
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
