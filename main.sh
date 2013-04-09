#!/bin/bash

INIT_REPO=./init_repo.sh #../progetto/init_repo.sh
COMMIT=./commit.sh #../progetto/commit.sh
REMOVE=./remove.sh #../progetto/remove.sh
REVERT=;
STATUS=;
FILE_SEARCH=;

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

stampa_menu(){
 echo "Inserisci l'operazione da effettuare:"
 echo "1) init-repo"
 echo "2) commit"
 echo "3) remove"
 echo "4) revert"
 echo "5) status"
 echo "6) file_search"
}

lista_parametri=""
scelta=1
while [ "$scelta" != "0" ]
	do
		stampa_menu
		read scelta
		case $scelta in 
		0) exit;;
		1) init_repo;;
		2) commit;;
		3) remove;;
		4) $REVERT $lista_parametri;;
		5) $STATUS $lista_parametri;;
		6) $FILE_SEARCH $lista_parametri;;
		*) echo "ERRORE: Valore inserito non valido."	
		esac

done

