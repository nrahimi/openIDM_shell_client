#!/bin/bash
#Simon Moffatt
#15mar2013
#Wrapper for quickly calling curl and jq to perform a GET against openIDM

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
curl --request GET --header "X-OpenIDM-Username: openidm-admin" --header "X-OpenIDM-Password: openidm-admin" $1 | jq .
