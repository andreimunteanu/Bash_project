#!/bin/bash
if [ $# -ne 1 ]
	then
		echo "Utilizzo corretto: <repo>"
		exit;
		
fi

if [ ! -d ./$@ ]
	then
		mkdir $@ 
		mkdir .$@.bck;
else
		echo "<repo> "$1" esiste già";
fi 
