#!/bin/bash
if [ $# -ne 1 ] # controlla numero di parametri
then
echo "utilizzo errato: remove <file_name>"
    exit; # se diverso da 1, esce
fi
read -p "Inserisci nome <repo> " repo # prende il nome di <repo> dall'utente

if [ ! -d ./$repo ] # se <repo> non esiste
then
    echo "<repo> "$repo" non esistente " # esce
    exit;
fi
cd "$repo" # cambia directory di lavoro: repo

# cerca tutti i file file_name nella repo
file_list=$(find . -name $@ -type f) # e nelle sue sotto directory
file_list=${file_list//"./"/"\n./"} # salva i risultati su righe distinte
bck_file_list=${file_list//"./"/"\n../."$repo".bck/"}

n=$(echo -e $file_list | grep -wc "$@") # salva il numero di risultati

if [ $n -eq 0 ] # se non sono stati trovati file: esce
then
    echo "file "$@" non trovato.";
elif [ $n -eq 1 ] # caso singolo file trovato
then  
    rm -f $(echo -e $file_list $bck_file_list); # rimuove il file e relativa copia(se esiste)

else # se più repo contengono il file file_name
    echo -e $file_list  # stampa a video le righe delle repo che
    echo "Più di una sottodirectory contiene il file "$1"."
    echo "Inserisci nome della sottodirectory o invio per la directory corrente."
              # attende in input il nome della sottodirectory
    read name
    if [ -z $name ] # la directory corrente
    then 
	rm -f "./"$@ "../."$repo".bck/"$@
    else
	rm -f $(echo -e $file_list | grep -w "$name") # rimuove i/il file dalla repo nella sottodirectory name
	rm -f $(echo -e $bck_file_list | grep -w "$name"); # rimuove i/il file da .repo.bck
    fi
fi
cd ..