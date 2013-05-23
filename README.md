OpenIDM Shell Client
====================

Basic set of Bash wrapper scripts that use curl, jq and others to access the openIDM RESTful interface.
<br/>
Edit the settings.json file with server and port values for OpenIDM instance.
<br/>
<br/>
<b>geturl</b> - perform HTTP GET request. Takes URL as argument
<br/>
<b>puturl</b> - perform HTTP PUT request. Takes URL as argument 1; JSON payload as argument 2
<br/>
<b>posturl</b> - perform HTTP POST request. Takes URL as argument 1
<br/>
<b>deleteurl</b> - perform HTTP DELETE request.  Takes URL as argument 1.
<br/>
<br/>
Individual wrappers for specific functions that use the above generic wrappers:
<br/>
<br/>
<b>MANAGED USERS</b>
<br/>
<b>getuser</b> - returns a single managed user json object; Takes id as argument 1
<br/>
<b>getusers</b> - returns json containing all managed user ids; No arguments
<br/>
<b>createuser</b> - creates a single user.  Takes id as argument 1; json payload as argument 2
<br/>
<b>deleteuser</b> - deletes a single user.  Takes id as argument 1.
<br/>
<b>updateuser</b> - updates a user with array of new key values.  Taked id as argument 1.  Takes json payload as argument 2.
<br/>
<br/>
<b>RECONCILIATION</b>
<br/>
<b>getreconjobs</b> - returns json containing all completed reconcilation jobs; No arguments
<br/>
<b>runrecon</b> - runs a specific reconciliation job.  Takes sync name as argument 1
<br/>
<b>cancelrecon</b> - cancels an existing reconciliation job.  Takes recon id as argument 1
<br/>
<b>createsync</b> - creates or replaces the sync.json mappings files.  Takes json payload file as arg 1.
<br/>
<br/>
<b>GENERAL</b>
<br/>
<b>getconfig</b> - returns json of global configuration.  No arguments
<br/>
<b>getstatus</b> - returns status of OpenIDM instance. No arguments
<br/>
<b>getpolicies</b> - returns all policy details.  No arguments
<br/>
<b>getsync</b> - returns sync.json config object.  No arguments
<br/>
<b>pingidm</b> - basic system alive check.  No arguments
<br/>
<br/>
<b>CONNECTORS</b>
<br/>
<b>getconnectorconfig</b> - returns configuration of specific connector instance.  Takes connector instance name as arg 1
<br/>
<br/>
<b>TASKS</B>
<br/>
<b>triggertask</b> - triggers an existing task object.  Takes task name as argument 1
<br/>
<b>canceltask</b> - cancels an existing running task.  Takes task id as argument 1
<br/>
<b>gettasks</b> - lists all existing tasks.  No arguments
<br/>
<br/>
<b>WORKFLOW</b>
<br/>
<b>getworkflowtasks</b> - lists all current workflow tasks.  No arguments
<br/>
<b>completeworkflowtask</b> - completes a given task id.  Takes workflow task id as argument 1
<br/>
<br/>
<b>Requirements</b>
The scripts were tested with jq v1.2 and curl v7.22.0.
<br/>
<br/>
Use as-is, no warranty implied.  Leave this readme and any attribution in place.
Simon Moffatt, 2013
