#!/bin/bash


#para ver lista de usuarios
cd /usr/local/bin/<Franetovich>AltaUser-groups.sh

#creamos grupos
sudo groupadd "2P_GDesa"
sudo groupadd "2P_GDesa"
sudo groupadd "2P_GTest"

sudo useradd -m -g "2P_GDesa" -d "/work/2P_202406_Prog1""2P:202406_Prog1"

#aca pide contraseña
sudo passwd 2P_202406_Prog1

sudo cat /etc/shadow | grep 2p_202406_Prog1 | awk -F: '{print$2}'

sudo useradd -m -g "2P_GDesa" -d "/work/2P_202406_Prog2" -p "$(sudo cat /etc/shadow | grep 2P_202406_Prog1 | awk -F: '{print$2}')" "2P_202406_Prog2".

sudo useradd -m -g "2P_Test" -d "/work/2P_202406_Test1" -p "$(sudo cat /etc/shadow | grep 2P_202406_Prog1 | awk -F: '{print$2}')" "2P_202406_Test1"

sudo useradd -m -g "2PSupervisores" -d "/work/2P_202406_Supervisor" -p "$(sudo cat /etc/shadow | grep 2P_202406_Prog1 | awk -F: '{print$2}')" "2P_202406_Supervisor"


sudo chown "2P_202406_Prog1:2P_GDesa" "/work/2P_202406_Prog1"
sudo chown "2P_202406_Prog2:2P_GDesa" "/work/2P_202406_Prog2"
sudo chown "2P_202406_Test1:2P_GTest" "/work/2P_202406_Test1"
sudo chown "2P_202406_Supervisor:2PSupervisores" "/work/2P_202406_Supervisor"


sudo chmod +x Punto_B.sh


./Punto_B.sh
