#!/bin/bash

me=$(whoami)
thishost=$(hostname)

if [[ $me != root  ]] || [[ $thishost != rhelhost ]]; then
  echo "Usage: This needs to be run as root on the KVM host"
  exit 1
fi	

if [[ -f ~/newhosts ]];then
  rm -f ~/newhosts*
fi  
vms=$(virsh list --all --name | sort | grep -v '^$' | paste -sd ' ')

for vm_guest_name in $vms; do 
  virsh start $vm_guest_name &> /dev/null
  if [[ $? -eq 0 ]];then 
    sleep 10
  fi  
  vmhostname=$(virsh guestinfo $vm_guest_name | grep -P '(host)' | awk -F': ' '{print $NF}')
  hostsline=$(virsh guestinfo $vm_guest_name | \
    grep -P '(host|if.1.addr.0.addr)' | \
    awk -F': ' '{print $NF}'| \
    sort | \
    paste -sd ' ')
  echo "$hostsline" >> ~/newhosts
  sed -i /$vmhostname/d /etc/hosts
done
cat /etc/hosts ~/newhosts > ~/newhosts_final
cp  ~/newhosts_final /etc/hosts

