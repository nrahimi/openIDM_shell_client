#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns task instance

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires task id as arg 1"
	echo "Eg. $0 4512"
	exit
fi

./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/workflow/taskinstance/$1"


