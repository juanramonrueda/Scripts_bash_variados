#!/bin/bash
read -p "Introduzca su nombre: " NOMBRE

NOMBRE_MIN=$(echo $NOMBRE | tr [A-Z] [a-z]) #Transformación de la variable leída por consola a minúscula

if [ $NOMBRE_MIN = "pepe" ] ; then
	echo "El nombre es el mismo"
else
	echo "El nombre no se corresponde"
fi
