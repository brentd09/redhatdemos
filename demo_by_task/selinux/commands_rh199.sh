#!/bin/bash

echo Check selinux enforcement
echo getenforce
read -sp '' promptvar
getenforce
echo ''

echo Set selinux enforcement to permissive
echo setenforce permissive
read -sp '' promptvar
sudo setenforce permissive
getenforce
echo ''

echo Set selinux enforcement to enforcing
echo setenforce enforcing
read -sp '' promptvar
sudo setenforce enforcing
getenforce
echo ''
