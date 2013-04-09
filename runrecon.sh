#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Runs a reconcilation job for specific mapping definition

OPENIDM_SERVER=localhost
OPENIDM_SERVER_PORT=8080

#check that arg is passed
if [ "$1" = "" ]; then
	echo "Argument missing.  Requires argument mapping name from appropriate conf/sync.json"
	echo "Eg. ./runrecon.sh systemHrdb_managedUser"
	exit
fi

./posturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/recon?_action=recon&mapping=$1"


