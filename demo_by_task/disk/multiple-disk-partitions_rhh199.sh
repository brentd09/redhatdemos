#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then
  echo 'This will create 3 partitions on /dev/vdb and 3 partitions on /dev/vdc'
  echo '/dev/vdc1 - 100MB, /dev/vdc2 - 200MB, /dev/vdc3 - 300MB'
  echo '/dev/vdd1 - 500MB, /dev/vdd2 - 600MB, /dev/vdd3 - 700MB'
  DISKS="/dev/vdc /dev/vdd"
  for DISK in $DISKS; do 
    if [[ $DISK == /dev/vdc ]];then
      partbgn1='0MB'; partend1='100MB'; partbgn2='101MB'; partend2='300MB'; partbgn3='301MB'; partend3='600MB'
    else 
      partbgn1='0MB'; partend1='500MB'; partbgn2='501MB'; partend2='1100MB'; partbgn3='1101MB'; partend3='1800MB'
    fi
    parted $DISK --script mklabel gpt
    parted $DISK --script mkpart primary ext4 $partbgn1 $partend1
    parted $DISK --script mkpart primary ext4 $partbgn2 $partend2
    parted $DISK --script mkpart primary ext4 $partbgn3 $partend3
    mkfs.ext4 ${DISK}1
  done
  parted $DISK --script print
else 
  echo 1>&2 "You are on the wrong server, please do this from servera"
fi
