#! /bin/bash
echo "This generates the fingerprints of the public keys"
echo "--------------------------------------------------"
for pubkey in $(ls /etc/ssh/*host*.pub); do
ssh-keygen -lf $pubkey | awk '{ print $4 " " $2}'
done
