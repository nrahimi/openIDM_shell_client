#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns configuration object for given type

#pulls in settings file
source settings.sh

#check that arg is passed	
if [ "$1" = "" ]; then
	echo ""
	echo "Argument missing.  Requires name of conf object as arg 1"
	echo "Eg. sync, managed, router, cluster, audit, authentication, scheduler, workflow"
	echo "Eg. $0 sync"
	echo ""
	exit
fi

./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/config/$1"



