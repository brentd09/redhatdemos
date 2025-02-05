#!/bin/bash

me=$(whoami)

if [[ $me != root ]];then
  echo "Please login as root to run this script"
  exit 1
fi

if [[ $# -lt 1 ]];then
  echo "Usage: $0 <kvm_vm_name>"
  exit 2
fi

guests=$(virsh list --all --name | grep -v '^$' | sort | paste -sd ' ') 
guests=${guests}" all"
result=$(echo $guests | grep $1)

if [[ $? -ne 0 ]];then
  echo "The VM guests are : $guests"
  echo "Usage: $0 <kvm_guest_name>"
  exit 3
fi

if [[ "$1" == "all" ]];then
  guestnames=$guests
else 
  guestnames=$(echo $guests | grep -o $1)
fi
for vm_guest_name in $guestnames
do
  if [[ $vm_guest_name != all ]];then
    echo "${vm_guest_name}: Reverting Snapshot"
    virsh snapshot-revert --snapshotname ReadyForLabs $vm_guest_name
    echo "Rebooting ${vm_guest_name} to sync date/time"
    virsh reboot $vm_guest_name
done
