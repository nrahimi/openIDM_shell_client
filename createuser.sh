#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Create a single user as given by json payload

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
	echo "Argument missing.  Requires argument user id as arg 1"
	echo "Eg. ./createuser.sh jdoe @jdoe.json"
	exit
fi

#check that arg is passed
if [ "$2" = "" ]; then
	echo "Argument missing.  Requires json payload as arg 2"
	echo "Eg. ./createuser.sh jdoe @jdoe.json"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1"
DATA=$2

./puturl.sh $URL $DATA
