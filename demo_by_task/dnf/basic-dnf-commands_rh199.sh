#!/bin/bash
echo -n "dnf list --installed"
read -sp '' promptvar
echo ''
dnf list --installed
echo ''

echo -n "dnf list --available"
read -sp '' promptvar
echo ''
dnf list --available
echo ''

echo -n "dnf info zip"
read -sp '' promptvar
echo ''
dnf info zip
echo ''

echo -n "dnf provides zip"
read -sp '' promptvar
echo ''
dnf provides zip
echo ''

# Search for a keyword
echo -n "dnf search zip"
read -sp '' promptvar
echo ''
dnf search zip
echo ''

echo -n "dnf update"
read -sp '' promptvar
echo ''
dnf update
echo ''

# List the files installed with from this rpm
echo -n "dnf repoquery zip --list"
read -sp '' promptvar
echo ''
dnf repoquery zip --list
echo ''

echo -n "dnf repoquery zip --location"
read -sp '' promptvar
echo ''
dnf repoquery zip --location
echo ''

echo "dnf install httpd"
read -sp '' promptvar
dnf install httpd
echo ''
