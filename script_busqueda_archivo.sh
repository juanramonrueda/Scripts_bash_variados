#!/bin/bash
clear
ARCH_BUSQUEDA=0
while [ $ARCH_BUSQUEDA != "*" ] ; do
    echo "Para salir de la ejecución del programa, pulse la tecla asterísco *"
    echo
    read -p "Introduzca el nombre del archivo o que empiece por algunos caracteres: " ARCH_BUSQUEDA
    if [ $ARCH_BUSQUEDA != "*" ] ; then
        echo
        find $HOME -name $ARCH_BUSQUEDA*
        echo
    else
        echo "Ha finalizado la ejecución del programa"
    fi
done
