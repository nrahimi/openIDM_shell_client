#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Triggers an existing task

#check that jq util is present
JQ_LOC="$(which jq)"
if [ "$JQ_LOC" = "" ]; then
   	echo "JSON parser jq not found.  Download from http://stedolan.github.com/jq/download/"
   	exit
fi

OPENIDM_SERVER=$(jq '.server' settings.json | sed 's/\"//g')
OPENIDM_SERVER_PORT=$(jq '.port' settings.json)

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires task name"
	echo "Eg. ./triggertask.sh sunset_scan"
	exit
fi

./posturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/taskscanner?_action=execute&name=schedule/$1"
