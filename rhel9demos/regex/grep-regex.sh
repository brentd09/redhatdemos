#!/bin/bash
echo -n "grep 'code' linux-poem.txt"
read -sp '' promptvar
echo ''
grep 'code' linux-poem.txt
echo ''

echo -n "grep 'the' linux-poem.txt"
read -sp '' promptvar
echo ''
grep 'the' linux-poem.txt
echo ''

echo -n "grep -i 'the' linux-poem.txt"
read -sp '' promptvar
echo ''
grep -i 'the' linux-poem.txt
echo ''

echo -n "grep -i '^the' linux-poem.txt"
read -sp '' promptvar
echo ''
grep -i '^the' linux-poem.txt
echo ''

echo -n "grep '.' linux-poem.txt"
read -sp '' promptvar
echo ''
grep '.' linux-poem.txt
echo ''

echo -n "grep '.$' linux-poem.txt"
read -sp '' promptvar
echo ''
grep '.$' linux-poem.txt
echo ''

echo -n "grep '\.$' linux-poem.txt"
read -sp '' promptvar
echo ''
grep '\.$' linux-poem.txt
echo ''

echo -n "grep -iP '(?<=joined )the' linux-poem.txt"
read -sp '' promptvar
echo ''
grep -iP '(?<=joined )the' linux-poem.txt
echo ''

echo -n "grep -v '^$' linux-poem.txt"
read -sp '' promptvar
echo ''
grep -v '^$' linux-poem.txt
echo ''

echo -n "grep -iv 'a' linux-poem.txt"
read -sp '' promptvar
echo ''
grep -iv 'a' linux-poem.txt
echo ''
