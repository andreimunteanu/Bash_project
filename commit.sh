#!/bin/bash
if [ $# -ne 1 ] # controlla il numero di parametri passati
then
    echo "utilizzo errato: <repo>" # esce se non corrisponde
    exit;
fi
if [ ! -d ./$1 ] # se <repo> non esiste
then
    echo "<repo> "$1" non esistente " # esce
    exit;
fi

source=$@"/" # imposta <repo>/ come directory sorgente
destination="."$@".bck/" # imposta .<repo>.bck come directory destinazione
rsync -r $source $destination # aggiorna i files in .<repo>.bck che risultano diversi dai rispettivi in <repo>
