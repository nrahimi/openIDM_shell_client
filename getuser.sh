#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Returns a single user as given via argument id
./geturl.sh http://localhost:8080/openidm/managed/user/$1
