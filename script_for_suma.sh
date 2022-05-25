#!/bin/bash
clear
SUMA=0
read -p "Introduzca el número máximo: " NUM_MAX
for (( ESCALERA=1; ESCALERA<=$NUM_MAX; ESCALERA++ )) ; do
    echo
    echo "Número" $ESCALERA
    SUMA=$[$SUMA+$ESCALERA]
done
echo
echo "Cantidad sumada:" $SUMA
echo
