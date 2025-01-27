#!/bin/bash

echo useradd demouser1
read -sp '' promptvar
sudo useradd demouser1
echo ''

echo Add user to the wheel group
echo usermod -aG wheel demouser1
read -sp '' promptvar
sudo usermod -aG wheel demouser1
echo ''

echo Determine which groups a user is a member of
echo id demouser1
read -sp '' promptvar
id demouser1
echo ''

echo Check user account settings
echo chage -l demouser1
read -sp '' promptvar
sudo usermod -aG wheel demouser1
sudo chage -l demouser1
echo ''


echo Configure 
echo Max Password Age: 40 days
echo Min Days Before Password Changes: 2 days
echo After Password Expires, Number of Days Before Account Lockout: 3 Days
echo Number of Days Before Expiry That Warnings Start: 7 days
echo Date When Account Will be Disabled: 2027-12-30
echo ''
echo chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1
read -sp '' promptvar
sudo chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1
sudo chage -l demouser1
echo ''

echo Force password change on next login
echo chage -d 0 demouser1
read -sp '' promptvar
sudo chage -d 0 demouser1
echo ''

# These two methods do the same thing, they place an ! at the start of the password hash in the /etc/shadow file
echo Lock user account
echo passwd -l demouser1 or
echo usermod -L demouser1
read -sp '' promptvar
sudo usermod -L demouser1
echo ''


