# This shows that when a file or directory is created the owner and group of the new file are inherited from the user by default
sudo mkdir -p /demo/devops-dir
sudo chmod -R o=rwx /demo/ 

echo Creating demofile as the devops user
sudo -u devops touch /demo/devops-dir/demofile

echo list directory and file ownership
tree -ug /demo
