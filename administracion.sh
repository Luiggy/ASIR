#!/bin/bash


E_NOTROOT=85
E_NOTUSER=86
E_EXIST=87

clear
if [ "$UID" -ne "$ROOT_UID" ]
then
	  echo "Must be root to run this script."
	    exit $E_NOTROOT
	fi
function menu {

echo "============================================"
echo "  APLICACION DE ADMINISTRACION ON THE FLY   "
echo "============================================"
echo ""
echo "1- agregar usuario"
echo "2- borrar usuario"
echo "3- Agregar bateria de usuarios mediante archivo"
echo "4- Borrar conjunto de usuarios."
echo "0- Salir."
echo -n "Introduzca su opcion: "


}

menu
read respuesta

case $respuesta in
	1)
		creausuario;;
	2)
	3)
		crearmuchosusuarios;;

	4)
		echo "ha elegido la opcion 4";;

	0)
		echo "Vuelve pronto!"
		exit;;
esac

function crearmuchosusuarios{

echo "se ha metido en la funcion"
}

function creausuario {

		echo -n "introduce el nombre de usuario que quieres agregar: "
		read usuario
		`useradd -D $usuario`
}

function borrausuario {


		echo -n "Introduzca el usuario a borrar: "
		read busuario
		`userdel -r $busuario`
		echo -e "\e[0;31m Se ha borrado el usuario $busuario"
}





