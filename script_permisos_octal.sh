#!/bin/bash
clear
read -p "Introduzca un archivo o directorio para conocer sus permisos: " ARCH_DIRECT
echo
if test -e $HOME/$ARCH_DIRECT ; then
    USUARIO=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 2-4)
    case $USUARIO in
        rwx) USUARIO=7;;
        rw-) USUARIO=6;;
        r-x) USUARIO=5;;
        r--) USUARIO=4;;
        -wx) USUARIO=3;;
        -w-) USUARIO=2;;
        --x) USUARIO=1;;
        ---) USUARIO=0;;
    esac
    GRUPO=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 5-7)
    case $GRUPO in
        rwx) GRUPO=7;;
        rw-) GRUPO=6;;
        r-x) GRUPO=5;;
        r--) GRUPO=4;;
        -wx) GRUPO=3;;
        -w-) GRUPO=2;;
        --x) GRUPO=1;;
        ---) GRUPO=0;;
    esac
    OTROS=$(ls -ld $HOME/$ARCH_DIRECT | cut -c 8-10)
    case $OTROS in
        rwx) OTROS=7;;
        rw-) OTROS=6;;
        r-x) OTROS=5;;
        r--) OTROS=4;;
        -wx) OTROS=3;;
        -w-) OTROS=2;;
        --x) OTROS=1;;
        ---) GRUPO=0;;
    esac
    echo "Los permisos en octal de $ARCH_DIRECT son:" $USUARIO$GRUPO$OTROS
else
    echo "El archivo o directorio no existe, compruebe el nombre"
    echo
    ls $HOME
fi
