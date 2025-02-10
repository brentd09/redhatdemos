#!/bin/bash

me=$(whoami)
if [[ $me != root ]];then
  echo 'Usage: Must be run as root on serverb'
fi

this_machine=$(hostname)
if [[ $this_machine != servera ]];then
  echo 'Usage: Must be run as root on servera'
  exit1
fi

echo 'Installing httpd'
dnf install -y httpd


echo -n "systemctl list-units --type=service"
read -sp '' promptvar
echo ''
systemctl list-units --type=service
echo ''

# List regardless of activation state
echo -n "systemctl list-units --type=service --all"
read -sp '' promptvar
echo ''
systemctl list-units --type=service --all
echo ''

echo -n "systemctl"
read -sp '' promptvar
echo ''
systemctl
echo ''

echo -n "systemctl list-unit-files --type=service"
read -sp '' promptvar
echo ''
systemctl list-unit-files --type=service
echo ''

echo -n "systemctl status httpd"
read -sp '' promptvar
echo ''
systemctl status httpd
echo ''

echo -n "systemctl enable --now httpd"
read -sp '' promptvar
echo ''
systemctl enable --now httpd
echo ''

echo -n "systemctl stop httpd"
read -sp '' promptvar
echo ''
systemctl stop httpd
echo ''

echo -n "systemctl start httpd"
read -sp '' promptvar
echo ''
systemctl start httpd
echo ''

echo -n "systemctl restart httpd"
read -sp '' promptvar
echo ''
systemctl restart httpd
echo ''

echo -n "systemctl reload httpd"
read -sp '' promptvar
echo ''
systemctl reload httpd
echo ''

echo -n "systemctl mask httpd"
read -sp '' promptvar
echo ''
systemctl mask httpd
echo ''

echo -n "systemctl start httpd"
read -sp '' promptvar
echo ''
systemctl start httpd
echo ''

echo -n "systemctl enable httpd"
read -sp '' promptvar
echo ''
systemctl enable httpd
echo ''

echo -n "systemctl unmask httpd"
read -sp '' promptvar
echo ''
systemctl unmask httpd
echo ''

echo -n "systemctl start httpd"
read -sp '' promptvar
echo ''
systemctl start httpd
echo ''

# After configuring unit files and systemd configuration you need to run daemon-reload
echo -n "systemctl daemon-reload"
read -sp '' promptvar
echo ''
systemctl daemon-reload
echo ''

echo -n "systemctl is-active httpd"
read -sp '' promptvar
echo ''
systemctl is-active httpd
echo ''

echo -n "systemctl is-enabled httpd"
read -sp '' promptvar
echo ''
systemctl is-enabled httpd
echo ''


