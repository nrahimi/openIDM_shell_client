#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Deletes a single role as given via arg

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires role _id as arg 1"
	echo "Eg. $0 0b638187-b124-4cd2-837c-18bb1898be0a"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/role/$1"

./deleteurl.sh $URL 
