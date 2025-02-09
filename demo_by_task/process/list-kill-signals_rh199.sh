#!/bin/bash
echo Show kill signals

echo -n "kill -l"
read -sp '' promptvar
echo ''
kill -l
echo ''
