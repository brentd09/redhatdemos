sudo mkdir -p /demo/devops-dir
sudo chmod -R o=rwx /demo/ 

echo touch /demo/devops-dir/demofile
sudo -u devops touch /demo/devops-dir/demofile

echo list directory and file ownership
tree -ug /demo
