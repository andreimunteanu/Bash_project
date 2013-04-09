#!/bin/bash
if [ $# != 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

var=$(find . -name $@)
arrIN=(${var// / })
echo $arrIn

n=${#arrIN[@]}

if [ '$n' = '2' ]		# caso singolo file trovato
	then
		echo cane
		rm -f $var;
else
	
	for el in ${arrIN[@]}; do
		if [ -z $(echo $el | grep 'bck') ]
			then
				echo "cane il ritorno"
				echo $el;
		fi
	done
	echo "A causa di multiplo ritrovamento Inserisci nome repo"
	
	read name

	for el in ${arrIN[@]}; do
		path=$(echo $el | grep "\<$name\>") 
		if [ -n "$path" ]
			then
				
				rm -f "$path";
		fi
	done
fi
