#!/bin/bash
clear
CONTADOR=0
read -p "Introduzca el primer número: " PRIMERO
echo
read -p "Introduzca el segundo número: " SEGUNDO
for (( ESCALERA=$PRIMERO; ESCALERA<=$SEGUNDO; ESCALERA++ )) ; do
    echo
    echo "Número " $ESCALERA
    CONTADOR=$[$CONTADOR+1]
done
echo
echo "Cantidad contada: " $CONTADOR
