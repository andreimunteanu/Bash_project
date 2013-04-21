#!/bin/bash
if [ $# -ne 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

file_list=($(find . -name $@))

n=${#file_list[@]} 

if [ $n -eq 2 ] || [ $n -eq 1 ]		# caso singolo file trovato
	then
		rm -f $file_list;

else
	files=""	
	for el in ${file_list[@]}; do     
		files+=$el"\n"
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

	rm -f $(echo -e $files | grep -w "\<$name\>") # da controllare la rindondanza di -w e \< \>
fi
