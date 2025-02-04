#!/bin/bash

if [[ $# == 0  ]];then 
  echo "Usage: $0 <name-of-vm>"
  exit 1
fi	

cp -f /ks-scripts/kstemplate.cfg /ks-scripts/ks.cfg 
sed -i "s/replacehostname/$1/g" /ks-scripts/ks.cfg

virt-install \
  --name ${1}_vm \
  --memory 4096 \
  --vcpus 2 \
  --disk size=20,format=qcow2 \
  --os-variant rhel9.0 \
  --cdrom /ISOs/rhel-9.5-x86_64-dvd.iso \
  --location /ISOs/rhel-9.5-x86_64-dvd.iso \
  --initrd-inject=/ks-scripts/ks.cfg \
  --network network=default,model=virtio \
  --graphics vnc,listen=0.0.0.0 \
  --noautoconsole
