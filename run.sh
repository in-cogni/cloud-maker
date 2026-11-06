#!/bin/bash
echo "Генерируем образ с настрйками cloud-init..."
cloud-localds seed.iso user-data meta-data

echo "Скачиваем образ Ubuntu..."
wget -nc https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img
cp ubuntu-22.04-minimal-cloudimg-amd64.img base-vm.qcow2

echo "Запускаем ВМ..."
 
virt-install --name base-vm --memory 512 --vcpus 1 --disk path=base-vm.qcow2,format=qcow2 --import --os-variant ubuntu22.04 --network default --noautoconsole

echo "Машина создана! Проверяем статус:"
virsh list
