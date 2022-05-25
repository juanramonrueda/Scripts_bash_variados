#!/bin/bash

read -p "Introduce un número para hacer la tabla de multiplicar " MULTIPLO

for BASE in 1 2 3 4 5 6 7 8 9 10; do
RESULTADO=$[$BASE*$MULTIPLO]
echo $RESULTADO
done
