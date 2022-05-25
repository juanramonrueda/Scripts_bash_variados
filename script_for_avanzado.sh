#!/bin/bash
clear
CONTADOR=0
read -p "Introduzca el número máximo: " NUM_MAX
for (( ESCALERA=0; ESCALERA<=$NUM_MAX; ESCALERA++ )) ; do
    echo
    echo "Número" $ESCALERA
    CONTADOR=$[$CONTADOR+1]
done
echo
echo "Cantidad contada: " $CONTADOR
