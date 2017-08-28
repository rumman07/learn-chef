#!/bin/bash 
USERNAME=$(whoami)
echo ${USERNAME}
read -p "Please enter the name of the server: " SERVERNAME
COMMAND_RAN="knife search node ${SERVERNAME}"

logger -p local3.info -t knife_wrapper "${USERNAME} ran the command: ${COMMAND_RAN}"
cdi /etc
echo $(pwd)
knife search node $SERVERNAME



