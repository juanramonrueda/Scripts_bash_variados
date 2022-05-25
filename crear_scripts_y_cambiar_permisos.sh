#!/bin/bash
clear
ls $HOME/bin
echo
read -p "Nombre archivo: " ARCHIVO
touch $HOME/bin/$ARCHIVO.sh
chmod 744 $HOME/bin/$ARCHIVO.sh
kate $HOME/bin/$ARCHIVO.sh
echo
