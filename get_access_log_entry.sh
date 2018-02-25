#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns access log entry for given id

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires access id as arg 1"
	echo "Eg. $0 8dcf3a74-f82c-464f-9577-e605020e91df"
	exit
fi


./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/access/$1"


