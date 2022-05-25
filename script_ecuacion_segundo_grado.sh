#!/bin/bash
clear
function programaPrincipal(){
    echo "Programa para calcular ecuaciones de segundo grado"
    echo
    echo "ax² + bx + c = 0"
    echo
}

function preguntarValores() {
    read -p "Introduzca el valor de 'a'... " VALOR_A
    echo
    read -p "Introduzca el valor de 'b'... " VALOR_B
    echo
    read -p "Introduzca el valor de 'c'... " VALOR_C
    echo
}

function mostrarValores() {
    echo "El valor de 'a' es "$VALOR_A", el valor de 'b' es "$VALOR_B", el valor de 'c' es "$VALOR_C
    echo
}

function cambiarValores() {
    read -n 1 -p "¿Quiere cambiar los valores anteriores? (S/N)... " CAMBIAR
    echo ""
    CAMBIAR_VALORES=$(echo "$CAMBIAR" | tr [A-Z] [a-z])
}

function volverCambiarValores() {
    read -n 1 -p "¿Quiere volver a cambiar los valores anteriores? (s/n)... " CAMBIAR
    echo ""
    CAMBIAR_VALORES=$(echo "$CAMBIAR" | tr [A-Z] [a-z])
}

function valorDeVariable_a_0() {
    if test $VALOR_B -eq "0" ; then
        echo "La ecuación no tiene solución"
    else
        SOLUCION_ECUACION=$(echo "-($VALOR_C / $VALOR_B)" | bc -l)
        echo
        echo "La solución de la variable X es: " $SOLUCION_ECUACION
    fi
}

function valorDeVariable_a_No0() {
    RADICANDO=$(echo "($VALOR_B*$VALOR_B) - (4 * $VALOR_A*$VALOR_C)" | bc -l)

    if test $RADICANDO -lt "0" ; do
        echo "El discriminante sale negativo, por lo que la ecuación no tiene solución real"
        break
    done

    RAIZ_CUADRADA=$(echo "sqrt ($RADICANDO)" | bc -l)

    PRIMERA_SOLUCION=$(echo "(- $VALOR_B + $RAIZ_CUADRADA) / (2 * $VALOR_A)" | bc -l)

    SEGUNDA_SOLUCION=$(echo "(- $VALOR_B - $RAIZ_CUADRADA) / (2 * $VALOR_A)" | bc -l)

    echo "La primera solución para la variable X (la suma) es: " $PRIMERA_SOLUCION
    echo
    echo "La segunda solución para la variable X (la resta) es: " $SEGUNDA_SOLUCION
    echo
}

programaPrincipal

preguntarValores

mostrarValores

cambiarValores

while [ $CAMBIAR_VALORES = "s" ] ; do
    preguntarValores
    
    mostrarValores
    
    volverCambiarValores
done

if test $VALOR_A -eq "0" ; then
    valorDeVariable_a_0
else
    valorDeVariable_a_No0
fi
