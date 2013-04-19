#!/bin/bash
if [ $# -ne 1 ]
	then
		echo "Utilizzo corretto: <repo>"
		exit;
		
fi

if [ -d ./$1 ]
	then
		echo  "<repo> "$1" esiste già "
		exit;
fi

if [ ! -d ./$@ ]
	then
		mkdir $@ 
		mkdir .$@.bck;
else
		echo "repo già esistente";
fi 
