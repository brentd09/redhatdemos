#!/bin/bash
echo -n 'newgrp wheel root'
read -sp '' promptvar
echo ''
echo This actully forks a new shell with the wheel group as the primary
echo If you exit this new shell you will find that the parent shell groups have not been changed
echo *After executing this command type "id" to see the group change and then "exit" to return to the parent shell*
read -sp '' promptvar
newgrp wheel student

echo -n 'id'
read -sp '' promptvar
echo ''
id
echo ''


