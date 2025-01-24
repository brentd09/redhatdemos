#!/bin/bash

usage() {
  echo "Usage: $0 [ --install | --remove ]"
  exit 1
}

if [ $# -ne 1  ]; then
  usage
fi

option_lc=${1,,}

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


# Set up the script for the UNIT FILE
cat << EOF2 > /usr/bin/myscript.sh
#!/bin/bash
while true; do
  echo -n "\$(date +%T) " >> /usr/tmp/service.log
  sleep 2
done
EOF2

chmod 777 /usr/bin/myscript.sh
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
echo 'Check out the following files:'
echo '/etc/systemd/system/myscript.service'
echo '/usr/bin/myscript.sh'
