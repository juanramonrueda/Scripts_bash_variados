#!/bin/bash
clear
read -p "Introduzca un número de teléfono: " NUMERO_TELEFONO
echo
VALIDACION=$(expr match "$NUMERO_TELEFONO" [6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])

if [ $VALIDACION = 9 ] ; then
    echo "Es un número de teléfono válido"
else
    echo "No es un número de teléfono válido"
fi
