mkdir -p /var/log/journal
sed -i "/s/Storage=.\+/Storage=persistent/g" /etc/systemd/journald.conf
systemctl restart systemd-journald
