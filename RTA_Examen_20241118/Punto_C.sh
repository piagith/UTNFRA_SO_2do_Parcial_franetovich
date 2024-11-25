#!/bin/bash

#ruta
cd ~/UTN-FRA_SO_Examenes/202406/docker/

#inicio sesion docker
docker login -u piafranetovich

#docker file
echo "creando Dockerfilee"
cat <<EOF > Dockerfile

FROM nginx
COPY index.html /usr/share/nginx/html/index.html
EOF


#Construir + imagen
echo "construyendo la imagen de docker"
docker build -t "piafranetovich/web1-franetovich".
docker push "piafranetovich/web1-franetovich".


#script Punto_C.sh
echo "script Punto_C.sh"

cat <<EOF > Punto_C.sh


#!/bin/bash
docker run -d -p 8080:80 "piafranetovich/web1-franetovich"
EOF


#permisos de ejecucion
chmod +x Punto_C.sh

echo "ejecucion del script"

