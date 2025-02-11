virsh snapshot-create-as --domain vm1 --name snap --description 'tmp snap' --atomic
if [[ $? -ne 0]];then
  exit 1
fi
virsh snapshot-create-as --domain vm2 --name snap --description 'tmp snap' --atomic
if [[ $? -ne 0]];then
  exit 2
fi
sleep 10
virsh snapshot-delete --domain vm1 --snapshotname ReadyForLabs 
if [[ $? -ne 0]];then
  exit 3
fi
virsh snapshot-delete --domain vm2 --snapshotname ReadyForLabs 
if [[ $? -ne 0]];then
  exit 4
fi
virsh snapshot-create-as --domain vm1 --name ReadyForLabs --description 'demo' --atomic 
if [[ $? -ne 0]];then
  exit 5
fi
virsh snapshot-create-as --domain vm2 --name ReadyForLabs --description 'demo' --atomic 
if [[ $? -ne 0]];then
  exit 6
fi
virsh snapshot-delete --domain vm1 --snapshotname  snap
if [[ $? -ne 0]];then
  exit 7
fi
virsh snapshot-delete --domain vm2 --snapshotname  snap
if [[ $? -ne 0]];then
  exit 8
fi
