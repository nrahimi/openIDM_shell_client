#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Triggers an existing task

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires task name"
	echo "Eg. ./triggertask.sh sunset_scan"
	exit
fi

./posturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/taskscanner?_action=execute&name=schedule/$1"
