#!/bin/bash
if [ $# -ne 1 ]                         # controlla numero di parametri
then 
    echo "utilizzo errato: remove <file_name>"
    exit;                               # se diverso da 1, esci
fi
                                        # cerca tutti i file file_name nella directory
file_list=$(find . -name $@)            # corrente e nelle sue sotto directory 
file_list=${file_list//"./"/"\n./"}     # salva i risultati su righe distinte

n=$(echo -e $file_list | grep -wc "$@") # salva il numero di risultati

if [ $n -eq 2 ] || [ $n -eq 1 ]		# caso singolo file trovato
then                                    # in una sola repo con possibile
    echo ciao grazie                    # copia di backup
    rm -f $(echo -e file_list);         # rimuove il file e relativa copia(se esiste)
    
else                                    # se più repo contengono il file file_name
    echo -e $file_list | grep -v "bck"                  # stampa a video le righe delle repo che 
    echo "Più di una repository contiene il file "$1"." # contegono il file senza le relative copie di backup
    echo "Inserisci nome repository."
                                        # attende in input il nome della repo
    read name                           # o una sua sotto-directory
    if [ ! -d ./$name ]                 # se la directory name non esiste
    then                                # esce
	echo  $name" non esistente"
	exit;
    fi
    
    rm -f $(echo -e $file_list | grep -w "$name") #rimuove i/il file dalla directory name
fi
