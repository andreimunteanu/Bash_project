#!/bin/bash
bold=`tput bold` # per formattare il testo in corsivo
normal=`tput sgr0` # resetta gli attributi del testo

# lista degli script bash componenti il progetto:
INIT_REPO=./init_repo.sh
COMMIT=./commit.sh
REMOVE=./remove.sh
REVERT=./revert.sh
STATUS=./status.sh
FILE_SEARCH=./file_search.sh

# lista di funzioni che richiamano i rispettivi script bash
init_repo(){
    echo "Inserisci <repo>"
    read lista_parametri
    $INIT_REPO $lista_parametri
}

commit(){
    echo "Inserisci <repo>"
    read lista_parametri
    $COMMIT $lista_parametri
}

remove(){
    echo "Inserisci nome file"
    read lista_parametri
    $REMOVE $lista_parametri
}

revert(){
    echo "Inserisci nome <repo>"
    read lista_parametri
    $REVERT $lista_parametri
}

status(){
    echo "Inserisci nome <repo>"
    read lista_parametri
    $STATUS $lista_parametri
}

file_search(){
    echo "Inserisci pattern"
    read lista_parametri
    $FILE_SEARCH $lista_parametri
}

# stampa il menu
stampa_menu(){
    echo -e "\n"
    
# '\E[37;44m' = font bianco su sfondo blue, mentre ${bold} e ${normal} richiamano i parametri inizializzati a inizio script
    echo -e " ${bold} Inserisci l'operazione da effettuare:${normal} "  
    echo -e "\t"'\E[37;44m'"${bold}<1>${normal} Init-repo"
    echo -e "\t"'\E[37;44m'"${bold}<2>${normal} Commit"
    echo -e "\t"'\E[37;44m'"${bold}<3>${normal} Remove"
    echo -e "\t"'\E[37;44m'"${bold}<4>${normal} Revert"
    echo -e "\t"'\E[37;44m'"${bold}<5>${normal} Status"
    echo -e "\t"'\E[37;44m'"${bold}<6>${normal} File_search\n\n"
}

lista_parametri="" # stringa utilizzata nelle varie funzioni
scelta=1 # scelta inizializzato ad 1 per entrare nel while
clear # pulisce il terminale prima di stampare il menu per la prima volta
while [ "$scelta" != "0" ] # 0 = per uscire
    do
    stampa_menu
    read -p "> " scelta # legge la scelta dell'utente dopo aver stampato il prompt >
    case $scelta in
	0) exit;;
	1) init_repo;;
	2) commit;;
	3) remove;;
	4) revert;;
	5) status;;
	6) file_search;;
	*) echo "ERRORE: Valore inserito non valido." # in caso l'utente non avesse inserito un numero da 0 a 6
    esac
done
