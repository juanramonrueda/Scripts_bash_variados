#!/bin/bash
clear
read -p "Introduzca la ruta y el directorio para realizar una copia de seguridad: " DIREC_COPIA
if test -d $HOME/$DIREC_COPIA ; then
    mkdir -p $HOME/copias_seguridad
    tar cvf - $DIREC_COPIA | gzip -9 > $DIREC_COPIA.tar.gz
    mv $DIREC_COPIA.tar.gz $HOME/copias_seguridad
    echo
    echo "Copia de seguridad realizada con exito"
    echo
    ls -l $HOME/copias_seguridad/$DIREC_COPIA.tar.gz
else
    echo $DIREC_COPIA "no es un directorio, por lo que no se puede hacer copia de seguridad"
fi
