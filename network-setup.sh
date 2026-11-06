#!/bin/bash 
BRIDGE_NAME="br0"

echo "Проверяем наличие сетевого моста $BRIDGE_NAME..."
if ! virsh net-dumpxml $BRIDGE_NAME >/dev/null 2>&1; then
    echo "Создаем конфигурацию мостовой сети..."
    cat <<EOF > bridge-net.xml
<network>
  <name>$BRIDGE_NAME</name>
  <forward mode='bridge'/>
  <bridge name='$BRIDGE_NAME'/>
</network>
EOF
    virsh net-define bridge-net.xml
    virsh net-start $BRIDGE_NAME
    virsh net-autostart $BRIDGE_NAME
    rm -f bridge-net.xml
    echo "Сеть $BRIDGE_NAME успешно создана и запущена!"
else
    echo "Сеть $BRIDGE_NAME уже существует."
fi
