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

echo -n "nmcli device show"
read -sp '' promptvar
echo ''
nmcli device show
echo ''

echo -n "nmcli device show $DEVICE"
read -sp '' promptvar
echo ''
nmcli device show $DEVICE
echo ''

echo -n "nmcli conn show"
read -sp '' promptvar
echo ''
nmcli conn show
echo ''

echo -n "nmcli connection add con-name demo1 ipv4.addresses $NEXTIP ipv4.dns $DNSIP connection.interface-name $DEVICE type ethernet"
read -sp '' promptvar
echo ''
nmcli connection add con-name demo1 ipv4.addresses $NEXTIP ipv4.dns $DNSIP connection.interface-name $DEVICE type ethernet
echo ''

echo -n "nmcli conn show"
read -sp '' promptvar
echo ''
nmcli conn show
echo ''

echo -n "nmcli conn up demo1"
read -sp '' promptvar
echo ''
nmcli conn up demo1
echo ''

echo -n "nmcli conn show"
read -sp '' promptvar
echo ''
nmcli conn show
echo ''

echo -n "nmcli conn show demo1 | grep -i 'ipv4\.addresses'"
read -sp '' promptvar
echo ''
nmcli conn show demo1 | grep -i 'ipv4\.addresses'
echo ''


echo -n "nmcli connection mod demo1 +ipv4.addresses 10.12.13.14 "
read -sp '' promptvar
echo ''
nmcli connection mod demo1 +ipv4.addresses 10.12.13.14
echo ''

echo -n "nmcli conn show demo1 | grep -i 'ipv4\.addresses'"
read -sp '' promptvar
echo ''
nmcli conn show demo1 | grep -i 'ipv4\.addresses'
echo ''

echo -n "nmcli connection mod demo1 -ipv4.addresses 10.12.13.14 "
read -sp '' promptvar
echo ''
nmcli connection mod demo1 -ipv4.addresses 10.12.13.14
echo ''

echo -n "nmcli conn show demo1 | grep -i 'ipv4\.addresses'"
read -sp '' promptvar
echo ''
nmcli conn show demo1 | grep -i 'ipv4\.addresses'
echo ''

echo -n "nmcli conn up $DEVICE"
read -sp '' promptvar
echo ''
nmcli conn up $DEVICE
echo ''

echo -n "nmcli conn show"
read -sp '' promptvar
echo ''
nmcli conn show
echo ''


echo -n "nmcli conn show $DEVICE | grep -i 'ipv4\.addresses'"
read -sp '' promptvar
echo ''
nmcli conn show $DEVICE | grep -i 'ipv4\.addresses'
echo ''


echo -n "nmcli conn delete demo1"
read -sp '' promptvar
echo ''
nmcli conn delete demo1
echo ''


echo -n "nmcli conn show"
read -sp '' promptvar
echo ''
nmcli conn show
echo ''
