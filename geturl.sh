#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Wrapper for quickly calling curl and jq to perform a GET against openIDM

#pulls in settings file
source settings.sh

#check that URL is passed as an argument
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires URL"
	exit
fi

#check that jq util is present
JQ_LOC="$(which jq)"
if [ "$JQ_LOC" = "" ]; then
   	echo "JSON parser jq not found.  Download from http://stedolan.github.com/jq/download/"
   	exit
fi

#check that curl is present
CURL_LOC="$(which curl)"
if [ "$CURL_LOC" = "" ]; then
	echo "Curl not found.  Please install sudo apt-get install curl etc..."
	exit
fi

#run
curl -k --request GET --header "X-OpenIDM-Username: $USERNAME" --header "X-OpenIDM-Password: $PASSWORD" $1 | jq .

