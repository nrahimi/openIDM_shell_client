#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns audit log for given recon id

#check that jq util is present
JQ_LOC="$(which jq)"
if [ "$JQ_LOC" = "" ]; then
   	echo "JSON parser jq not found.  Download from http://stedolan.github.com/jq/download/"
   	exit
fi

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires recon id as arg 1"
	echo "Eg. ./get_recon_audit_log.sh 8dcf3a74-f82c-464f-9577-e605020e91df"
	exit
fi

OPENIDM_SERVER=$(jq '.server' settings.json | sed 's/\"//g')
OPENIDM_SERVER_PORT=$(jq '.port' settings.json)

./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/recon/?_queryId=audit-by-recon-id&reconId=$1"


