#!/bin/bash
if [ $# -ne 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

var=$(find . -name $@)
arrIN=(${var// / }) #versione decente da cercare o che minchia vuol dire

n=${#arrIN[@]}

if [ $n -eq 2 ]		# caso singolo file trovato
	then
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
	if [ ! -d ./$name ]
		then
			echo  "<repo> "$name" non esistente "
			exit;
	fi

	rm -f $(echo -e $var | grep -w "\<$name\>") # da controllare la rindondanza di -w e \< \>
fi
