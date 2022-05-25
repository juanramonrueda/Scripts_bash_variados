#!/bin/bash
clear
if [ $# = 1 ] ; then
    if test -e $1 ; then
        echo "Es un archivo"
        echo ""
        echo "Permisos de Usuario: "$(ls -ld $1 | cut -c 2-4)
        echo ""
        echo "Permisos de Grupo: "$(ls -ld $1 | cut -c 5-7)
        echo ""
        echo "Permisos de Otros: "$(ls -ld $1 | cut -c 8-10)
        echo ""
        echo "r = Lectura | w = Escritura | x = Ejecución / Acceso | - = Sin permiso"
        echo ""
        read -n 1 -p "¿Quiere cambiar los permisos? (S/N): " RESPUESTA
        echo ""
        if [ $RESPUESTA = "S" ] || [ $RESPUESTA = "s" ] ; then
            echo "Escriba la letra o letras en el orden anterior para añadir los permisos (las letras que no se pongan servirán para quitar el permiso)"
            echo ""
            for GRUPOS in Usuario Grupo Otros ; do
                read -p "Introduzca los permisos de $GRUPOS: " PERMISOS
                PERMISOS_MAY=$(echo $PERMISOS | tr [a-z] [A-Z])
                echo ""
                if [ $GRUPOS = Usuario ] ; then
                    case $PERMISOS_MAY in
                        RWX) chmod u+rwx $1;;
                        RW) chmod u+rw-x $1;;
                        RX) chmod u+rx-w $1;;
                        R) chmod u+r-wx $1;;
                        WX) chmod u+wx-r $1;;
                        W) chmod u+w-rx $1;;
                        X) chmod u+x-rw $1;;
                    esac
                elif [ $GRUPOS = Grupo ] ; then
                    case $PERMISOS_MAY in
                        RWX) chmod g+rwx $1;;
                        RW) chmod g+rw-x $1;;
                        RX) chmod g+rx-w $1;;
                        R) chmod g+r-wx $1;;
                        WX) chmod g+wx-r $1;;
                        W) chmod g+w-rx $1;;
                        X) chmod g+x-rw $1;;
                    esac
                else
                    case $PERMISOS_MAY in
                        RWX) chmod o+rwx $1;;
                        RW) chmod o+rw-x $1;;
                        RX) chmod o+rx-w $1;;
                        R) chmod o+r-wx $1;;
                        WX) chmod o+wx-r $1;;
                        W) chmod o+w-rx $1;;
                        X) chmod o+x-rw $1;;
                    esac
                fi
            done
            echo "Permisos del Usuario: "$(ls -ld $1 | cut -c 2-4)
            echo ""
            echo "Permisos del Grupo: "$(ls -ld $1 | cut -c 5-7)
            echo ""
            echo "Permisos de Otros: "$(ls -ld $1 | cut -c 8-10)
            echo ""
        else
            echo "Los permisos no han sufrido modificación"
        fi
    else
        echo "No existe en esta ruta" $PWD
    fi
else
    echo "No se ha pasado un argumento por consola"
fi
