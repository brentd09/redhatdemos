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



chmod 777 /etc/cron.daily/log-datetime.sh

echo Forcing anacron to run now
anacron -fnd
