#!/bin/bash
if [ $# -eq 0 ] || [ $# -gt 2 ]
	then
	echo "Errore: utilizzo: ciao...  "
	exit;

else
	if [ ! -d ./$1 ]
		then
		echo "cartella non esistente"
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
			var=$(find . -name $2)
			arrIN=(${var// / })
			n=${#arrIN[@]}
			echo $n
			if [ $n -eq 0 ]
				then
				echo "file "$2" non trovato"
				exit;
	
			elif [ $n -eq 1 ]		# caso singolo file trovato
				then
				echo ciao
				rsync -r $var ../$1 
			else
				var=""
				for el in ${arrIN[@]}; do
					var+=$el"\n"
				done
				echo -e $var
				echo "A causa di multiplo ritrovamento Inserisci nome directory o invio per la dir corrente"
				read dir_name
				if [ -z $dir_name ]
					then
						cp -rf $2 ../$1; # pensa prima di sparare
				else
					rsync -R $(echo -e $var | grep -w "\<$dir_name\>") ../$1/;
				fi
				cd ..
			fi
		fi
fi
