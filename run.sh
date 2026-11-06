#!/bin/bash

VM_NAME=${1:-my-vm}
VM_RAM=${2:-512}

echo "Создаем ВМ с именем: $VM_NAME и памятью: $VM_RAM MB"

cloud-localds seed.iso user-data meta-data

wget -nc https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img
cp ubuntu-22.04-minimal-cloudimg-amd64.img ${VM_NAME}.qcow2

 
virt-install --name base-vm --memory 512 --vcpus 1 --disk path=base-vm.qcow2,format=qcow2 --import --os-variant ubuntu22.04 --network default --noautoconsole

virsh list
