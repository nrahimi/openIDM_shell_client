#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Create a new managed user as given by json payload

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires JSON payload as arg 1 prefixed with @"
	echo "Eg. $0 @jdoe.json"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user?_action=create"
DATA=$1

./postdataurl.sh $URL $DATA
