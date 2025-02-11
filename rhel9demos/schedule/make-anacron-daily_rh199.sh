#!/bin/bash

cat /etc/anacrontab
echo ''

echo Create a script in /etc/cron.daily/log-datetime.sh
echo '#!/bin/bash' > /etc/cron.daily/log-datetime.sh
echo '' >> /etc/cron.daily/log-datetime.sh
echo 'for a in 1 2 3 4 5; do' >> /etc/cron.daily/log-datetime.sh
echo '  date >> /usr/tmp/my_date.log' >> /etc/cron.daily/log-datetime.sh
echo '  sleep 2' >> /etc/cron.daily/log-datetime.sh
echo 'done' >> /etc/cron.daily/log-datetime.sh

echo -n 'cat /etc/cron.daily/log-datetime.sh'
read -sp '' promptvar
echo ''
cat /etc/cron.daily/log-datetime.sh
echo ''

echo -n 'chmod 755 /etc/cron.daily/log-datetime.sh'
read -sp '' promptvar
echo ''
chmod 755 /etc/cron.daily/log-datetime.sh
echo ''

echo Forcing anacron to run now
echo -n 'anacron -fnd'
read -sp '' promptvar
echo ''
anacron -fnd
echo ''

echo -n 'ls -l /etc/cron.daily/log-datetime.sh'
read -sp '' promptvar
echo ''
ls -l /etc/cron.daily/log-datetime.sh
echo ''

echo -n 'cat /etc/cron.daily/log-datetime.sh'
read -sp '' promptvar
echo ''
cat /etc/cron.daily/log-datetime.sh
echo ''

echo -n 'cat /usr/tmp/mydate.log'
read -sp '' promptvar
echo ''
cat /usr/tmp/mydate.log
echo ''
