#!/bin/bash
CONTINUAR=0
while [ $CONTINUAR != S ] || [ $CONTINUAR != s ] ; do
    if [ $CONTINUAR != S ] || [ $CONTINUAR != s ] ; then
        read -p "Introduzca la cadena que quiere buscar: " CADENA
        echo
        read -p "Introduzca la ruta donde quiere buscar o empezar a buscar: " RUTA
    else
        echo "Ha finalizado la ejecución del programa"
    fi
done


grep -r "$CADENA" $RUTA | more
