#!/bin/bash
#OpenIDM Shell Client
#https://github.com/smof/openIDM_shell_client
#Interactive front end for all scripts
#Simon Moffatt 2013


#main menu interface ================================================================================================================================================================================
function menu() { 
	
	clear
	echo "OpenIDM Shell REST Client - Interactive Mode"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Manage Users"
	echo "2:  Manage Roles"
	echo "3:  Manage Recon"
	echo "4:  Manage Processes - To Be Implemented"
	echo "5:  Manage Tasks - To Be Implemented"
	echo "6:  Manage Configuration"
	echo "7:  System Logging"
	echo ""
	echo "P:  Ping OpenIDM"
	echo "C:  Configure Shell Client Settings"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option

	case $option in

		1)
			manage_user_menu
			;;	

		2)
			manage_roles_menu
			;;
			
		3)
			manage_recon_menu
			;;

		4)
			menu		 	
			#manage_processes_menu
			;;

		5)
			menu			
			#manage_tasks_menu
			;;

		6)
			manage_config_menu
			;;

		7)
			logging_menu
			;;

		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;
		[c] | [C])
				configure
				;;

		[p] | [P])
				ping_idm
				;;


		*)

			menu
			;;
	esac

}

#edits settings.json
function configure() {

	clear
	chmod 600 settings.sh
	nano settings.sh
	chmod 400 settings.sh
	menu
}

#calls ping_idm.sh
function ping_idm() {

	clear
	./ping_idm.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	menu
}


#main menu interface ================================================================================================================================================================================

#roles menu
function manage_roles_menu() {
	
	clear
	echo "OpenIDM Shell REST Client - Manage Roles"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Get All Roles"
	echo "2:  Get Role Using ID"
	echo "3:  Create Role"
	echo "4:  Delete Role"
	echo "5:  Assign Role to User"
	echo ""
	echo "B:  Back to main menu"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option

	case $option in

		1)
			get_roles
			;;	

		2)
			get_role
			;;

		3)
			create_role
			;;

		4)
			delete_role
			;;

		5)
			assign_role_to_user
			;;
			
		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;

		[b] | [B])
				menu
				;;

		*)

			manage_roles_menu
			;;
	esac
}
	

function assign_role_to_user() {
	
	clear
	echo "Enter the _id of the user to update:"
	read user_id
	echo ""
	echo "To assign a role to a user, we perform a patch again the user object, with a new roles array."
	echo "A JSON payload contains the patch for the roles attribute, that contains the changes."
	echo ""
	echo "The following JSON files are in this directory:"
	echo ""
	ls *.json
	echo ""
	echo "Select a JSON file with the necessary patch:"
	read roles_payload
	echo ""
	./update_user.sh $user_id @$roles_payload
	echo ""	
	read -p "Press [Enter] to return to menu"
	manage_roles_menu		
	
}


function delete_role() {
	
	clear
	echo "Enter the _id of the role to delete:"
	read role_id
	echo ""
	./delete_role.sh $role_id
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_roles_menu	
	
}

function get_role() {
	
	clear
	echo "Enter _id of the role to retrieve:"
	read role_id
	echo ""
	./get_role.sh $role_id	
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_roles_menu
}


function get_roles() {
	
	clear
	./get_roles.sh	
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_roles_menu

}

function create_role() {
	
	clear
	echo "The following JSON files exist in this directory:"
	echo ""	
	ls *.json
	echo ""
	echo "Enter the name of the JSON file that contains the new role:"
	read role_payload
	./create_role.sh "@$role_payload"
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_roles_menu

}



#config_menu ========================================================================================================================================================================================
function manage_config_menu() {

	clear
	echo "OpenIDM Shell REST Client - Config Menu"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Get Global Config"
	echo "2:  Get Specific Config Object (workflow, sync, managed ...)"
	echo "3:  Set Specific Config Object (workflow, sync, managed ...)"
	echo ""
	echo "B:  Return to main menu"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option

	case $option in

		1)
			get_global_config
			;;	


		2)
			get_config
			;;
		
		3)

			set_config
			;;
	
		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;
		[b] | [B])
				menu
				;;

		*)

			manage_config_menu
			;;
	esac

}

