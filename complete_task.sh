#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Completes a workflow task object

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires task id"
	echo "Eg. $0 13"
	exit
fi

./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/workflow/taskinstance/$1?_action=complete"


