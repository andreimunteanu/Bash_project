#!/bin/bash
if [ $# -ne 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

file_list=$(find . -name $@)
file_list=${file_list//"./"/"\n./"}

n=$(echo -e $file_list | grep -wc "$@")

if [ $n -eq 2 ] || [ $n -eq 1 ]		# caso singolo file trovato
	then
		echo ciao grazie
		rm -f $file_list;

else
	echo -e $file_list | grep -v "bck"
	echo "A causa di multiplo ritrovamento Inserisci nome repo"
	
	read name
	if [ ! -d ./$name ]
		then
			echo  "<repo> "$name" non esistente "
			exit;
	fi
	
	rm -f $(echo -e $files | grep -w "$name") # da controllare la rindondanza di -w e \< \>
fi
