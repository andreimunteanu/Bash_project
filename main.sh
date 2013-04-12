#!/bin/bash

INIT_REPO=./init_repo.sh #../progetto/init_repo.sh
COMMIT=./commit.sh #../progetto/commit.sh
REMOVE=./remove.sh #../progetto/remove.sh
REVERT=;
STATUS=./status.sh
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

status(){
echo "Inserisci nome <repo>"
read lista_parametri
$STATUS $lista_parametri
}

stampa_menu(){
 echo -e "\nInserisci l'operazione da effettuare:"
 echo -e "\t1) init-repo"
 echo -e "\t2) commit"
 echo -e "\t3) remove"
 echo -e "\t4) revert"
 echo -e "\t5) status"
 echo -e "\t6) file_search\n\n"
}

lista_parametri=""
scelta=1
clear
while [ "$scelta" != "0" ]
	do
		stampa_menu
		read -p "> " scelta
		case $scelta in 
		0) exit;;
		1) init_repo;;
		2) commit;;
		3) remove;;
		4) $REVERT $lista_parametri;;
		5) status;;
		6) $FILE_SEARCH $lista_parametri;;
		*) echo "ERRORE: Valore inserito non valido."	
		esac

done

