#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns access log

#check that jq util is present
JQ_LOC="$(which jq)"
if [ "$JQ_LOC" = "" ]; then
   	echo "JSON parser jq not found.  Download from http://stedolan.github.com/jq/download/"
   	exit
fi

OPENIDM_SERVER=$(jq '.server' settings.json | sed 's/\"//g')
OPENIDM_SERVER_PORT=$(jq '.port' settings.json)

./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/access"


