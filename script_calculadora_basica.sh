#!/bin/bash
clear
echo "Pulse S para sumar"
echo ""
echo "Pulse R para restar"
echo ""
echo "Pulse M para multiplicar"
echo ""
echo "Pulse D para dividir"
echo ""
echo "Pulse MD para obtener el modulo de la division"
echo ""
echo "Pulse cualquier otra tecla distinta para salir"
echo ""
read -p "Introduzca su operacion: " OPERACION
echo ""

OPERACION_MINUS=$(echo $OPERACION | tr [a-z] [A-Z])

read -p "Introduzca el primer numero, en el caso de la division sera el dividendo: " PRIMERO
echo ""
read -p "Introduzca el segundo numero, en le caso de la division sera el divisor: " SEGUNDO
echo ""
case $OPERACION_MINUS in
    S) RESULTADO=$[$PRIMERO+$SEGUNDO]
    echo "El resultado de la suma es: "$RESULTADO
    echo "";;
    
    R) RESULTADO=$[$PRIMERO-$SEGUNDO]
    echo "El resultado de la resta es: "$RESULTADO
    echo "";;
    
    M) RESULTADO=$[$PRIMERO*$SEGUNDO]
    echo "El resultado de la multiplicacion es: "$RESULTADO
    echo "";;
    
    D) RESULTADO=$[$PRIMERO/$SEGUNDO]
    echo "El cociente de la division es: "$RESULTADO
    echo "";;
    
    MD) RESULTADO=$[$PRIMERO%$SEGUNDO]
    echo "El resto de la division es: "$RESULTADO
    echo "";;
    
    *) break;;
esac
