#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns all managed users that match to field and value combination

#check that jq util is present
JQ_LOC="$(which jq)"
if [ "$JQ_LOC" = "" ]; then
   	echo "JSON parser jq not found.  Download from http://stedolan.github.com/jq/download/"
   	exit
fi

#suck in username and password details
OPENIDM_SERVER=$(jq '.server' settings.json | sed 's/\"//g')
OPENIDM_SERVER_PORT=$(jq '.port' settings.json)

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires field attribute as arg 1"
	echo "Eg. $0 familyName Smith"
	exit
fi

#check that arg is passed
if [ "$2" = "" ]; then
	echo "Argument missing.  Requires field value as arg 2.  Pass strings with spaces in quotes"
	echo "Eg. $0 familyName Smith"
	exit
fi

URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user?_queryId=get-by-field-value&field=$1&value=$2"
#re-encode url not to contain spaces
URL=$( printf "%s\n" "$URL" | sed 's/ /%20/g' )

./geturl.sh $URL

