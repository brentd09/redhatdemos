#!/bin/bash

echo Check selinux enforcement
echo getenforce
read -sp '' promptvar
getenforce
echo ''
