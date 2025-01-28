#!/bin/bash

echo Check selinux booleans
echo getsebool -l
read -sp '' promptvar
getsebool -l
echo ''
