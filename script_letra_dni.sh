#!/bin/bash
clear
echo "Programa para comprobar que un DNI es correcto"
echo
VALIDAR=0
LETRAS_DNI=(T R W A G M Y F P D X B N J Z S Q V H L C K E)
while [ $VALIDAR != 9 ]; do
    read -p "Introduzca su DNI con la letra al final y en mayúscula: " DNI
    echo
    VALIDAR=$(expr match "$DNI" [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z])
    if [ $VALIDAR = 9 ] ; then
        echo "El formato del DNI es correcto"
        echo
    else
        echo "El formato del DNI es incorrecto, pruebe de nuevo"
        echo
    fi
done
NUM_DNI=$(echo "$DNI" | cut -c 1-8)
LETRA_DNI=$(echo "$DNI" | cut -c 9)
MODULO_DNI=$[$NUM_DNI%23]
if [ $LETRA_DNI = ${LETRAS_DNI[$MODULO_DNI]} ] ; then
    echo "El DNI $DNI es correcto"
else
    echo "El DNI $DNI es incorrecto, debería ser "$NUM_DNI${LETRAS_DNI[$MODULO_DNI]}
fi
