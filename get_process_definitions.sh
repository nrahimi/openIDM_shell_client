#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns all process definitions

#pulls in settings file
source settings.sh

./geturl.sh "https://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/workflow/processdefinition?_queryId=query-all-ids"

