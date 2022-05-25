#!/bin/bash
clear
read -p "Introduzca un archivo o directorio para conocer sus permisos: " ARCH_DIRECT
echo
if test -e $HOME/$ARCH_DIRECT ; then
    USUARIO=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 2-4)
    #echo "Los permisos de Usuario son: " $USUARIO
    #echo
    GRUPO=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 5-7)
    #echo "Los permisos de Grupo son: " $GRUPO
    #echo
    OTROS=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 8-10)
    #echo "Los permisos de Otros son: " $OTROS
    #echo
    OCTAL=""
    for PERMISOS in $USUARIO $GRUPO $OTROS ; do
        case $PERMISOS in
            "rwx") PERMISOS=7;;
            "rw-") PERMISOS=6;;
            "r-x") PERMISOS=5;;
            "r--") PERMISOS=4;;
            "-wx") PERMISOS=3;;
            "-w-") PERMISOS=2;;
            "--x") PERMISOS=1;;
            "---") PERMISOS=0;;
        esac
        OCTAL=$OCTAL$PERMISOS
    done
    echo "Los permisos en octal de $ARCH_DIRECT son:" $OCTAL
else
    echo "El archivo o directorio no existe, compruebe el nombre"
    echo
    ls $HOME
fi

