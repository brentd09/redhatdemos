#!/bin/bash

DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv 'blob' | awk '{print $2}' )

echo $DEVICE

read -sp ''



echo -n "ls -l /etc/NetworkManager/system-connections"
read -sp '' promptvar
echo ''
ls -l /etc/NetworkManager/system-connections
echo ''

echo -n "nmcli conn add con-name demo2 ipv4.addresses 192.168.10.111 ipv4.dns 192.168.10.1 connection.interface-name $DEVICE type ethernet"
read -sp '' promptvar
echo ''
nmcli conn add con-name demo2 ipv4.addresses 192.168.10.111 ipv4.dns 192.168.10.1 connection.interface-name $DEVICE type ethernet
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
