#!/bin/bash

me=$(whoami)


if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
  exit 1
fi

NIC=$(ip link show | grep -P '^\d+:' | sed 's/ //g' | grep -vi loopback | awk -F: '{print $2}')

# Check the Status of firewalld:
echo -n "systemctl status firewalld"
echo  ''
read -sp '' promptvar
sudo systemctl status firewalld
echo  ''

# Start/Stop/Restart firewalld:
echo -n "systemctl start firewalld"
echo  ''
read -sp '' promptvar
sudo systemctl start firewalld
echo ''

echo -n "systemctl stop firewalld"
echo  ''
read -sp '' promptvar
sudo systemctl stop firewalld
echo ''

echo -n "systemctl restart firewalld"
echo  ''
read -sp '' promptvar
sudo systemctl restart firewalld
echo ''

# Get Active Zones:
echo -n "firewall-cmd --get-active-zones"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --get-active-zones
echo -n ''

# Get Default Zone:
echo -n "firewall-cmd --get-default-zone"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --get-default-zone
echo   ''

# List All Zones:
echo -n "firewall-cmd --get-zones"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --get-zones
echo   ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo  ''

# Change the Zone of an Interface:
echo -n "firewall-cmd --zone=public --change-interface=$NIC"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --change-interface=$NIC
echo  ''

# Set Default Zone:
echo -n "firewall-cmd --set-default-zone=public"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --set-default-zone=public
echo  ''

# Add a Service to a Zone:
echo -n "firewall-cmd --zone=public --add-service=http"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-service=http
echo   ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo  ''

# Remove a Service from a Zone:
echo -n "firewall-cmd --zone=public --remove-service=http"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --remove-service=http
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo  ''

# Add a Port to a Zone:
echo -n "firewall-cmd --zone=public --add-port=389/tcp"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-port=389/tcp
echo  ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Remove a Port from a Zone:
echo -n "firewall-cmd --zone=public --remove-port=389/tcp"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --remove-port=389/tcp
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Make Rules Permanent:
echo -n "firewall-cmd --zone=public --add-service=http --permanent"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-service=http --permanent
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Reload Firewall Rules:
echo -n "firewall-cmd --reload"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --reload
echo ''

# List All Rules in a Specific Zone:
echo -n "firewall-cmd --zone=public --list-all"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Add Rich Rules:
echo -n "firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'
echo ''

# List All Rich Rules:
echo -n "firewall-cmd --zone=public --list-rich-rules"
echo  ''
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-rich-rules
echo ''

# Check Firewall Logs:
echo -n "journalctl -f"
echo  ''
read -sp '' promptvar
sudo journalctl -f
echo ''
