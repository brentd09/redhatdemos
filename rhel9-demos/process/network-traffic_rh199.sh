#!/bin/bash

sender() {
  #!/bin/bash

  # Replace with the desired destination IP and port
  DEST_IP="serverb"
  DEST_PORT="12345"

  echo "Sending traffic to $DEST_IP on port $DEST_PORT..."

  # Create a 1 GB file to send (adjust as needed), and send it using netcat
  dd if=/dev/zero bs=1M count=10240 | nc $DEST_IP $DEST_PORT
}

receiver() {
  #!/bin/bash

  # Replace with the desired listening port
  LISTEN_PORT="12345"
  firewall-cmd --add-port=12345/tcp    
  echo "Listening for incoming data on port $LISTEN_PORT..."

  # Listen for incoming connections and discard the data
  nc -l -p $LISTEN_PORT > /dev/null
}

if [[ $1 =~ rec ]];then
  receiver
elif [[ $1 =~ sen ]];then
  sender
else
  echo 'Usage: network-traffic [ sender | receiver ]'
  exit 1
fi
