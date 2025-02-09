# This shows that when a file or directory is created the owner and group of the new file are inherited from the user by default
echo -n "sudo mkdir -p /demo/devops-dir"
read -sp '' promptvar
echo ''
sudo mkdir -p /demo/devops-dir
echo ''

echo -n "sudo chmod -R o=rwx /demo/"
read -sp '' promptvar
echo ''
sudo chmod -R o=rwx /demo/
echo ''

echo Creating demofile as the devops user
echo -n "sudo -u devops touch /demo/devops-dir/demofile"
read -sp '' promptvar
echo ''
sudo -u devops touch /demo/devops-dir/demofile
echo ''

echo list directory and file ownership
echo -n "tree -ug /demo"
read -sp '' promptvar
echo ''
tree -ug /demo
echo ''
