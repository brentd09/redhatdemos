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

echo 'mkdir -p /mnt/salesdata'
read -sp '' promptvar
mkdir -p /mnt/salesdata
echo ''

echo 'mkdir -p /mnt/hrdata'
read -sp '' promptvar
mkdir -p /mnt/hrdata
echo ''

echo 'lsblk -fp '
read -sp '' promptvar
lsblk -fp 
echo ''

vdc1guid=lsblk -fp /dev/vdc1 | grep -oP '[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}'

echo "mount UUID=$vdc1guid /mnt/salesdata"
read -sp '' promptvar
mount UUID=$vdc1guid /mnt/salesdata
echo ''

echo 'mount /dev/vdc2 /mnt/hrdata'
read -sp '' promptvar
mount /dev/vdc2 /mnt/hrdata
echo ''

echo 'df'
read -sp '' promptvar
df
echo ''

echo 'touch /mnt/salesdata/sales.db'
read -sp '' promptvar
touch /mnt/salesdata/sales.db
echo ''
echo 'touch /mnt/hrdata/hr.db'
read -sp '' promptvar
touch /mnt/hrdata/hr.db
echo ''

echo 'ls /mnt/salesdata/ /mnt/hrdata/'
read -sp '' promptvar
ls /mnt/salesdata/ /mnt/hrdata/
echo ''

echo 'umount /mnt/salesdata/ /mnt/hrdata/'
read -sp '' promptvar
umount /mnt/salesdata/ /mnt/hrdata/
echo ''

echo 'ls /mnt/salesdata/ /mnt/hrdata/'
read -sp '' promptvar
ls /mnt/salesdata/ /mnt/hrdata/
echo ''
