#!/bin/bash
if [ $# -eq 0 ] || [ $# -gt 2 ] # controlla il numero di parametri passati
then
    echo "Errore, utilizzo: <repo> [file] " # esce se non corrisponde
    exit;
    
else
    if [ ! -d ./$1 ] # controlla se la repo esiste
    then
	echo "<repo> "$1" non esistente." # esce se non esiste
	exit;
    fi
    if [ $# -eq 1 ] # caso: un solo parametro
    then # copia tutto da .<repo>.bck in <repo>
	cd ".$@.bck"
	cp -rf . ../$@
	cd ..;

    elif [ $# -eq 2 ] # caso: due parametri
    then
	cd ".$1.bck" # cambia directory di lavoro: .<repo>.bck
	file_list=$(find . -name $2) # cerca tutti i <file> in .<rep>.bck
	file_list=${file_list//"./"/"\n./"} # salva i risultati su righe distinte
					    # nella variabile file_list
	n=$(echo -e $file_list | grep -wc "$2") # salva quanti <file> sono stati trovati
                                                # in .<repo>.bck
	if [ $n -eq 0 ] # se non sono stati trovati file: esce
	then
	    echo "file "$2" non trovato."
	    exit;

	elif [ $n -eq 1 ] # caso singolo file trovato
	then # copia il file da .<repo>.bck in <repo>
	    rsync -R $(echo -e $file_list) ../$1
	else # se ci sono più file
	    echo -e $file_list
	    echo "In "$1" c'è più di un file di nome "$2"."
	    echo "Inserisci nome directory o invio per la dir corrente."
	    read dir_name # prende in input da utente il nome della directory
	    if [ -z $dir_name ] # da cui copiare il file: <invio> per la directory corrente
	    then
		cp -rf $2 ../$1; # copia dalla directory corrente
	    else
		rsync -qR $(echo -e $file_list | grep -w "$dir_name") ../$1; # copia dalle directory dir_name il file
	    fi # rsync prende in input solo le righe che contengono dir_name
	    cd .. # esce da .<repo>.bck
	fi
    fi
fi
