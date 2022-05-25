#!/bin/bash
clear
if [ $# = 1 ] ; then
    if test -e $HOME/$1 ; then
        file $HOME/$1
    else
        echo "No se ha encontrado el archivo o carpeta en $PWD"
    fi
else
    echo "No ha pasado el parámetro correctamente"
fi
