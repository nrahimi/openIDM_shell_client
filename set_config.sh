#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Sends given configuration object to OpenIDM

#pulls in settings file
source settings.sh

#check that arg is passed	
if [ "$1" = "" ]; then
	echo ""
	echo "Argument missing.  Requires name of conf object as arg 1"
	echo "Eg. sync, managed, router, cluster, audit, authentication, scheduler, workflow"
	echo "Eg. $0 sync.json"
	echo ""
	exit
fi

#strip out just basename, removing extension
BASENAME=$(basename $1 .json)

#url needs just basename
URL="https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/config/$BASENAME"

#data needs appending with @ so that curl can pick it up
DATA="@$1"

#send to server
./puturl.sh $URL $DATA





