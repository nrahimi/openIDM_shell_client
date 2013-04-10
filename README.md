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
<b>posturl</b> - perform GTTP POST request. Takes URL as argument 1
<br/>
<br/>
Individual wrappers for specific functions that use the above generic wrappers:
<br/>
<br/>
<b>getuser</b> - returns a single managed user json object; Takes id as argument 1
<br/>
<b>getusers</b> - returns json containing all managed user ids; No arguments
<br/>
<b>getreconjobs</b> - returns json containing all completed reconcilation jobs; No arguments
<br/>
<b>runrecon</b> - runs a specific reconciliation job.  Takes sync name as argument 1
<br/>
<b>cancelrecon</b> - cancels an existing reconciliation job.  Takes recon id as argument 1
<br/>
<b>getconfig</b> - returns json of global configuration.  No arguments
<br/>
<b>getstatus</b> - returns status of OpenIDM instance. No arguments
<br/>
<b>getconnectorconfig</b> - returns configuration of specific connector instance.  Takes connector instance name as arg 1
<br/>
<b>getpolicies</b> - returns all policy details.  No arguments
<br/>
<b>triggertask</b> - triggers an existing task object.  Takes task name as argument 1
<br/>
<b>canceltask</b> - cancels an existing running task.  Takes task id as argument 1
