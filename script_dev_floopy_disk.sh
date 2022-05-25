#!/bin/bash
clear
function nombreDispositivo () {
    VALIDO=0
    clear
    ls /dev/fd*
    echo
    until [ $VALIDO = 3 ] ; do
        read -p "Introduzca el nombre del dispositivo para realizar operaciones: " DISPOSITIVO
        $VALIDO=$(expr match "$DISPOSITIVO" [f][d][0-1])
    done
}
USUARIO=0
while [ $USUARIO != 4 ] ; do
    clear
    echo "Para formatear la unidad, pulse el número 1"
    echo
    echo "Para montar la unidad, pulse la tecla número 2"
    echo
    echo "Para desmontar la unidad, pulse la tecla número 3"
    echo
    echo "Para salir de la ejecución del programa, pulse la tecla 4"
    echo
    read -n 1 -p "Introduzca la opción deseada: " USUARIO
    case $USUARIO in
        1) nombreDispositivo; fdformat 
done
