#!/bin/bash

me=$(whoami)
server=$(hostname)
lsblk /dev/vdc1 &> /dev/null
part1result=$?
lsblk /dev/vdc2 &> /dev/null
part2result=$?

if [[ $me != root ]];then 
  echo This script is to be run as root
  exit 3
fi

if [[ ! $server =~ 'servera' ]]; then 
  echo This script needs to be run on servera
  exit 2
fi

if [[ $part1result -ne 0 ||  $part2result -ne 0 ]]; then 
  echo 'Usage: Please run the multiple-disk-partitions_rh199.sh or at least create two partitions on /dev/vdc, before running this script'
  exit 1
fi

mkdir -p /mnt/salesdata
mkdir -p /mnt/hrdata

mount /dev/vdc1 /mnt/salesdata
mount /dev/vdc2 /mnt/hrdata

df

touch /mnt/salesdata/sales.db
touch /mnt/hrdata/hr.db

ls /mnt/salesdata/ /mnt/hrdata/

umount /mnt/salesdata/ /mnt/hrdata/

ls /mnt/salesdata/ /mnt/hrdata/
