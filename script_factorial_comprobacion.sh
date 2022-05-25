#!/bin/bash
clear
read -p "Introduzca un número para calcular su factorial: " NUMERO
echo
if [[ "$NUMERO" =~ ^[0-9]+$ ]] ; then
    FACTORIAL=1
    for (( ESCALERA=1; ESCALERA<=$NUMERO; ESCALERA++ )) ; do
        FACTORIAL=$(echo "$FACTORIAL*$ESCALERA"| bc -l)
    done
    echo "El factorial del número $NUMERO es: "$FACTORIAL
else
    echo "$NUMERO no es un número, es una cadena o símbolos o un número con decimales"
fi
