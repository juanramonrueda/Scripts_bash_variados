#!/bin/bash
read -p "Introduzca el dividendo: " DIVIDENDO
read -p "Introduzca el divisor: " DIVISOR
MODULO=$[$DIVIDENDO%$DIVISOR]
case $MODULO in
	0) echo "El resto es 0";;
	*) echo "El resto es distinto de 0, siendo el resto" $MODULO;;
esac
