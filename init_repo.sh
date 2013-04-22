#!/bin/bash
if [ $# -ne 1 ] # controlla il numero di parametri passati
then
    echo "Utilizzo corretto: <repo>" # esce se non corrisponde
    exit;
fi

if [ ! -d ./$@ ] # se <repo> non esiste già
then
    mkdir $@ # crea la cartella <repo>
    mkdir .$@.bck; # crea la cartella nascosta di backup .<repo>.bck
else
    echo "<repo> "$1" esiste già"; # se <repo> esiste già esce
fi 
