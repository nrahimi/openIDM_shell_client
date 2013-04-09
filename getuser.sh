#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns a single user as given via argument id

OPENIDM_SERVER=localhost
OPENIDM_SERVER_PORT=8080

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires argument id"
	echo "Eg. ./getuser.sh jdoe"
	exit
fi

./geturl.sh http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1
