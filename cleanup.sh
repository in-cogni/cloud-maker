#!/bin/bash
virsh destroy base-vm
virsh undefine base-vm
rm -f base-vm.qcow2
rm -f seed.iso
