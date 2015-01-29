#!/bin/bash


estavivo(){
`ping -c 1 $1 > /dev/null`
 if [ $? -eq 0 ];then
	 echo  "$i Esta vivo."
 fi
}

for i in 172.16.{1..255}.{1..255}
do
	host=estavivo $i & disown
	mac=`arp $i |cut -c30-17`
	echo "$host tiene la mac $mac" >> asociacion.txt

done


