#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Gets all completed reconcilation jobs

#pulls in settings file
source settings.sh

./geturl.sh https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/recon
