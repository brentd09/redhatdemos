echo -n "dnf install httpd"
read -sp '' promptvar
echo ''
dnf install httpd
echo ''

echo -n "grep SUBDEBUG /var/log/dnf.rpm.log"
read -sp '' promptvar
echo ''
grep SUBDEBUG /var/log/dnf.rpm.log
echo ''

echo -n "dnf history"
read -sp '' promptvar
echo ''
dnf history
echo ''

history_num=$(dnf history | grep 'install httpd' | head -n 1  | awk '{print $1}')

echo -n "dnf history undo $history_num"
read -sp '' promptvar
echo ''
dnf history undo $history_num
echo ''
