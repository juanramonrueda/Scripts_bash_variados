#!/bin/bash
function mostrarMenu() {
    echo
    echo "***        ---    MENÚ    ---        ***"
    echo
    echo "1.- Insertar alumnado nuevo"
    echo
    echo "2.- Mostrar el alumnado registrado"
    echo
    echo "3.- Eliminar un alumno/a del registro"
    echo
    echo "4.- Detener la ejecución del programa"
    echo
}

function opcionEquivocada() {
    echo "Ha introducido una opción incorrecta, son las siguientes:"
    echo
    echo "1.- Insertar nuevo alumnado"
    echo
    echo "2.- Mostrar el alumnado registrado"
    echo
    echo "3.- Eliminar una alumno/a del registro"
    echo
    echo "4.- Detener la ejecución del programa"
    echo
}

OPCN_USUARIO=0
while [ $OPCN_USUARIO != 4 ] ; do
    clear
    mostrarMenu
    read -n 1 -p "Introduzca la opción que quiere usar: " OPCN_USUARIO
    echo ""
    case $OPCN_USUARIO in
        1) INSERTAR_ALUMNO="s"
            if ( test -e $HOME/alumnos_desorden.txt ) || ( test -d $HOME/alumnos_orden.txt ) ; then
                echo "Ficheros creados con anterioridad"
                echo 
            else
                touch $HOME/alumnos_desorden.txt $HOME/alumnos_orden.txt
                echo "Ficheros creados"
                echo
            fi
            while [ $INSERTAR_ALUMNO != "n" ] ; do
                read -p "Introduzca un/a alumno/a... " ALUMNO
                echo
                echo $ALUMNO >> $HOME/alumnos_desorden.txt
                read -n 1 -p "¿Quiere introducir otro alumno o alumna? (s/n)... " RESPUESTA_INSERTAR
                INSERTAR_ALUMNO=$( echo "$RESPUESTA_INSERTAR" | tr [A-Z] [a-z] )
                echo 
            done
            cat alumnos_desorden.txt | sort | cat > alumnos_orden.txt
            echo;;
        2) cat -n alumnos_orden.txt
            echo ""
            read -n 1 -p "Pulse una tecla para continuar... " PAUSA
            ;;
        3) ;;
        4) echo "Programa detenido"
            echo;;
        *) opcionEquivocada;;
    esac
done
