#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Updates a single user as given by json payload

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

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires user object id as arg 1"
	echo "Eg. ./updateuser.sh jdoe @data.json"
	exit
fi

#check that arg is passed
if [ "$2" = "" ]; then
	echo "Argument missing.  Requires json payload as arg 2"
	echo "Eg. $0 jdoe @data.json"
	echo "data.json contains map/array of keys to change. Eg:"
	echo "[{"replace":"/city","value": "Manchester"}]"
	exit
fi

#suck in username and password details
USERNAME=$(jq '.username' ./settings.json | sed 's/\"//g')
PASSWORD=$(jq '.password' ./settings.json | sed 's/\"//g')
OPENIDM_SERVER=$(jq '.server' settings.json | sed 's/\"//g')
OPENIDM_SERVER_PORT=$(jq '.port' settings.json)

#form url
#URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user?_action=patch&_queryId=for-userName&uid=$1"
URL="http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1?_action=patch"

#data payload in json file
DATA=$2

#run parses JSON response to for pretty reading
echo ""
echo "Original User Object:"
echo "---------------------"
echo ""
./get_user.sh $1
echo ""
curl --request POST --header "X-OpenIDM-Username: $USERNAME" --header "X-OpenIDM-Password: $PASSWORD" --data $DATA $URL | jq .
echo ""
echo "Updated User Object:"
echo "---------------------"
echo ""
./get_user.sh $1

