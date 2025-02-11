#!/bin/bash

echo -n "nmcli gen permissions"
read -sp '' promptvar
echo ''
nmcli gen permissions
echo ''
