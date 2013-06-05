#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Creates or replaces the sync.json configuration file

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
	echo "Argument missing.  Requires json payload as arg 1 prefixed with @"
	echo "Eg. ./createsync.sh @sync.json"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/config/sync"
DATA=$1

./puturl.sh $URL $DATA
