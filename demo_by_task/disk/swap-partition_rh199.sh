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
  
  # Automate partitioning of using parted

  diskparttype=$(parted -sm $DISK print)
  if [[ $diskparttype =~ 'unknown' ]];then 
    echo 'Create a GPT partition table'
    echo -n 'parted $DISK --script mklabel gpt'
    read -sp '' promptvar
    parted $DISK --script mklabel gpt
    echo ''
  fi
  
  echo Create the first swap partition of 500 MB
  echo -n 'parted $DISK --script mkpart swap1 linux-swap 2001MB 2500MB'
  read -sp '' promptvar
  parted $DISK --script mkpart swap1 linux-swap 2001MB 2500MB
  echo ''
  
  echo 'Create the second partition'
  echo -n 'parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB'
  read -sp '' promptvar
  parted $DISK --script mkpart swap2 linux-swap 2501MB 3000MB
  echo ''
  
  echo 'Print the partition table to verify'
  echo -n 'parted $DISK --script print'
  parted $DISK --script print
  echo ''

  echo 'Wait for device actions to complete before proceeding'
  echo -n 'udevadm settle'
  read -sp '' promptvar
  udevadm settle
  echo ''
  
  
  echo Locating the swap partition device names then format and activate them
  echo 'devnames=$(lsblk -o KNAME,PARTTYPENAME | grep swap | awk {print "/dev/"$1})'
  echo 'for device in $devnames;do'
  echo '  mkswap $device'
  echo '  swapon $device'
  echo -n 'done'
  read -sp '' promptvar
  echo ''
  devnames=$(lsblk -o PATH,PARTTYPENAME | grep swap | awk '{print $1}')
  for device in $devnames;do
    mkswap $device &> /dev/null
    swapon $device &> /dev/null
  done
  echo ''
  
  echo 'Making the swap partitions persistent'
  echo 'Adding the swap partitions to the /etc/fstab file'
  cp /etc/fstab /etc/fstab.backup
  grep -v 'swap' /etc/fstab > /etc/fstab.new
  cp -f /etc/fstab.new /etc/fstab
  rm -f /etc/fstab.new
  lsblk -o PARTTYPENAME,UUID,PATH | grep '^Linux swap' | awk 'BEGIN{pri=3}{print "UUID="$3"   swap   swap   pri="pri++"   0 0"}' >> /etc/fstab
  echo ''
  cat /etc/fstab 
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
