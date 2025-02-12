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
    pid_virt_mgr=$(pgrep virt-manager)
    echo "Starting the VM: $vm_guest_name "  
    virsh start $vm_guest_name &> /dev/null
    if [ -z "$pid_virt_mgr" ]; then
      sudo virt-manager
    fi
elif [[ $1 =~ ^sh ]];then
    echo "Shutting down the VM: $vm_guest_name "  
    virsh shutdown $vm_guest_name &> /dev/null
  else
    echo "$0 [start|shutdown]" 	  
    exit 3
  fi	  
done

echo 'getting VM status... Please wait'
sleep 5
virsh list --all
