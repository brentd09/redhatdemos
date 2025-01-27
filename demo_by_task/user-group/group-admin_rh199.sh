#!/bin/bash

echo Add new group
echo groupadd demogroup1
read -sp '' promptvar
sudo groupadd demogroup1
echo ''

# groupmod does not allow group membership changes just Group Nme and GID changes
echo Change group name
echo groupmod -n demogroup2 demogroup1
read -sp '' promptvar
sudo groupmod -n demogroup2 demogroup1
echo ''

echo Change group GID
echo groupmod -g 1100 demogroup2
read -sp '' promptvar
sudo groupmod -g 1100 demogroup2
echo ''
