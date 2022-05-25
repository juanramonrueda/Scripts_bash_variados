#!/bin/bash
clear
if [ $# = 2 ] ; then
    if test -d $HOME/$1 ; then
        if test -e $HOME/$1/$2 ; then
            ls -l $HOME/$1/$2
        else
            echo "No existe el fichero en $1"
        fi
    else
        echo "No existe el directorio $2 en la ruta: $PWD"
    fi
else 
    echo "No se ha pasado la cantidad de parámetros correctamente, compruebe los parámetros pasados"
fi
