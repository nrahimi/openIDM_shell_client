#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Cancel running task

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires task id"
	echo "Eg. $0 edfaf59c-aad1-442a-adf6-3620b24f8385"
	exit
fi

./posturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/taskscanner/$1?_action=cancel"