#calls set_config
function set_config() {

	clear
	echo "The following JSON files exist in this directory:"
	echo ""
	ls *.json
	echo ""
	echo "Enter the object to send:"
	read file
	./set_config.sh $file
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_config_menu
}


#calls get_config
function get_config() {

	clear
	echo "The following are example config objects that may exist in the conf/ directory, in addition to any custom objects:"
	echo ""
	echo "Eg. sync, managed, router, cluster, audit, authentication, scheduler, workflow"
	echo ""
	echo "Enter an object to retrieve:"
	read object
	./get_config.sh $object > $object.json
	echo ""
	cat $object.json
	echo ""
	echo "Object stored in $object.json in current directory"
	read -p "Press [Enter] to return to menu"
	manage_config_menu
}



#calls get_global_config
function get_global_config() {

	clear
	./get_global_config.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_config_menu
}



#config_menu ========================================================================================================================================================================================


#recon menu =========================================================================================================================================================================================
function manage_recon_menu() {

	clear
	echo "OpenIDM Shell REST Client - Recon Menu"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Run Reconciliation Task"
	echo "2:  Get All Recon Tasks Log"
	echo "3:  Get Specific Recon Task Log"
	echo ""
	echo "B:  Return to main menu"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option
	case $option in

		1)
			run_recon
			;;	

		2)
			get_recon_jobs
			;;

		3)
			get_recon_job_log
			;;

		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;
		[b] | [B])
				menu
				;;

		*)

			manage_recon_menu
			;;
	esac

}

#calls get_recon_SITUATION_log.sh
function get_recon_job_log() {

	clear
	echo "Enter reconciliation job id (check recon jobs log if not known):"
	read recon_id
	echo ""
	echo "The following recon situations exist:"
	echo ""	
	echo "1:  UNASSIGNED"
	echo "2:  TARGET_IGNORED"
	echo "3:  SOURCE_IGNORED"
	echo "4:  MISSING"
	echo "5:  FOUND"
	echo "6:  AMBIGUOUS"
	echo "7:  UNQUALIFIED"
	echo "8:  CONFIRMED"
	echo "9:  SOURCE_MISSING"
	echo "10: ABSENT"
	echo ""
	echo "Enter a situation:"
	read situation_option
	case $situation_option in

		1)
			situation="UNASSIGNED"
			;;	

		2)
			situation="TARGET_IGNORED"
			;;

		3)
			situation="SOURCE_IGNORED"
			;;

		4)
			situation="MISSING"
			;;

		5)
			situation="FOUND"
			;;

		6)
			situation="AMBIGUOUS"
			;;

		7)
			situation="UNQUALIFIED"
			;;

		8)
			situation="CONFIRMED"
			;;

		9)
			situation="SOURCE_MISSING"
			;;

		10)
			situation="ABSENT"
			;;

		*)

			manage_recon_menu
			;;
	esac
	./get_recon_SITUATION_log.sh $recon_id $situation
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_recon_menu
}

#calls run_recon.sh
function run_recon() {

	clear
	echo "Enter name of the mapping to run:"
	read mapping
	./run_recon.sh $mapping
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_recon_menu
}

#calls get_recon_jobs.sh
function get_recon_jobs() {

	clear
	./get_recon_jobs.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_recon_menu
}

#recon menu =========================================================================================================================================================================================




#logging menu ====================================================================================================================================================================================
function logging_menu() {

	clear
	echo "OpenIDM Shell REST Client - Logging Menu"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Get Access Log"
	echo "2:  Get Access Log Entry"
	echo "3:  Get Activity Log"
	echo "4:  Get Activity Log Entry"
	echo ""
	echo "B:  Return to main menu"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option

	case $option in

		1)
			get_access_log
			;;
		
		2)
			get_access_log_entry
			;;
		
		3)
			get_activity_log
			;;

		4)
			get_activity_log_entry
			;;				


		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;
		[b] | [B])
				menu
				;;


		*)

			logging_menu
			;;
	esac
}

