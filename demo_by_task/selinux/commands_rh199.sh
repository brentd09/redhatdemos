#!/bin/bash

echo Check selinux enforcement
echo -n 'getenforce'
read -sp '' promptvar
echo ''
getenforce
echo ''

echo Set selinux enforcement to permissive
echo -n 'setenforce permissive'
read -sp '' promptvar
echo ''
sudo setenforce permissive
echo ''

echo Set selinux enforcement to permissive
echo -n 'getenforce'
read -sp '' promptvar
echo ''
getenforce
echo ''

echo Set selinux enforcement to enforcing
echo setenforce enforcing
read -sp '' promptvar
sudo setenforce enforcing
echo ''

echo Set selinux enforcement to permissive
echo -n 'getenforce'
read -sp '' promptvar
echo ''
getenforce
echo ''
