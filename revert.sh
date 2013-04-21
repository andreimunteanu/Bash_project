#!/bin/bash
if [ $# -eq 0 ] || [ $# -gt 2 ]
	then
		echo "Errore: utilizzo: ciao...  "
		exit;

else
	if [ ! -d ./$1 ]
		then
			echo "<repo> "$1" non esistente"
			exit;
	fi
	

	if [ $# -eq 1 ]
		then	
			cd ".$@.bck"
			cp -rf . ../$@ 
			cd ..;
	
	elif [ $# -eq 2 ]
		then	
			cd ".$1.bck"
			file_list=$(find . -name $2)
			file_list=${file_list//"./"/"\n./"}
			echo -e $file_list

			n=$(echo -e $file_list | grep -wc "$2")
			
			if [ $n -eq 0 ]
				then
					echo "file "$2" non trovato"
					exit;
	
			elif [ $n -eq 1 ]		# caso singolo file trovato
				then
					echo ciao
					rsync -R $(echo -e $file_list) ../$1 #forse non funziona
			else
				echo -e $file_list
				echo "A causa di multiplo ritrovamento Inserisci nome directory o invio per la dir corrente"
				read dir_name
				if [ -z $dir_name ]
					then
						cp -rf $2 ../$1; 
				else
					rsync -R $(echo -e $file_list | grep -w "$dir_name") ../$1;
				fi
			cd ..
			fi
		fi
fi
