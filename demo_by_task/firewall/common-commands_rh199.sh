#!/bin/bash

me=$(whoami)


if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
  exit 1
fi

NIC=$(ip link show | grep -P '^\d+:' | sed 's/ //g' | grep -vi loopback | awk -F: '{print $2}')

# Check the Status of firewalld:
echo "sudo systemctl status firewalld"
read -sp '' promptvar
sudo systemctl status firewalld
echo ''

# Start/Stop/Restart firewalld:
echo "sudo systemctl start firewalld"
read -sp '' promptvar
sudo systemctl start firewalld
echo ''

echo "sudo systemctl stop firewalld"
read -sp '' promptvar
sudo systemctl stop firewalld
echo ''

echo "sudo systemctl restart firewalld"
read -sp '' promptvar
sudo systemctl restart firewalld
echo ''

# Get Active Zones:
echo "sudo firewall-cmd --get-active-zones"
read -sp '' promptvar
sudo firewall-cmd --get-active-zones
echo ''

# Get Default Zone:
echo "sudo firewall-cmd --get-default-zone"
read -sp '' promptvar
sudo firewall-cmd --get-default-zone
echo ''

# List All Zones:
echo "sudo firewall-cmd --get-zones"
read -sp '' promptvar
sudo firewall-cmd --get-zones
echo ''

# List All Rules in a Specific Zone:
echo "sudo firewall-cmd --zone=public --list-all"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Change the Zone of an Interface:
echo "sudo firewall-cmd --zone=public --change-interface=$NIC"
read -sp '' promptvar
sudo firewall-cmd --zone=public --change-interface=$NIC
echo ''

# Set Default Zone:
echo "sudo firewall-cmd --set-default-zone=public"
read -sp '' promptvar
sudo firewall-cmd --set-default-zone=public
echo ''

# Add a Service to a Zone:
echo "sudo firewall-cmd --zone=public --add-service=http"
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-service=http
echo ''

# List All Rules in a Specific Zone:
echo "sudo firewall-cmd --zone=public --list-all"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Remove a Service from a Zone:
echo "sudo firewall-cmd --zone=public --remove-service=http"
read -sp '' promptvar
sudo firewall-cmd --zone=public --remove-service=http
echo ''

# List All Rules in a Specific Zone:
echo "sudo firewall-cmd --zone=public --list-all"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Add a Port to a Zone:
echo "sudo firewall-cmd --zone=public --add-port=389/tcp"
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-port=389/tcp
echo ''

# List All Rules in a Specific Zone:
echo "sudo firewall-cmd --zone=public --list-all"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Remove a Port from a Zone:
echo "sudo firewall-cmd --zone=public --add-port=389/tcp"
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-port=389/tcp
echo ''

# List All Rules in a Specific Zone:
echo "sudo firewall-cmd --zone=public --list-all"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-all
echo ''

# Make Rules Permanent:
echo "sudo firewall-cmd --zone=public --remove-service=http --permanent"
read -sp '' promptvar
sudo firewall-cmd --zone=public --remove-service=http --permanent
echo ''

# Reload Firewall Rules:
echo "sudo firewall-cmd --reload"
read -sp '' promptvar
sudo firewall-cmd --reload
echo ''

# Add Rich Rules:
echo "sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'"
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-rich-rule='rule family="ipv4" source address="192.168.1.50" service name="http" accept'
echo ''

# List All Rich Rules:
echo "sudo firewall-cmd --zone=public --list-rich-rules"
read -sp '' promptvar
sudo firewall-cmd --zone=public --list-rich-rules
echo ''

# Enable Logging for a Zone:
echo "sudo firewall-cmd --zone=public --add-rich-rule='rule logging prefix="Firewall: " level="info" accept'"
read -sp '' promptvar
sudo firewall-cmd --zone=public --add-rich-rule='rule logging prefix="Firewall: " level="info" accept'
echo ''

# Check Firewall Logs:
echo "sudo journalctl -f"
read -sp '' promptvar
sudo journalctl -f
echo ''
