#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

echo "==== check CONSTRUCTION_PROJECT_INFO_PLIST_PATH ===="
if [[ ! -f "${CONSTRUCTION_PROJECT_INFO_PLIST_PATH}" ]]; then
	echo "CONSTRUCTION_PROJECT_INFO_PLIST_PATH: ${CONSTRUCTION_PROJECT_INFO_PLIST_PATH} Not Found"
	exit 1
fi

echo "==== check PROJECT_MARKETING_VERSION_SHOULD_UPDATE ===="
if [[ ! -z "$PROJECT_MARKETING_VERSION_SHOULD_UPDATE" ]] && [[ "$PROJECT_MARKETING_VERSION_SHOULD_UPDATE" != "0" ]];then
    echo "=== Update Marketing Version ==="
    xcrun agvtool new-marketing-version $PROJECT_MARKETING_VERSION
    echo "=== Check Marketing Version ==="
    marketing_version=`xcodebuild -target ${PROJECT_TARGET_NAME} -configuration Release -showBuildSettings  | grep -i 'MARKETING_VERSION' | sed 's/[ ]*MARKETING_VERSION = //'`
    echo "=== Marketing Version Updated: ${PROJECT_MARKETING_VERSION} ? ${marketing_version} ==="
fi

echo "==== check PROJECT_VERSION_SHOULD_UPDATE ===="
if [[ ! -z "$PROJECT_VERSION_SHOULD_UPDATE" ]] && [[ "$PROJECT_VERSION_SHOULD_UPDATE" != "0" ]];then
    echo "=== Update Build Number ==="
    xcrun agvtool new-version -all $PROJECT_VERSION
    echo "=== Build Number Updated: ${PROJECT_VERSION} ==="
fi
