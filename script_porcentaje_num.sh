#!/bin/bash
clear
read -p "Introduzca un número para hacer el 33,67% del número... " NUMERO
echo
echo "El 33,67% de $NUMERO es:"
echo
echo "$NUMERO * 0.3367" | bc -l
