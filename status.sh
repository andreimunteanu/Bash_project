#!/bin/bash
if [ $# != 1 ]
	then 
		echo "utilizzo errato: <repo>"
		exit;
fi
#controllo che non esiste la repo
source=$@"/"
destination="."$@".bck/"
diff -r --brief $source $destination
echo "vuoi ulteriori info"
read m
echo "puppa"
