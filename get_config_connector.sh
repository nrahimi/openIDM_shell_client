#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns connector instance configuration

#pulls in settings file
source settings.sh

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires connector instance name"
	echo "Eg. ./getconnectorconfig.sh scriptedsql"
	exit
fi

./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/config/provisioner.openicf/$1"

