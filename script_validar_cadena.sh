#!/bin/bash
clear
read -p "Introduzca su nombre: " CADENA
LONGITUD=$(expr length "$CADENA")
TOTAL=0
for ((P = 1 ; $P <= $LONGITUD ; P++)) ; do
    LETRA=$(expr substr "$CADENA" $P 1)
    VALIDANTE=$(expr match "$LETRA" [A-Z,a-z," ",ñ,Ñ,á,é,í,ó,ú,ü,Á,É,Í,Ó,Ú,Ü])
    TOTAL=$[$TOTAL+$VALIDANTE]
done

if [ $TOTAL = $LONGITUD ] ; then
    echo "Es un nombre válido, sin números y símbolos"
else
    echo "No es un nombre válido, contiene números y/o símbolos"
fi
