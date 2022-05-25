#!/bin/bash
clear
read -p "Introduzca el valor del vector Ax: " VECTOR_Ax
echo
read -p "Introduzca el valor del vector Ay: " VECTOR_Ay
echo
read -p "Introduzca el valor del vector Az: " VECTOR_Az
echo
read -p "Introduzca el valor del vector Bx: " VECTOR_Bx
echo
read -p "Introduzca el valor del vector By: " VECTOR_By
echo
read -p "Introduzca el valor del vector Bz: " VECTOR_Bz
echo
declare -a VECTOR_A=( $VECTOR_Ax $VECTOR_Ay $VECTOR_Az )
declare -a VECTOR_B=( $VECTOR_Bx $VECTOR_By $VECTOR_Bz )
declare -a VECTOR_SUMA

for VECTORES in 0 1 2 ; do
    VECTOR_SUMA[$VECTORES]=$(echo "${VECTOR_A[$VECTORES]}+${VECTOR_B[$VECTORES]}" | bc)
done

echo "(${VECTOR_A[0]},${VECTOR_A[1]},${VECTOR_A[2]})+(${VECTOR_B[0]},${VECTOR_B[1]},${VECTOR_B[2]})=(${VECTOR_SUMA[0]},${VECTOR_SUMA[1]},${VECTOR_SUMA[2]})"
echo
