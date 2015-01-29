#!/bin/bash


#Realizar un script que dispare ping a un rango de direcciones. Si el 
#equipo destino responde, se guarda en el archivo "despiertos.txt" la 
#direccion IP y la mac asociada a esa IP


echo "" > salida.txt
echo procesando los datos....
for i in {1..255}; do
	host=172.16.1.$i
	echo comprobando $host
	ping -q -c 2 $host &> /dev/null
	if [ $? -ne 0 ]; then
		echo no se ha encontrado $host
	else
		arp -a $host | awk "/$host/{print \$2 \$4}" >> salida.txt
		echo $host esta UP
	fi
	echo terminado
done

