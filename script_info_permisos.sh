#!/bin/bash
clear
read -p "Introduzca un archivo o un directorio: " ARCH_DIREC
echo
if test -e $ARCH_DIREC ; then
    USU_PERM=$(ls -ld $ARCH_DIREC | cut -c 2-4)
    GRP_PERM=$(ls -ld $ARCH_DIREC | cut -c 5-7)
    OTR_PERM=$(ls -ld $ARCH_DIREC | cut -c 8-10)
    echo "r => Lectura | w => Escritura | x => Ejecución / Acceso | - => Sin permiso"
    echo
    echo "Permisos de Usuario: " $USU_PERM
    echo
    echo "Permisos de Grupo: " $GRP_PERM
    echo
    echo "Permisos de Otros: "$OTR_PERM
    echo
else
    echo "No existe el directorio o archivo $ARCH_DIREC que quiere consultar en $PWD"
    echo
    echo "Contenido de su directorio:"
    ls
fi
