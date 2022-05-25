#!/bin/bash
OPC_USUARIO=0
function infoUsuario() {
    clear
    finger $USUARIO
}
clear
while [ $OPC_USUARIO != 3 ] ; do
    echo "   *---        MENÚ        ---*   "
    echo
    echo "1.- Para introducir un usuario"
    echo
    echo "2.- Para mostrar los datos del usuario"
    echo
    echo "3.- Detener la ejecución del programa"
    echo
    read -n 1 -p "Introduzca la opción deseada: " OPC_USUARIO
    echo
    case $OPC_USUARIO in
        1) read -p "Introduzca un usuario: " USUARIO;;
        2) infoUsuario;;
        3) echo "Programa detenido, ¡Hasta otra!"
    esac
done
