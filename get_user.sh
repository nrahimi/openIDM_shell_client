#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns a single user as given via argument id

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires object id as arg 1.  If _id isn't known but another field value is see get_users_key_value_query"
	echo "Eg. $0 jdoe"
	exit
fi

./geturl.sh http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/$1
