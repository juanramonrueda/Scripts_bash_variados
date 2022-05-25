#!/bin/bash
clear
echo
echo "***        ---   MENÚ   ---        ***"
echo
echo "1.- Insertar alumnado nuevo"
echo
echo "2.- Mostrar el alumnado registrado"
echo
echo "3.- Detener la ejecución del programa"
echo
OPCN_USUARIO=0
while [ $OPCN_USUARIO != 3 ] ; do
    read -n 1 -p "Introduzca la opción que quiere usar: " OPCN_USUARIO
    echo
    case $OPCN_USUARIO in
        1) INSERTAR_ALUMNO="S"
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
            read -n 1 -p "¿Quiere introducir otro alumno o alumna? (S/N)... " RESPUESTA_INSERTAR
            INSERTAR_ALUMNO=$( echo "$RESPUESTA_INSERTAR" | tr [A-Z] [a-z] )
            echo ""
        done
        cat alumnos_desorden.txt | sort | cat > alumnos_orden.txt;;
        2) cat -n alumnos_orden.txt;;
        3) echo "Programa detenido"
            echo;;
        *) echo "Se ha equivocado de opciones, son las siguientes:"
            echo
            echo "1.- Insertar nuevo alumnado"
            echo
            echo "2.- Mostrar el alumnado registrado"
            echo
            echo "3.- Detener la ejecución del programa"
            echo;;
    esac
done
