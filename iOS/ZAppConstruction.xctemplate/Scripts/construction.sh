#!/bin/bash

set -x
set -e

# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

# construction clean
echo "======== construction clean ========"
source "$SCRIPT_HOME/construction_clean.sh"

# setup dependencies
echo "======== setup dependencies ========"
source "$SCRIPT_HOME/setup_dependencies.sh"

# setup version
echo "======== setup version ========"
source "$SCRIPT_HOME/setup_version.sh"

# archive
echo "======== archive ========"
source "$SCRIPT_HOME/construction_archive.sh"

# export
echo "======== archive ========"
source "$SCRIPT_HOME/construction_export.sh"

# upload
echo "======== upload ========"
source "$SCRIPT_HOME/upload_to_app_store.sh"