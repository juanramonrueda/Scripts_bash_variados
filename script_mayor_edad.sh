#!/bin/bash
clear
echo "Programa para saber si es mayor de edad"
echo
read -p "Introduzca su fecha de nacimiento con el siguiente formato, aaaa-mm-dd: " FECHA_USUARIO
echo
VALIDAR_FECHA=$(expr match "$FECHA_USUARIO" [1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9])
while [ $VALIDAR_FECHA != 10 ] ; do
    echo "Formato de fecha de nacimiento errónea, es aaaa-mm-dd; como ejemplo: 1990-02-31"
    echo
    read -p "Vuelva a introducir la fecha de nacimiento: " FECHA_USUARIO
    echo
    VALIDAR_FECHA=$(expr match "$FECHA_USUARIO" [1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9])
done
FECHA_ACTUAL=$(date +%Y%m%d)
FECHA_USUARIO_ANYO=$(echo "$FECHA_USUARIO" | cut -c 1-4)
FECHA_USUARIO_MES=$(echo "$FECHA_USUARIO" | cut -c 6-7)
FECHA_USUARIO_DIA=$(echo "$FECHA_USUARIO" | cut -c 9-10)

FECHA_USUARIO_COMPLETA=$(($FECHA_USUARIO_ANYO$FECHA_USUARIO_MES$FECHA_USUARIO_DIA))

RESTA_FECHAS=$(($FECHA_ACTUAL-$FECHA_USUARIO_COMPLETA))

if (( $RESTA_FECHAS >= 180000 )) ; then
    echo "Es mayor de edad"
else
    echo "Es menor de edad"
fi
