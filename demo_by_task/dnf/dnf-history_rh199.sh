dnf install httpd
grep SUBDEBUG /var/log/def.rpm.log
dnf history
dnf history | grep 'install httpd'
history_num=$(dnf history | grep 'install httpd' | awk '{print $1}')
dnf history undo $history_num
