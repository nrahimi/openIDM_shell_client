#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns audit log for given recon id

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires recon id as arg 1"
	echo "Eg. $0 8dcf3a74-f82c-464f-9577-e605020e91df"
	exit
fi

./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/recon/?_queryId=audit-by-recon-id&reconId=$1"


