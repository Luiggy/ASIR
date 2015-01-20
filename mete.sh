#!/bin/bash -x

#estescript recive como parametros que se cogeran por pantalla los nombres
#y apellidos de los usuarios que se guardaran en un archivo separado por aquello
#que se le indique
clear

fecha=`date +%A-%d-%B-%Y-[%H:%M]`
nomarchivo="usuarios$fecha.txt"

echo  "Para salir del script deja el nombre en blanco"
sleep 4
clear
sleep 4
clear
echo "Que separador desea usar?"
read separador

echo "Se va a crear el archivo usuarios$fecha.txt"
echo -n "Desea que se llame asi o desea cambiar el nombre del archivo? '\n'Pulse
S para continuar, o n para cambiar el nombre del archivo)"
read libro
sleep 4

if [ $libro == "n" ]; then
	clear
	echo -n "dame el nombre del archivo donde deseas guardar los datos"
	read nomarchivo
fi
echo "se va a proceder a la creacion del archivo necesitare los siguientes daos:"

echo -n Nombre del alumnio:
read nombre
echo -n Primer apellido:
read apelli1
echo -n Segundo apellido:
read apelli2
echo ""
while [ -n "$nombre" ];  do

echo -n Nombre del alumnio:
read nombre
echo -n Primer apellido:
read apelli1
echo -n Segundo apellido:
read apelli2
echo ""
if [ -z $nombre ]; then
	exit
fi

echo "El ultimo nombre metido fue: $nombre $apelli1 $apelli2 ."
echo ""

echo "$nombre$separador$apelli1$apelli2" >> $nomarchivo
done

