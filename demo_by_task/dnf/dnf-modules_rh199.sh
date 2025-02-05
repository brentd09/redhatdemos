echo "dnf module list"
read -sp '' promptvar
dnf module list
echo ''

echo "dnf module list nodejs"
read -sp '' promptvar
dnf module list nodejs
echo ''

echo "dnf module list provides nodejs"
read -sp '' promptvar
dnf module list provides nodejs
echo ''
