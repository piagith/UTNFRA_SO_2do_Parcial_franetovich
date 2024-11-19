#!/bin/bash
#2gb
disk_docker = "/dev/sdc"
#1gb
disk_swap = "/dev/sdd"
#2gb extra
disk = "/dev/sde"


echo "volumenes fisicos"
pvcreate $disk_docker
pvcreate $disk_swap
pvcreate $disk

echo "grupos"
vgcreate vg_datos $disk_docker
vgcreate vg_temp $disk_swap

echo "volumen logico"
lvcreate -n lv_docker -L 5M vg_datos
lvcreate -n lv_workareas -L 1.5G vg_datos
lvcreate -n lv_swap -L 512M vg_temp


#formateo

echo "formateandoo"
mkfs.ext4 /dev/vg_datos/lv_docker
mkfs.ext4 /dev/vg_datos/lv_workareas
mkfs.ext4 /dev/vg_temp/lv_swap


mkdir -p /var/lib/docker
mkdir -p /work

mount /dev/vg_datos/lv_docker /var/lib/docker
mount /dev/vg_datos/lv_workareas /work
swapon /dev/vg_temp/lv_swap

# Actualizar fstab para montar automáticamente en el arranque
echo "Actualizando /etc/fstab..."
echo "/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0" >> /etc/fstab
echo "/dev/vg_datos/lv_workareas /work ext4 defaults 0 0" >> /etc/fstab
echo "/dev/vg_temp/lv_swap swap swap defaults 0 0" >> /etc/fstab

# Agregar disco de 2GB para futuras ampliaciones
echo "Preparando disco de 2GB para ampliaciones futuras..."
vgextend vg_datos $DISK_DEFENSE

#permisos
chmod +x Punto_A.sh

