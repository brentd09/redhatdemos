#!/bin/bash

DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv '\blo\b$' | awk '{print $2}' )
IPADDR=$(ip addr show $DEVICE | grep -P '\binet\b' | head -n 1 | awk '{print $2}')
DEFGW=$(ip route | grep default | awk '{print $3}' )
DNSIP=$(nmcli device show $DEVICE | grep DNS | head -n 1 | awk '{print $2}')

NETOCT=$(echo $IPADDR | grep -Po '^(\d{1,3}\.){3}')
FTHOCT=$(echo $IPADDR | grep -Po '\d{1,3}\/' | sed 's/\///g')
NEWFTH=$((10 + $FTHOCT))
NTMASK=$(echo $IPADDR | grep -Po '\/\d{1,2}$')
NEXTIP=$(echo ${NETOCT}${NEWFTH}${NTMASK})


ls -l /etc/NetworkManager/system-connections
nmcli conn add con-name demo2 ipv4.addresses $NEXTIP ipv4.dns $DNSIP connection.interface-name $DEVICE type ethernet
ls -l /etc/NetworkManager/system-connections
vi /etc/NetworkManager/system-connections/demo2.nmconnection
