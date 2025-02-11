#!/bin/bash

me=$(whoami)


if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
  exit 1
fi

NIC=$(ip link show | grep -P '^\d+:' | sed 's/ //g' | grep -vi loopback | awk -F: '{print $2}')

# Check the Status of firewalld:
echo -n "systemctl status firewalld"
read -sp '' promptvar
echo  ''
sudo systemctl status firewalld
echo  ''

# Start/Stop/Restart firewalld:
echo -n "systemctl start firewalld"
read -sp '' promptvar
echo  ''
systemctl start firewalld
echo ''

echo -n "systemctl stop firewalld"
read -sp '' promptvar
echo  ''
systemctl stop firewalld
echo ''

echo -n "systemctl restart firewalld"
read -sp '' promptvar
echo  ''
systemctl restart firewalld
echo ''

# Get Active Zones:
echo -n "firewall-cmd --get-active-zones"
read -sp '' promptvar
echo  ''
firewall-cmd --get-active-zones
echo -n ''

# Get Default Zone:
echo -n "firewall-cmd --get-default-zone"
read -sp '' promptvar
echo  ''
firewall-cmd --get-default-zone
echo   ''

# List All Zones:
echo -n "firewall-cmd --get-zones"
read -sp '' promptvar
echo  ''
firewall-cmd --get-zones
echo   ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
firewall-cmd --zone=public --list-all
echo  ''

# Change the Zone of an Interface:
echo -n "firewall-cmd --zone=public --change-interface=$NIC"
read -sp '' promptvar
echo  ''
firewall-cmd --zone=public --change-interface=$NIC
echo  ''

# Set Default Zone:
echo -n "firewall-cmd --set-default-zone=public"
read -sp '' promptvar
echo  ''
firewall-cmd --set-default-zone=public
echo  ''

# Add a Service to a Zone:
echo -n "firewall-cmd --zone=public --add-service=http"
read -sp '' promptvar
echo  ''
firewall-cmd --zone=public --add-service=http
echo   ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo  ''

# Remove a Service from a Zone:
echo -n "firewall-cmd --zone=public --remove-service=http"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --remove-service=http
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo  ''

# Add a Port to a Zone:
echo -n "firewall-cmd --zone=public --add-port=389/tcp"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --add-port=389/tcp
echo  ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo ''

# Remove a Port from a Zone:
echo -n "firewall-cmd --zone=public --remove-port=389/tcp"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --remove-port=389/tcp
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo ''

# Make Rules Permanent:
echo -n "firewall-cmd --zone=public --add-service=http --permanent"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --add-service=http --permanent
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo ''

# Reload Firewall Rules:
echo -n "firewall-cmd --reload"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --reload
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-all
echo ''

# Add Rich Rules:
echo -n "firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'
echo ''

# List All Rich Rules:
echo -n "firewall-cmd --zone=public --list-rich-rules"
read -sp '' promptvar
echo  ''
sudo firewall-cmd --zone=public --list-rich-rules
echo ''

# Check Firewall Logs:
echo -n "journalctl -f"
read -sp '' promptvar
echo  ''
sudo journalctl -f
echo ''
