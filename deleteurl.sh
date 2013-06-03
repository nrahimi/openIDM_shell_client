#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Wrapper for quickly calling curl to perform a DELETE against openIDM

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

#suck in username and password details
USERNAME=$(jq '.username' ./settings.json | sed 's/\"//g')
PASSWORD=$(jq '.password' ./settings.json | sed 's/\"//g')

#calls curl and parses response into jq
curl --request DELETE --header "X-OpenIDM-Username: $USERNAME" --header "X-OpenIDM-Password: $PASSWORD" --header "If-Match: \"0\"" $1 | jq .
