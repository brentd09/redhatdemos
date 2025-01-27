#!/bin/bash

echo useradd demouser1
sudo useradd demouser1
echo ''

echo Add user to the wheel group
echo usermod -aG wheel demouser1
sudo usermod -aG wheel demouser1
echo ''

echo Determine which groups a user is a member of
echo id testuser1
id testuser1
echo ''

echo Check user account settings
echo chage -l testuser1
chage -l testuser1
