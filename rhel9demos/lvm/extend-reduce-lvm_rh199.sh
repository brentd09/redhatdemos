#!/bin/bash

WHO=$(whoami)
if [[ "$WHO" != "root" ]];then
  echo 'USAGE: Please run as root'
  exit 1
fi  

# Make sure we are on the right server
hostnm=$(hostname)
if [[ $hostnm =~ servera ]]; then

 lvcreate --name lv3_demo -L 3GB vg1_demo
  echo 'If we tried to add or exten an LV we would need the' 
  echo 'extents available in the VG which we do not have'
  echo ''
  echo -n 'lvcreate --name lv3_demo -L 3GB vg1_demo'
  read -sp '' promptvar
  echo ''
  lvcreate --name lv3_demo -L 3GB vg1_demo
  echo ''


  echo 'Add a partition and extend the VG'
  echo ''
  echo -n 'parted /dev/vdc --script mkpart lvmextend etx4 601MB 3000MB'
  read -sp '' promptvar
  echo ''
  parted /dev/vdc --script mkpart lvmextend ext4 601MB 3000MB
  echo ''

  echo -n 'lsblk'
  read -sp '' promptvar
  echo ''
  lsblk
  echo ''  

  echo -n 'pvcreate /dev/vdc4'
  read -sp '' promptvar
  echo ''
  pvcreate /dev/vdc4
  echo ''

  echo -n 'vgextend vg1_demo /dev/vdc4'
  read -sp '' promptvar
  echo ''
  vgextend vg1_demo /dev/vdc4
  echo ''

  echo -n 'lvextend -L +2GB /dev/vg1_demo/lv2_demo'
  read -sp '' promptvar
  echo ''
  lvextend -L +2GB /dev/vg1_demo/lv2_demo
  echo ''

  echo -n 'resize2fs /dev/vg1_demo/lv2_demo'
  read -sp '' promptvar
  echo ''
  resize2fs /dev/vg1_demo/lv2_demo
  echo ''

  echo -n 'df'
  read -sp '' promptvar
  echo ''
  df
  echo ''

  #---------------------------
  echo 'Remove /dev/vdd2 from the VG - first we must move data off the /dev/vdd2 extents'
  echo 'and then we can reduce the size of the VG by removing the PV '
  echo ''

  echo -n 'lsblk'
  read -sp '' promptvar
  echo ''
  lsblk
  echo ''

  echo -n 'pvmove -A y /dev/vdd2'
  read -sp '' promptvar
  echo ''
  pvmove -A y /dev/vdd2
  echo ''

  echo -n 'vgreduce vg1_demo /dev/vdd2'
  read -sp '' promptvar
  echo ''
  vgreduce vg1_demo /dev/vdd2
  echo ''

  echo -n 'lsblk'
  read -sp '' promptvar
  echo ''
  lsblk
  echo ''

else
  echo 'Usage: Needs to be run on servera as root'
fi
