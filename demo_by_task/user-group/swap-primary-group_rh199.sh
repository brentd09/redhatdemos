#!/bin/bash
echo newgrp wheel student
echo This actully forks a new shell with the wheel group as the primary
echo If you exit this new shell you will find that the parent shell groups have not been changed
read -sp '' promptvar
newgrp wheel student
echo ''
