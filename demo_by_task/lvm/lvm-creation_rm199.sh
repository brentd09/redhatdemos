#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then
  echo 'This will create 3 partitions on /dev/vdc and 3 partitions on /dev/vdd'
  echo '/dev/vdc1 - 100MB, /dev/vdc2 - 200MB, /dev/vdc3 - 300MB'
  echo '/dev/vdd1 - 500MB, /dev/vdd2 - 600MB, /dev/vdd3 - 700MB'
  DISKS="/dev/vdc /dev/vdd"
  for DISK in $DISKS; do
    parted $DISK --script mklabel gpt
    if [[ $DISK == /dev/vdc ]];then
      partbgn1='0MB'; partend1='100MB'; partbgn2='101MB'; partend2='300MB'; partbgn3='301MB'; partend3='600MB'
    else 
      partbgn1='0MB'; partend1='500MB'; partbgn2='501MB'; partend2='1100MB'; partbgn3='1101MB'; partend3='1800MB'
    fi
      diskparttype=$(parted -sm $DISK)
    if [[ $diskparttype =~ 'unknown' ]];then 
      parted $DISK --script mklabel gpt
    fi
    parted $DISK --script mkpart primary ext4 $partbgn1 $partend1
    parted $DISK --script mkpart primary ext4 $partbgn2 $partend2
    parted $DISK --script mkpart primary ext4 $partbgn3 $partend3
    parted $DISK --script print
  done
  echo 'lsblk /dev/vd{c..d}'
  read -sp '' promptvar
  lsblk /dev/vd{c..d}
  echo ''
  
  echo  'pvcreate /dev/vd{c..d}{1..3}'
  read -sp '' promptvar
  pvcreate /dev/vd{c..d}{1..3}
  echo ''
  
  echo 'vgcreate vg1_demo /dev/vdc1 /dev/vdc2 /dev/vdc3 /dev/vdd1 /dev/vdd2 /dev/vdd3' 
  read -sp '' promptvar
  vgcreate vg1_demo /dev/vdc1 /dev/vdc2 /dev/vdc3 /dev/vdd1 /dev/vdd2 /dev/vdd3 
  echo ''
  
  echo 'lvcreate --name lv1_demo -L 1GB vg1_demo'
  read -sp '' promptvar
  lvcreate --name lv1_demo -L 1GB vg1_demo
  echo ''
  
  echo 'lvcreate --name lv2_demo -L 800MB vg1_demo'
  read -sp '' promptvar
  lvcreate --name lv2_demo -L 800MB vg1_demo
  echo ''
  
  echo 'lsblk'
  read -sp '' promptvar
  lsblk /dev/vd{c..d}
  echo ''

  echo 'mkfs.ext4 /dev/vg1_demo/lv1_demo'
  read -sp '' promptvar
  mkfs.ext4 /dev/vg1_demo/lv1_demo
  echo ''

  echo 'mkfs.ext4 /dev/vg1_demo/lv2_demo'
  read -sp '' promptvar
  mkfs.ext4 /dev/vg1_demo/lv2_demo
  echo ''

  echo 'mkdir /mnt/vol{1..2}'
  read -sp '' promptvar
  mkdir /mnt/vol{1..2}
  echo ''

  echo 'mount /dev/vg1_demo/lv1_demo /mnt/vol1'
  read -sp '' promptvar
  mount /dev/vg1_demo/lv1_demo /mnt/vol1
  echo ''

  echo 'mount /dev/vg1_demo/lv2_demo /mnt/vol2'
  read -sp '' promptvar
  mount /dev/vg1_demo/lv2_demo /mnt/vol2
  echo ''

  echo 'df'
  read -sp '' promptvar
  df
  echo ''  
  
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
