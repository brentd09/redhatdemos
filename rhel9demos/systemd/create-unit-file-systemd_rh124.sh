#!/bin/bash

usage() {
  echo "Usage: $0 [ --install | --remove ]"
  exit 1
}

if [ $# -ne 1  ]; then
  usage
fi

option_lc=${1,,}   #    ${1,,} converts to lowercase

case "$option_lc" in
  "--install" )
# Set up the UNIT FILE
cat << EOF1 > /etc/systemd/system/myscript.service
[Unit]
Description=My bash script service
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/myscript.sh
ExecStop=/bin/kill -s TERM $MAINPID
Restart=on-failure
User=root
Group=root

[Install]
WantedBy=multi-user.target
EOF1

# vi the /etc/systemd/system/myscript.service
echo -n "vim  /etc/systemd/system/myscript.service"
read -sp '' promptvar
echo  ''
vim /etc/systemd/system/myscript.service
echo  ''

# Set up the script for the UNIT FILE
cat << EOF2 > /usr/bin/myscript.sh
#!/bin/bash
while true; do
  echo -n "\$(date +%T) " >> /usr/tmp/service.log
  sleep 2
done
EOF2

# vi /usr/bin/myscript.sh
echo -n "vim /usr/bin/myscript.sh"
read -sp '' promptvar
echo  ''
vim /usr/bin/myscript.sh
echo  ''

# chmod 755 /usr/bin/myscript.sh
echo -n "chmod 755 /usr/bin/myscript.sh"
read -sp '' promptvar
echo  ''
chmod 755 /usr/bin/myscript.sh
echo  ''

# enable unit file
echo -n "systemctl enable --now myscript.service"
read -sp '' promptvar
echo  ''
systemctl enable --now myscript.service
echo  ''

# tail follow the log file
echo -n "tail -f /usr/tmp/service.log"
read -sp '' promptvar
echo  ''
tail -f /usr/tmp/service.log
echo  ''

;;
  "--remove" )
    status=$(systemctl status myscript.service &> /dev/null )
    if [ $? -eq 0 ]; then
      systemctl disable --now myscript.service &> /dev/null
      rm -f /etc/systemd/system/myscript.service &> /dev/null
      rm -f /usr/bin/myscript.sh &> /dev/null
      rm -f /usr/tmp/service.log
    fi
;;
esac

sleep 10
systemctl daemon-reload
systemctl daemon-reload
echo 'These files have been removed:'
echo '/etc/systemd/system/myscript.service'
echo '/usr/bin/myscript.sh'
echo '/usr/tmp/service.log'


