#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Create a new managed role as given by json payload

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires JSON payload as arg 1 prefixed with @"
	echo "Eg. $0 @role1.json"
	exit
fi

URL="https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/role?_action=create"
DATA=$1

./postdataurl.sh $URL $DATA
