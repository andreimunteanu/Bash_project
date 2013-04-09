#!/bin/bash
if [ $# != 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

var=$(find . -name $@)
arrIN=(${var// / })

n=${#arrIN[@]}

if [ '$n' = '2' ]		# caso singolo file trovato
	then
		echo cane
		rm -f $var;
else
	var=""	
	for el in ${arrIN[@]}; do
		var+=$el"\n"
		if [ -z $(echo $el | grep 'bck') ]
			then
				echo $el;
		fi
	done
	echo "A causa di multiplo ritrovamento Inserisci nome repo"
	
	read name

	rm -f $(echo -e $var | grep "\<$name\>")
fi
