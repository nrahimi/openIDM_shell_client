OpenIDM Shell Client
====================

Basic set of Bash wrapper scripts that use curl, jq and others to access the openIDM (http://forgerock.com/openidm) RESTful interface.
<br/>
Edit the settings.sh file with server and port values for OpenIDM instance.
<br/>
Tested against OpenIDM 2.1
<br/>
<br/>
Run ./interactive.sh for interactive menu driven front end to all scripts, or each script can be run individually.
<br/>
<br/>
<b>geturl</b> - perform HTTP GET request. Takes URL as argument
<br/>
<b>puturl</b> - perform HTTP PUT request. Takes URL as argument 1; JSON payload as argument 2
<br/>
<b>posturl</b> - perform HTTP POST request. Takes URL as argument 1
<br/>
<b>deleteurl</b> - perform HTTP DELETE request.  Takes URL as argument 1
<br/>
<br/>
Individual wrappers for specific functions that use the above generic wrappers:
<br/>
<br/>
<b>MANAGED USERS</b>
<br/>
<b>get_user</b> - returns a single managed user json object; Takes id as argument 1 (if searching on userName see get_users_key_value_query)
<br/>
<b>get_users</b> - returns json containing all managed user ids; No arguments
<br/>
<b>create_user</b> - creates a single user.  Takes JSON payload as argument 1. _id auto generated by server. 
<br/>
<b>delete_user</b> - deletes a single user.  Takes id as argument 1
<br/>
<b>update_user</b> - updates a user with array of new key values.  Takes id as argument 1.  Takes json payload as argument 2
<br/>
<b>get_users_key_value_query</b> - returns users that match to the specific key value query.  Takes field as arg 1, value as arg 2. Eg manager jdoe
<br/>
<br/>
<b>ROLES</b>
<br/>
<b>get_roles</b> - returns all managed role objects
<br/>
<b>create_role</b> - creates a role with a server-side generated ID (_action=create).  Takes JSON role payload as arg 1.
<br/>
<b>get_role</b> - returns a single role object.  Requires role _id as arg 1.
<br/>
<b>delete_role</b> - deletes role object.  Requires role _id as arg 1.
<br/>
<b>update_user_role_assignments</b> - interactive menu option only. Requires patch payload and _id of user
<br/>
<b>get_role_membership</b> - lists directly assigned members of a role.  Takes _id of role as arg 1
<br/>
<br/>
<b>RECONCILIATION</b>
<br/>
<b>get_recon_jobs</b> - returns json containing all completed reconcilation jobs; No arguments
<br/>
<b>run_recon</b> - runs a specific reconciliation job.  Takes sync name as argument 1
<br/>
<b>cancel_recon</b> - cancels an existing reconciliation job.  Takes recon id as argument 1
<br/>
<br/>
<b>GENERAL</b>
<br/>
<b>get_global_config</b> - returns json of global configuration.  No arguments
<br/>
<b>get_status</b> - returns status of OpenIDM instance. No arguments
<br/>
<b>get_policies</b> - returns all policy details.  No arguments
<br/>
<b>get_config</b> - returns individual config object.  Takes object name as argument 1
<br/>
<b>set_config</b> - updates config object.  Takes JSON object as argument 1
<br/>
<b>get_config_connector</b> - returns configuration of specific connector instance.  Takes connector instance name as arg 1
<br/>
<b>ping_idm</b> - basic system alive check.  No arguments
<br/>
<br/>
<b>WORKFLOW</b>
<br/>
<b>trigger_task</b> - triggers an existing task object.  Takes task name as argument 1
<br/>
<b>get_task_instances</b> - lists all current workflow task instances.  No arguments
<br/>
<b>get_task_instance</b> - returns specific task instance.  Takes task id as argument 1
<br/>
<b>cancel_task</b> - cancels an existing running task.  Takes task id as argument 1
<br/>
<b>complete_task</b> - completes a given task id.  Takes workflow task id as argument 1
<br/>
<b>get_process_definitions</b> - returns all process / workflow definitions. No arguments
<br/>
<b>get_process_definition</b> - returns single process / workflow definition. Process id as argument 1
<br>
<b>get_process_instances</b> - returns all process / workflow instances.  No arguments
<br/>
<br/>
<b>AUDIT</b>
<br/>
<b>get_recon_audit_log</b> - returns entire audit log for given recon id.  Takes recon id as argument 1
<br/>
<b>get_recon_audit_log_ABSENT</b> - returns records with situation ABSENT in recon log.  Takes recon id as argument 1
<br/>
<b>get_recon_audit_log_UNASSIGNED</b> - returns records with situation UNASSIGNED in recon log.  Takes recon id as argument 1
<br/>
<b>get_recon_audit_log_SOURCE_MISSING</b> - returns records with situation SOURCE_MISSING in recon log.  Takes recon id as argument 1
<br/>
<b>get_recon_audit_log_entry</b> - returns single log entry.  Takes log entry id as argument 1
<br/>
<b>get_activity_log</b> - returns entire activity log.  No arguments
<br/>
<b>get_activity_log_entry</b> - returns single activity log entry.  Takes activity id as argument 1
<br/>
<b>get_access_log</b> - returns entire access log.  No arguments
<br/>
<b>get_access_log_entry</b> - returns single access log entry.  Takes access id as argument 1
<br/>
<br/>
<b>TEMPLATES</b>
<br/>
Template JSON files for use with creating objects
<br/>
template_user.json - can be used with ./create_user to create add a managedUser object
<br/>
<br/>
<b>Requirements</b>
The scripts were tested with jq v1.2 and curl v7.22.0.
<br/>
<br/>
Use as-is, no warranty implied.  Leave this readme and any attribution in place. Simon Moffatt, 2013
<br/>
<br/>Note these are my tools and in no way officially supported by Forgerock.  They are publicly available as a community contribution.
