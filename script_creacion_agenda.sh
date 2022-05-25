#!/bin/bash
function programaPrincipal() {
    clear
    mostrarMenu
    OPCN_USUARIO=0
    while [ $OPCN_USUARIO != 4 ] ; do
        clear
        mostrarMenu
        read -n 1 -p "Introduzca la opción que quiere usar: " OPCN_USUARIO
        echo
        case $OPCN_USUARIO in
            1) crearRegistros;;
            2) mostrarAgenda;;
            3) ;;
            4) echo
                echo "Proceso de Agenda finalizado"
                echo;;
            *) opcionEquivocada;;
        esac
    done
}

function mostrarMenu() {
    echo
    echo "***        ---    MENÚ    ---        ***"
    echo
    echo "1.- Insertar registro nuevo"
    echo
    echo "2.- Mostrar los registros"
    echo
    echo "3.- Eliminar registro"
    echo
    echo "4.- Detener la ejecución del programa"
    echo
}

function opcionEquivocada() {
    echo "Ha introducido una opción incorrecta, son las siguientes:"
    echo
    echo "1.- Insertar nuevo registro"
    echo
    echo "2.- Mostrar los contactos registrados"
    echo
    echo "3.- Eliminar contacto del registro"
    echo
    echo "4.- Detener la ejecución del programa"
    echo
}

function crearRegistros() {
    INSERTAR_REGISTROS="s"
    while [ $INSERTAR_REGISTROS != "n" ] ; do
        introducirNombre
        introducirNumeroTelefono
        insertarRegistros
        read -n 1 -p "¿Desea seguir introduciendo registros en la agenda? (s/n)... " INSERTAR_REGISTROS
        echo
    done
}

function introducirNombre() {
    TOTAL=1
    LONGITUD=2
    while [ $TOTAL != $LONGITUD ] ; do
        echo
        read -p "Introduzca el nombre del contacto: " CONTACTO
        echo
        LONGITUD=$(expr length "$CONTACTO")
        TOTAL=0
        for ((P = 1 ; $P <= $LONGITUD ; P++)) ; do
            LETRA=$(expr substr "$CONTACTO" $P 1)
            VALIDANTE=$(expr match "$LETRA" [A-Z,a-z," ",ñ,Ñ,á,é,í,ó,ú,ü,Á,É,Í,Ó,Ú,Ü])
            TOTAL=$[$TOTAL+$VALIDANTE]
        done
        if [ $TOTAL = $LONGITUD ] ; then
            echo
            echo "El nombre del contacto es correcto"
            echo
        else
            echo
            echo "El nombre del contacto es incorrecto, vuelva a introducirlo..."
            echo
        fi
    done
}

function introducirNumeroTelefono() {
    VALIDACION=0
    while [ $VALIDACION != 9 ] ; do
        echo
        read -p "Introduzca un número de teléfono: " NUMERO_TELEFONO
        echo
        VALIDACION=$(expr match "$NUMERO_TELEFONO" [6-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])

        if [ $VALIDACION = 9 ] ; then
            echo
            echo "Es un número de teléfono válido"
            echo
        else
            echo
            echo "No es un número de teléfono válido, vuelva a introducir el número de teléfono del contacto..."
            echo
        fi
    done
}

function insertarRegistros() {
    if ( test -e $HOME/agenda_basica.txt ) || ( test -e $HOME/agenda_principal.txt ) ; then
        echo ""
    else
        touch $HOME/agenda_basica.txt $HOME/agenda_principal.txt
        echo "Agenda creada"
    fi
    echo $CONTACTO --- $NUMERO_TELEFONO >> $HOME/agenda_basica.txt
    cat $HOME/agenda_basica.txt | sort | cat > agenda_principal.txt
}

function mostrarAgenda() {
    clear
    cat $HOME/agenda_principal.txt
    echo
    read -n 1 -p "Pulse una tecla para continuar..." TECLA
}

programaPrincipal
