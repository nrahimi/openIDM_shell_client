#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Creates or replaces the sync.json configuration file

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires json payload as arg 1 prefixed with @"
	echo "Eg. $0 @sync.json"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/config/sync"
DATA=$1

./puturl.sh $URL $DATA
