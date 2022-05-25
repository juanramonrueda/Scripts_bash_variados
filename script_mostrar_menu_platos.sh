#!/bin/bash
clear
OPCN_USUARIO=
until [ $OPCN_USUARIO = 4 ] ; do
    echo "Para ver los primeros platos, pulse la tecla 1"
    echo
    echo "Para ver los segundos platos, pulse la tecla 2"
    echo
    echo "Para ver los postres, pulse la tecla 3"
    echo
    echo "Para finalizar la ejecución del programa, pulse la tecla 4"
    echo
    read -n 1 -p "Introduzca la opción que desea " OPCN_USUARIO
    echo
    case $OPCN_USUARIO in
        1)
        echo "Tenemos los siguientes platos: "
        for PRIMER_PLATO in Ensalada Empanada Salmorejo ; do
            echo $PRIMER_PLATO
            echo
        done;;
        2)
        echo "Tenemos los siguientes platos: "
        for SEGUNDO_PLATO in Lentejas Solomillo Pollo_Agridulce Ternera Pollo_Frito ; do
            echo $SEGUNDO_PLATO
            echo
        done;;
        3)echo "Tenemos los siguientes postres: "
        for POSTRE in Tarta_Queso Pudding Bizcocho Fruta Leche_Frita Torrijas ; do
            echo $POSTRE
            echo
        done;;
        4)
        echo "Programa finalizado, ¡Hasta la próxima!";;
    esac
done
