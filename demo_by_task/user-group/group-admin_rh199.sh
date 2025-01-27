#!/bin/bash

echo Add new group
echo useradd demogroup1
read -sp '' promptvar
sudo useradd demogroup1
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

echo Swap a supplimentary group to the primary group
echo id 
id
echo newgrp -g wheel student 
read -sp '' promptvar
sudo newgrp -g wheel student
echo id 
id
echo ''
