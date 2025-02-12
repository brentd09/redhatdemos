vmnames="vm1 vm2"
now=$(date +"%X %d-%b-%Y")

for vm in $vmnames; do
  snaps=$(virsh snapshot-list $vm --name)
  for snap in $snaps; do
    virsh snapshot-delete --domain $vm --snapshotname $snap
  done
  virsh snapshot-create-as --domain $vm --name ReadyForLabs --atomic 
done  
