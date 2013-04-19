#!/bin/bash
if [ $# -ne 1 ]
	then 
		echo "utilizzo errato: <repo>"
		exit;
fi
if [ ! -d ./$1 ]
	then
		echo  "<repo> "$1" non esistente "
		exit;
fi
source=$@"/"
destination="."$@".bck/"
diff -r --brief $source $destination
