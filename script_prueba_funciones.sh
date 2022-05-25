#!/bin/bash
clear
function funcion {
    read -p "Introduzca un número: " NUMERO
    for (( ESCALERA=1; ESCALERA<=10; ESCALERA++ )) ; do
        RESULTADO=$[$ESCALERA*$NUMERO]
        echo "$ESCALERA * $NUMERO = "$RESULTADO
        echo
    done
}
read -n 1 -p "¿Quieres llamar a la función? (S/N) " RESPUESTA
echo
ORDEN=$(echo $RESPUESTA | tr [a-z] [A-Z])
if [ $ORDEN = S ] ; then
    funcion
else
    echo "¡Hasta otra!"
fi
