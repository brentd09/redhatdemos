#!/bin/bash

dnf install -y httpd
systemctl enable --now httpd


#NIC=$(ip link show | grep -v LOOPBACK | awk -F': ' '{print $2}' | grep -v ^$)

echo "Show interface information"
ip link show
ip link show $NIC

echo "Show IP address information"
ip addr show
ip addr show $NIC

ping -c 4 serverb


ip route

tracepath access.redhat.com
ss
ss -tlnp 
