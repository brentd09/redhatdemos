#!/bin/bash
echo -n "DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv 'blob$' | awk '{print $2}' )"
read -sp '' promptvar
echo ''
DEVICE=$(nmcli device show | grep GENERAL.DEVICE | grep -Pv 'blob$' | awk '{print $2}' )
echo ''

echo -n "IPADDR=$(ip addr show $DEVICE | grep -P 'binetb' | head -n 1 | awk '{print $2}')"
read -sp '' promptvar
echo ''
IPADDR=$(ip addr show $DEVICE | grep -P 'binetb' | head -n 1 | awk '{print $2}')
echo ''

echo -n "DEFGW=$(ip route | grep default | awk '{print $3}' )"
read -sp '' promptvar
echo ''
DEFGW=$(ip route | grep default | awk '{print $3}' )
echo ''

echo -n "DNSIP=$(nmcli device show $DEVICE | grep DNS | head -n 1 | awk '{print $2}')"
read -sp '' promptvar
echo ''
DNSIP=$(nmcli device show $DEVICE | grep DNS | head -n 1 | awk '{print $2}')
echo ''

echo -n "NETOCT=$(echo $IPADDR | grep -Po '^(d{1,3}.){3}')"
read -sp '' promptvar
echo ''
NETOCT=$(echo $IPADDR | grep -Po '^(d{1,3}.){3}')
echo ''

echo -n "FTHOCT=$(echo $IPADDR | grep -Po 'd{1,3}/' | sed 's////g')"
read -sp '' promptvar
echo ''
FTHOCT=$(echo $IPADDR | grep -Po 'd{1,3}/' | sed 's////g')
echo ''

echo -n "NEWFTH=$((10 + $FTHOCT))"
read -sp '' promptvar
echo ''
NEWFTH=$((10 + $FTHOCT))
echo ''

echo -n "NTMASK=$(echo $IPADDR | grep -Po '/d{1,2}$')"
read -sp '' promptvar
echo ''
NTMASK=$(echo $IPADDR | grep -Po '/d{1,2}$')
echo ''

echo -n "NEXTIP=$(echo ${NETOCT}${NEWFTH}${NTMASK})"
read -sp '' promptvar
echo ''
NEXTIP=$(echo ${NETOCT}${NEWFTH}${NTMASK})
echo ''

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
