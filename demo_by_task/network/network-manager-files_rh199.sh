#!/bin/bash

DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv 'blob$' | awk '{print $2}' )
IPADDR=$(ip addr show $DEVICE | grep -P 'binetb' | head -n 1 | awk '{print $2}')
DEFGW=$(ip route | grep default | awk '{print $3}' )
DNSIP=$(nmcli device show $DEVICE | grep DNS | head -n 1 | awk '{print $2}')
NETOCT=$(echo $IPADDR | grep -Po '^(d{1,3}.){3}')
FTHOCT=$(echo $IPADDR | grep -Po 'd{1,3}/' | sed 's////g')
NEWFTH=$((10 + $FTHOCT))
NTMASK=$(echo $IPADDR | grep -Po '/d{1,2}$')
NEXTIP=$(echo ${NETOCT}${NEWFTH}${NTMASK})

echo -n "ls -l /etc/NetworkManager/system-connections"
read -sp '' promptvar
echo ''
ls -l /etc/NetworkManager/system-connections
echo ''

echo -n "nmcli conn add con-name demo2 ipv4.addresses $NEXTIP ipv4.dns $DNSIP connection.interface-name $DEVICE type ethernet"
read -sp '' promptvar
echo ''
nmcli conn add con-name demo2 ipv4.addresses $NEXTIP ipv4.dns $DNSIP connection.interface-name $DEVICE type ethernet
echo ''

echo -n "ls -l /etc/NetworkManager/system-connections"
read -sp '' promptvar
echo ''
ls -l /etc/NetworkManager/system-connections
echo ''

echo -n "vi /etc/NetworkManager/system-connections/demo2.nmconnection"
read -sp '' promptvar
echo ''
vi /etc/NetworkManager/system-connections/demo2.nmconnection
echo ''
