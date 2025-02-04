#!/bin/bash

me=$(whoami)
thishost=$(hostname)

if [[ $me != root  ]] || [[ $thishost != rhelhost ]]; then
  echo "Usage: This needs to be run as root on the KVM host"
  exit 1
fi	

if [[ $# -eq 0 ]];then 
  echo "Usage: $0 [start|shutdown]"
  exit 2
fi	

vms=$(virsh list --all --name | sort | grep -v '^$' | paste -sd ' ')

for vm_guest_name in $vms; do 
  if [[ $1 =~ ^st ]];then
    virsh start $vm_guest_name
  elif [[ $1 =~ ^sh ]];then
    virsh shutdown $vm_guest_name
  else
    echo "$0 [start|shutdown]" 	  
    exit 3
  fi	  
done
