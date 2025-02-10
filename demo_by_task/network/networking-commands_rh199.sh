#!/bin/bash
echo -n "dnf install -y httpd"
read -sp '' promptvar
echo ''
dnf install -y httpd
echo ''

echo -n "systemctl enable --now httpd"
read -sp '' promptvar
echo ''
systemctl enable --now httpd
echo ''

#NIC=$(ip link show | grep -v LOOPBACK | awk -F': ' '{print $2}' | grep -v ^$)
echo "Show interface information"
echo -n "ip link show"
read -sp '' promptvar
echo ''
ip link show
echo ''

echo -n "ip link show $NIC"
read -sp '' promptvar
echo ''
ip link show $NIC
echo ''

echo "Show IP address information"
echo -n "ip addr show"
read -sp '' promptvar
echo ''
ip addr show
echo ''

echo -n "ip addr show $NIC"
read -sp '' promptvar
echo ''
ip addr show $NIC
echo ''

echo -n "ping -c 4 serverb"
read -sp '' promptvar
echo ''
ping -c 4 serverb
echo ''

echo -n "ip route"
read -sp '' promptvar
echo ''
ip route
echo ''

echo -n "tracepath access.redhat.com"
read -sp '' promptvar
echo ''
tracepath access.redhat.com
echo ''

echo -n "ss"
read -sp '' promptvar
echo ''
ss
echo ''

echo -n "ss -tlnp"
read -sp '' promptvar
echo ''
ss -tlnp
echo ''
