#!/bin/bash


ROOT_UID=0
E_NOTROOT=85
E_NOTUSER=86
E_EXIST=87
E_XUSER=88
IFS=":"


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


function crearmuchosusuarios {
filename=`ls usuario*`
for file  in $filename ; do
	while (read nombre ape1 ape2) do
		echo $nombre > nom
		inicial=`cut -b 1-1 nom`
		usuario= $ape1$ape2$inicial
		if [ `grep $usuario /etc/passwd` ]; then
			echo "ya existe $usuario" >> crearusuarios.log
		else
			`adduser $usuario`
			echo "se ha creado $usuario correctamente a las `date +%R:%S`"
		fi
	done
done

}

function crearusuario {

echo -n introduce el nombre de usuario que quieres agregar:
read usuario
if [ $usuario != "" ]; then
	if [ `grep "$usuario" < /etc/passwd` ]; then
		echo "El usuario ya existe"
		#pausa;
	elif [ `adduser $usuario` ]; then
		echo "Se ha creado el usuario"
	else
		echo "ha habido un error"
	fi
fi

}

function borrausuario {

		echo "ha seleccionado borrar un usuario.\n"
		echo -n "Introduzca el usuario a borrar: "
		read busuario
		if [  -d /backup ]; then
			`cp /home/$busuario /backup/$busuario`
			`userdel -r $busuario`
			echo "Se ha creado una Copia del home de $busuario"
			echo -e "\e[0;31m Se ha borrado el usuario $busuario"
		else
			`mkdir /backup`
		fi
}


function pausa {

	echo "Pulsa [Intro] para continuar"
	read kk
	sleep 2
}

menu
read respuesta
case $respuesta in
	1)
		crearusuario;;
	2)
		borrausuario;;
	3)
		crearmuchosusuarios;;

	4)
		borrausuario;;

	0)
		echo "Vuelve pronto!"
		exit;;
esac
