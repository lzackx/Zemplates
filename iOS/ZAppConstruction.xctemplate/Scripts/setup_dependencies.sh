#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

echo "==== check COCOAPODS_REPOSITORIES_SHOULD_UPDATE ===="
if [ "${COCOAPODS_REPOSITORIES_SHOULD_UPDATE}" = "1" ]; then
    pod repo update
fi

echo "==== check COCOAPODS_PODFILE_SHOULD_UPDATE ===="
if [ "${COCOAPODS_PODFILE_SHOULD_UPDATE}" = "1" ]; then
    pod update
else
    pod install
fi

if [ $? -eq 0 ]
then
	echo 'pod successfully'
else
  	echo "pod failed"
  	exit 1
fi