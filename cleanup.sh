#!/bin/bash
VM_NAME=${1:-my-vm}

echo "Удаляем ВМ: $VM_NAME..."
virsh destroy base-vm
virsh undefine base-vm
rm -f base-vm.qcow2
rm -f seed.iso
