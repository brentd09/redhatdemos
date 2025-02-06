
mkdir -p /var/log/journal
sed -i "s/.*Storage=.\+/Storage=persistent/g" /etc/systemd/journald.conf
less /etc/systemd/journald.conf
systemctl restart systemd-journald
ls /var/log/journal

# If the persistent logs are not created

grep 'Storage=' /etc/systemd/journald.conf
# Should show and uncommented Storage=Persistent

chown root:systemd-journal /var/log/journal/
chmod 2775 /var/log/journal
systemctl restart systemd-journald

journalctl --flush
journalctl --verify
logger Testing the persistent journal
journalctl -n 10
 
