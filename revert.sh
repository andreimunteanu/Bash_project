#!/bin/bash
if [ '$#' = '1' ]
	then	
	cd ".$@.bck"
	cp -rf . ../$@ 
	cd ..;

elif [ $#=2 ]
	then	
		cd ".$1.bck"
		var=$(find . -name $2)
		arrIN=(${var// / })
		n=${#arrIN[@]}
		echo $n
		if [ '$n' = '1' ]		# caso singolo file trovato
			then
			echo ciao
			cp -rf $var ../$1 
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
				if [ ! -d ../$1/$dir_name/ ]
					then
						echo cippa
						mkdir ../$1/$dir_name/
				fi	
				cp -rf $(echo -e $var | grep -w "\<$dir_name\>") ../$1/$dir_name/;
			fi
		fi
		cd ..
else
	echo "Errore: utilizzo: ciao...  "
	exit;
fi
