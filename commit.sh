#!/bin/bash
if [ $# != 1 ]
	then 
		echo "utilizzo errato: <repo>"
		exit;
fi
# controllo se esiste repo

source=$@"/"
destination="."$@".bck/"
#echo -e $source $destination
#fai diff come git
rsync -r $source $destination 

