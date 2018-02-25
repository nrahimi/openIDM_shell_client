#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns process definition as given by argument

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires process definition id as arg 1"
	echo "Eg. $0 roleRequest:3:206"
	exit
fi

./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/workflow/processdefinition/$1"


