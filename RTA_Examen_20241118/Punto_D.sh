#!/bin/bash
cd /home/vagrant/UTN-FRA_SO_Examenes/202406/ansible


#creamos carpeta
sudo mkdir -p /tmp/2do_parcial/alumno /tmp/2do_parcial/equipo

#creamos archivos.txt
echo "nombre: Pia" > "home/vagrant/UTN-FRA_SO_Examenes/20406/ansible/tmp/2do_parcial/alumno/datos_alumno.txt"
echo "apellido: Franetovich" >> "home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/tmp/2do_parcial/alumno/datos_alumno.txt"
echo "division: 115" >>"home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/tmp/2do_parcial/alumno/datos_alumno.txt"

#datos equipo
echo "ip: $(hostname -I) " > "home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/tmp/2do_parcial/equipo/datos_equipo.txt"
echo "distribucion: $(lsb_release -d)" >> "home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/tmp/2do_parcial/equipo/datos_equipo.txt"
echo "cores: $(nproc)">>"home/vagrant/UTN-FRA_SO_Examenes/202406/ansible/tmp/2do_parcial/equipo/datos_equipo.txt"


#configurar sudoers
sudo groupadd 2PSupervisores

ECHO "%2PSupervisores ALL = (ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/2PSupervisores

#dar permisos
chmod +x Punto_D.sh

