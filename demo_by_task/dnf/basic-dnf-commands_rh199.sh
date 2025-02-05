#!/bin/bash
echo "dnf list --installed"
read -sp '' promptvar
dnf list --installed
echo ''

echo "dnf list --available"
read -sp '' promptvar
dnf list --available
echo ''

echo "dnf info zip"
read -sp '' promptvar
dnf info zip
echo ''

echo "dnf provides zip"
read -sp '' promptvar
dnf provides zip
echo ''

# Search for a keyword
echo "dnf search zip"
read -sp '' promptvar
dnf search zip
echo ''

echo "dnf update"
read -sp '' promptvar
dnf update
echo ''

# List the files installed with from this rpm
echo "dnf repoquery zip --list"
read -sp '' promptvar
dnf repoquery zip --list
echo ''

echo "dnf repoquery zip --location"
read -sp '' promptvar
dnf repoquery zip --location
echo ''

echo "dnf install httpd"
read -sp '' promptvar
dnf install httpd
echo ''
