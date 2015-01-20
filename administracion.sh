#!/bin/bash


ROOT_UID=0
E_NOTROOT=85
E_NOTUSER=86
E_EXIST=87
E_XUSER=88

IFS=","


clear
if [ "$UID" -ne "$ROOT_UID" ]
then
	  echo "Se necesita ser root para ejecutar este script script."
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
		crearusuario;;
	2)
		borausuario;;
	3)
		crearmuchosusuarios;;

	4)
		echo "ha elegido la opcion 4";;

	0)
		echo "Vuelve pronto!"
		exit;;
esac

function crearmuchosusuarios{

while (read nombre ape1 ape2 cilo) do
	echo $nombre > nom
	inicial=`cut -b 1-1 nom`
	usuario= $ape1$ape2$inicial
	if grep $usuario /etc/passwd then
		echo "ya existe $usuario" >> crearusuarios.log
	fi
done< usuarios.txt
}

function crearusuario{
echo -n "introduce el nombre de usuario que quieres agregar: "
read usuario
if [ $usuario != "" ] then
	if [ grep $usuario /etc/passwd ]then
		echo "El usuario ya existe"
		#pausa
	else
		if [ adduser $usuario ] then
			echo "Se ha creado el usuario"
		else
			echo "ha habido un error"
		fi
	fi
fi
#vamos a tirarnos a la piscina:
if [ $usuario == "" ] then
	echo "El usuario que ha introducido no es valido"
	exit $E_XUSER 
fi
}

function borrausuario {


		echo -n "Introduzca el usuario a borrar: "
		read busuario
		`userdel -r $busuario`
		echo -e "\e[0;31m Se ha borrado el usuario $busuario"
}


function pausa{
	echo "Pulsa [Intro] para continuar"
	read kk
	sleep 2
}

