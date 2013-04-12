#!/bin/bash
if [ $# != 1 ]
	then
		echo "Utilizzo corretto: <repo>"
		
fi
if [ ! -d ./$@ ]
	then
		mkdir $@ 
		mkdir .$@.bck;
else
		echo "repo già esistente";
fi 
