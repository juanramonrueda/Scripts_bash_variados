#!/bin/bash
clear
PASSWORD=Hola
CONTADOR=0
while [ $PASSWORD != canasta ] ; do
    read -p "Introduzca la contraseña: " PASSWORD
    echo ""
    CONTADOR=$[$CONTADOR+1]
done
echo "La contraseña " $PASSWORD " es correcta"
echo ""
echo "Ha realizado " $CONTADOR " introducciones de contraseña"
