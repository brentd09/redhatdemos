#!/bin/bash

echo useradd demouser1
sudo useradd demouser1
read -sp promptvar

echo Add user to the wheel group
echo usermod -aG wheel demouser1
sudo usermod -aG wheel demouser1
read -sp promptvar

echo Determine which groups a user is a member of
echo id demouser1
id demouser1
read -sp promptvar

echo Check user account settings
echo chage -l demouser1
sudo chage -l demouser1
read -sp promptvar

echo Configure 
echo Max Password Age: 40 days
echo Min Days Before Password Changes: 2 days
echo After Password Expires, Number of Days Before Account Lockout: 3 Days
echo Number of Days Before Expiry That Warnings Start: 7 days
echo Date When Account Will be Disabled: 2027-12-30
echo ''
echo chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1
sudo chage -m 2 -M 40 -I 3 -W 7 -E '2027-12-30' demouser1
