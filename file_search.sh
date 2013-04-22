#!/bin/bash
read -p "Inserisci nome <repo> " repo # prende il nome di <repo> dall'utente

if [ ! -d ./$repo ] # se <repo> non esiste
then
    echo "<repo> "$repo" non esistente " # esce
    exit;
fi

cd $repo # se <repo> esiste, entra in <repo>
file_list=$(find . -type f) # lista di files in <repo>
files="" # inizializza a stringa vuota files
for file in $file_list; # per ogni file nella lista
do
    if [ -n "$(grep $* $file)" ] # cerca la il pattern $* (da main.sh) e verifica che il risultato sia una stringa non nulla
    then
	files+=$file"\n"; # se il controllo è andato a buon fine concatena la stringa appena trovata a files
    fi
done

echo -e $files | sort # stampa dell'elenco di files appena trovato in ordine alfabetico
                      # utilizzando la funzione sort
cd ..
