#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Deletes a single user as given via arg

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires argument user id as arg 1"
	echo "Eg. ./deleteuseruser.sh jdoe"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1"

./deleteurl.sh $URL 
