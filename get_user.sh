#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns a single user as given via argument id

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
	echo "Argument missing.  Requires argument id"
	echo "Eg. ./getuser.sh jdoe"
	exit
fi

./geturl.sh http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1
