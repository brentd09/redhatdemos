#!/bin/bash

echo Add new user 
echo -n 'useradd demouser1'
read -sp '' promptvar
echo ''
sudo useradd demouser1
echo ''

echo Add user to the wheel group
echo -n 'usermod -aG wheel demouser1'
read -sp '' promptvar
echo ''
sudo usermod -aG wheel demouser1
echo ''

echo Determine which groups a user is a member of
echo -n 'id demouser1'
read -sp '' promptvar
echo ''
id demouser1
echo ''

echo Check user account settings
echo -n 'chage -l demouser1'
read -sp '' promptvar
echo ''
sudo usermod -aG wheel demouser1
sudo chage -l demouser1
echo ''


echo Configure User Account Settings
echo Max Password Age: 40 days
echo Min Days Before Password Changes: 2 days
echo After Password Expires, Number of Days Before Account Lockout: 3 Days
echo Number of Days Before Expiry That Warnings Start: 7 days
echo Date When Account Will be Disabled: 2027-12-30
echo ''
echo -n 'chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1'
read -sp '' promptvar
echo ''
sudo chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1
sudo chage -l demouser1
echo ''

echo Force password change on next login
echo -n 'chage -d 0 demouser1'
read -sp '' promptvar
echo ''
sudo chage -d 0 demouser1
echo ''

# These two methods do the same thing, they place an ! at the start of the password hash in the /etc/shadow file
echo Lock user account
echo passwd -l demouser1 or
echo -n 'usermod -L demouser1'
read -sp '' promptvar
echo ''
sudo usermod -L demouser1
echo ''

echo List the default login settings
echo -n 'less /etc/login.defs'
read -sp '' promptvar
echo ''
less /etc/login.defs
echo ''
