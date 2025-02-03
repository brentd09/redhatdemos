#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then

  echo 'parted /dev/vdc --script mkpart lvmextend etx4 601MB 3000MB'
  read -sp '' promptvar
  parted /dev/vdc --script mkpart lvmextend etx4 601MB 3000MB
  echo ''

  echo 'pvcreate /dev/vdc4'
  read -sp '' promptvar
  pvcreate /dev/vdc4
  echo ''

  echo 'vgextend vg1_demo /dev/vdc4'
  read -sp '' promptvar
  vgextend vg1_demo /dev/vdc4
  echo ''

  echo 'lvextend -L +2GB /dev/vg1_demo/lv2_demo'
  read -sp '' promptvar
  lvextend -L +2GB /dev/vg1_demo/lv2_demo
  echo ''

  echo 'resize2fs /dev/vg1_demo/lv2_demo'
  read -sp '' promptvar
  resize2fs /dev/vg1_demo/lv2_demo
  echo ''

  echo 'df'
  read -sp '' promptvar
  df
  echo ''

else
  echo 'Usage: Needs to be run on servera as root'
fi
