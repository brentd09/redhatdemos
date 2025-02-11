#!/bin/bash

echo 'Simulate running the nmcli command as the student user'
echo -n "sudo -u student -i nmcli gen permissions"
read -sp '' promptvar
echo ''
sudo -u student -i nmcli gen permissions
echo ''

echo -n "nmcli gen permissions"
read -sp '' promptvar
echo ''
nmcli gen permissions
echo ''
