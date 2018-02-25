#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Cancels an existing reconcilation job for specific mapping definition

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires reconciliation job id as arg 1"
	echo "Eg. $0 0890ad62-4738-4a3f-8b8e-f3c83bbf212e"
	exit
fi

./posturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/recon/$1?_action=cancel"



