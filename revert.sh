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
<<<<<<< HEAD
			file_list=$(find . -name $2)
			file_list=${file_list//"./"/"\n./"}
			echo -e $file_list

			n=$(echo -e $file_list | grep -wc "$2")
			
=======
			files_list=$(find . -name $2)
			files_list=($files_list) #(${var//" "/" \n"})
			n=${#files_list[@]} # grep che conta quanti file ha trovato
>>>>>>> c8ea7e1ec142ec69e1cb1b10573b1f45fe233f2e
			if [ $n -eq 0 ]
				then
					echo "file "$2" non trovato"
					exit;
	
			elif [ $n -eq 1 ]		# caso singolo file trovato
				then
					echo ciao
<<<<<<< HEAD
					rsync -R $(echo -e $file_list) ../$1 #forse non funziona
			else
				echo -e $file_list
=======
					rsync -r $files_list ../$1 
			else
				files=""
				for el in ${files_list[@]}; do
					files+=$el"\n"
				done
				echo -e $files
>>>>>>> c8ea7e1ec142ec69e1cb1b10573b1f45fe233f2e
				echo "A causa di multiplo ritrovamento Inserisci nome directory o invio per la dir corrente"
				read dir_name
				if [ -z $dir_name ]
					then
						cp -rf $2 ../$1; 
				else
<<<<<<< HEAD
					rsync -R $(echo -e $file_list | grep -w "$dir_name") ../$1;
=======
					rsync -R $(echo -e $files | grep -w "\<$dir_name\>") ../$1/;
>>>>>>> c8ea7e1ec142ec69e1cb1b10573b1f45fe233f2e
				fi
			cd ..
			fi
		fi
fi
