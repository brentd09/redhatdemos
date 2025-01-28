#!/bin/bash

echo Check selinux enforcement
echo getenforce
read -sp '' promptvar
getenforce
echo ''

echo Set selinux enforcement
echo setenforce permissive
read -sp '' promptvar
setenforce permissive
echo ''
