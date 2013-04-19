#!/bin/bash
read -p "Inserisci nome <repo> " repo

if [ ! -d ./$1 ]
	then
		echo  "<repo> "$1" non esistente "
		exit;
fi

cd $repo
file_list=$(find . -type f)
files=""
for file in $file_list; #Versione Beta
	do	
		if [ -n "$(grep $* $file)" ]	
			then
				files+=$file"\n";	
		fi
	#echo -e $file
done

echo -e $files | sort 

cd ..
