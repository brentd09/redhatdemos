#!/bin/bash

echo Check selinux booleans
echo getsebool -a
read -sp '' promptvar
getsebool -a
echo ''
echo One of these booleans can allow the httpd web server to access home directories
getsebool -a | grep httpd_enable_homedirs
echo ''
