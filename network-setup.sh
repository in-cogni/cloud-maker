#!/bin/bash 
BRIDGE_NAME="br0"

echo "Создаем системный сетевой мост $BRIDGE_NAME..."
if ! ip link show $BRIDGE_NAME &>/dev/null; then
    sudo ip link add name $BRIDGE_NAME type bridge
    sudo ip link set dev $BRIDGE_NAME up
    echo "Мост $BRIDGE_NAME успешно создан и поднят!"
else
    echo "Мост $BRIDGE_NAME уже существует."
fi
