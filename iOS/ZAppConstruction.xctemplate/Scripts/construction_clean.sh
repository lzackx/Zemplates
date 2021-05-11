#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

#xcodebuild clean -workspace <workspace_path>  -scheme <app_scheme> -configuration <Debug Or Release>
#<workspace_path>：project.xcworkspace absolute path
#<app_scheme>: App scheme (not Extension App)
#<Debug Or Release>： Debug Or Release
if [ "$CONSTRUCTION_CLEAN_PRODUCT_BEFORE_COMPILE" = "1" ]; then
    if [ -d "$CONSTRUCTION_WORKSPACE_PATH" ]; then
        echo "clean prouct before compile"
        xcodebuild clean -workspace ${CONSTRUCTION_WORKSPACE_PATH} -scheme ${PROJECT_TARGET_NAME} -configuration ${CLEAN_CONFIGURATION}
    fi
fi

if [ "$CONSTRUCTION_CLEAN_DEPENDENCIES_BEFORE_COMPILE" = "1" ]; then
    rm -rf "$PROJECT_HOME/Pods"
    rm "$PROJECT_HOME/Podfile.lock"
fi