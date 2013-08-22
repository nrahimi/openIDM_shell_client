#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns audit log for given recon id

#pulls in settings file
source settings.sh

#check that situation arg is passed
if [ "$2" = "" ]; then
	echo ""
	echo "Argument missing.  Requires situation as arg 1"
	echo "Situations include: UNASSIGNED, TARGET_IGNORED, SOURCE_IGNORED, MISSING, FOUND, AMBIGUOUS, UNQUALIFIED, CONFIRMED, SOURCE_MISSING, ABSENT"
	echo ""
	echo "Eg. $0 SOURCE_MISSING 8dcf3a74-f82c-464f-9577-e605020e91df"
	echo ""
	exit
fi


#check that arg is passed
if [ "$2" = "" ]; then
	echo ""
	echo "Argument missing.  Requires recon id as arg 2"
	echo "Eg. $0 <SITUATION> 8dcf3a74-f82c-464f-9577-e605020e91df"
	echo ""
	exit
fi

#./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/recon/?_queryId=audit-by-recon-id&reconId=$1"
./geturl.sh "http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/audit/recon?_queryId=audit-by-recon-id-situation&situation=$1&reconId=$2"
