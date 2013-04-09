#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns all managed users

OPENIDM_SERVER=localhost
OPENIDM_SERVER_PORT=8080

./geturl.sh http://$OPENIDM_SERVER:$OPENIDM_SERVER_PORT/openidm/managed/user/?_queryId=query-all-ids
