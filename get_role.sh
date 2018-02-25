#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns a single managed role as given via argument id

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires object id as arg 1.  If _id isn't known but another field value is see get_users_key_value_query or use get_roles to retrieve all id's"
	echo "Eg. $0 0b638187-b124-4cd2-837c-18bb1898be0a"
	exit
fi

./geturl.sh https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/role/$1
