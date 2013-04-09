#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns all managed users
./geturl.sh http://localhost:8080/openidm/managed/user/?_queryId=query-all-ids
