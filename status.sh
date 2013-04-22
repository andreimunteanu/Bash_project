#!/bin/bash
if [ $# -ne 1 ] # controlla il numero di parametri passati
then
    echo "utilizzo errato: <repo>" # esce se non corrisponde
    exit;
fi
if [ ! -d ./$1 ] # se non esiste <repo>
then
    echo "<repo> "$1" non esistente " # esce
    exit;
fi
source=$@"/" # aggiunge lo slash per indicare directory
destination="."$@".bck/" # .<repo>.bck per il backup
diff -r --brief $source $destination # stampa i file diversi nelle reciproche cartelle 
                                     # o non stampa nulla se non ci sono differenze
