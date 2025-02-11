#!/bin/bash
echo -n "THIS_MACHINE=$(hostname)"
read -sp '' promptvar
echo ''
THIS_MACHINE=$(hostname)
echo ''

echo -n "hostname"
read -sp '' promptvar
echo ''
hostname
echo ''

echo -n "hostname -I"
read -sp '' promptvar
echo ''
hostname -I
echo ''

echo -n "hostnamectl hostname host.example.com"
read -sp '' promptvar
echo ''
hostnamectl hostname host.example.com
echo ''

echo -n "hostnamectl status"
read -sp '' promptvar
echo ''
hostnamectl status
echo ''

echo -n "cat /etc/hosts"
read -sp '' promptvar
echo ''
cat /etc/hosts
echo ''

echo -n "cat resolv.conf"
read -sp '' promptvar
echo ''
cat resolv.conf
echo ''

echo -n "dig serverb"
read -sp '' promptvar
echo ''
dig serverb
echo ''

echo -n "hostnamectl hostname $THIS_MACHINE"
read -sp '' promptvar
echo ''
hostnamectl hostname $THIS_MACHINE
echo ''
