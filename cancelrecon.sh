#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Cancels an existing reconcilation job for specific mapping definition

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
	echo "Argument missing.  Requires reconciliation job id as arg 1"
	echo "Eg. ./cancelrecon.sh 0890ad62-4738-4a3f-8b8e-f3c83bbf212e"
	exit
fi

./posturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/recon/$1?_action=cancel"



