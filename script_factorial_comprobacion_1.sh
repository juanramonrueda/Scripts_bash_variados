#/bin/bash
clear
clear
read -p "Introduzca un número para calcular su factorial: " NUMERO
echo
LONGITUD=$(expr length "$NUMERO")
PATRON=""

for ((COMPROBANTE = 1 ; COMPROBANTE <= $LONGITUD ; COMPROBANTE++)) ; do
    PATRON=$PATRON[0-9]
done
VALIDANTE=$(expr match "$NUMERO" $PATRON)
if [[ $VALIDANTE = $LONGITUD ]] ; then
    FACTORIAL=1
    for (( ESCALERA=1; ESCALERA<=$NUMERO; ESCALERA++ )) ; do
        FACTORIAL=$(echo "$FACTORIAL*$ESCALERA"| bc -l)
    done
    echo "El factorial del número $NUMERO es: "$FACTORIAL
else
    echo "$NUMERO no es un número positivo, es una cadena o símbolos o un número con decimales"
fi
