#!/bin/bash
if [ $# -ne 1 ]
	then 
		echo "utilizzo errato: remove <file_name>"
		exit;
fi

<<<<<<< HEAD
file_list=$(find . -name $@)
file_list=${file_list//"./"/"\n./"}

n=$(echo -e $file_list | grep -wc "$@")

if [ $n -eq 2 ] || [ $n -eq 1 ]		# caso singolo file trovato
	then
		echo ciao grazie
		rm -f $file_list;

else
	echo -e $file_list | grep -v "bck"
=======
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
>>>>>>> c8ea7e1ec142ec69e1cb1b10573b1f45fe233f2e
	echo "A causa di multiplo ritrovamento Inserisci nome repo"
	
	read name
	if [ ! -d ./$name ]
		then
			echo  "<repo> "$name" non esistente "
			exit;
	fi
<<<<<<< HEAD
	
	rm -f $(echo -e $files | grep -w "$name") # da controllare la rindondanza di -w e \< \>
=======

	rm -f $(echo -e $files | grep -w "\<$name\>") # da controllare la rindondanza di -w e \< \>
>>>>>>> c8ea7e1ec142ec69e1cb1b10573b1f45fe233f2e
fi