#calls get_activity_log_entry
function get_activity_log_entry() {

	clear
	echo "Enter the activity log entry id:"
	read log_id
	./get_activity_log_entry.sh $log_id
	echo ""
	read -p "Press [Enter] to return to menu"
	logging_menu

}


#calls get_activity_log
function get_activity_log() {

	clear
	./get_activity_log.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	logging_menu		

}

#calls get_access_log_entry
function get_access_log_entry() {

	clear
	echo "Enter access log entry id:"
	read log_id
	./get_access_log_entry.sh $log_id
	echo ""
	read -p "Press [Enter] to return to menu"
	logging_menu	

}

#calls get_access_log
function get_access_log() {

	clear
	./get_access_log.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	logging_menu

}


#healtcheck menu ====================================================================================================================================================================================





#manage_user_menu ===================================================================================================================================================================================
function manage_user_menu() {

	clear
	echo "OpenIDM Shell REST Client - Manage Users"
	echo "----------------------------------------------------------------------------------"
	echo "1:  Get All Users"
	echo "2:  Get User Using UID"
	echo "3:  Get Users Using Key/Value Query"
	echo "4:  Create User"
	echo "5:  Delete User"
	echo "6:  Update User"
	echo ""
	echo "B:  Back to main menu"
	echo "X:  Exit"
	echo "----------------------------------------------------------------------------------"
	echo "Select an option:"
	read option

	case $option in

		1)
			get_users
			;;	

		2)
			get_user
			;;

		3)
		 	get_user_key_value_query
			;;

		4)
			create_user
			;;

		5)
			delete_user
			;;

		6)
			update_user
			;;

		[x] | [X])
				clear	
				echo "Byeeeeeeeeeeeeeeeeeee :)"
				echo ""			
				exit
				;;

		[b] | [B])
				menu
				;;

		*)

			manage_user_menu
			;;
	esac
}

#calls update_user script
function update_user() {

	clear
	echo "Enter the uid of the user that needs updating:"
	read user
	echo ""
	echo "The following JSON files exist in this directory:"
	echo ""
	ls *.json
	echo ""
	echo "Please enter the filename that contains the user updates:"
	read file
	./update_user.sh $user "@$file"
	read -p "Press [Enter] to return to menu"
	manage_user_menu

}


#calls delete_user script
function delete_user() {

	clear
	echo "Enter the _id of the user to delete:"
	read uid
	./delete_user.sh $uid
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_user_menu

}


#calls create_user script
function create_user() {

	clear
	echo "The following JSON files exist in this directory:"
	echo ""	
	ls *.json
	echo ""
	echo "Enter the name of the JSON file that contains the new user:"
	read user_payload
	./create_user.sh "@$user_payload"
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_user_menu

}


#calls get_user_key_value_query script
function get_user_key_value_query() {

	clear
	echo "Default camelCase attributes include:"
	echo "-------------------------------------"
	echo "employeeNumber, fullName, stateProvince, userName, job_title, roles, accountStatus, givenName, address1, address2, familyName, department,"
	echo "passwordAttempts, manager, country, city, postalCode, _id, phoneNumber, email"
	echo ""
	echo "Enter an attribute from above or custom attribute to search against:"	
	read key
	echo ""
	echo "Enter value to search for:"
	read value
	./get_users_key_value_query.sh $key $value
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_user_menu	

}

#calls get_users script
function get_users() {

	clear
	./get_users.sh
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_user_menu

}

#calls get_user script
function get_user() {

	clear
	echo "Enter UID of user:"
	read uid
	./get_user.sh $uid
	echo ""
	read -p "Press [Enter] to return to menu"
	manage_user_menu
}

#manage_user_menu ===================================================================================================================================================================================



#initiate menu
menu



