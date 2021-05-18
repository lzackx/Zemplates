#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

if [ "${CONSTRUCTION_MODE}" = "0" ]; then
    echo "... development upload script ..."
elif [ "${CONSTRUCTION_MODE}" = "1" ]; then
    if [ -z "${UPLOAD_APPLE_API_KEY}" ]; then
        echo "UPLOAD_APPLE_API_KEY: $UPLOAD_APPLE_API_KEY not found"
        exit 1
    fi
    if [ -z "${UPLOAD_APPLE_API_ISSUER}" ]; then
        echo "UPLOAD_APPLE_API_ISSUER: $UPLOAD_APPLE_API_ISSUER not found"
        exit 1
    fi
    xcrun altool --upload-app -f ${EXPORT_PRODUCT_PATH} -t ios --apiKey ${API_KEY} --apiIssuer ${API_ISSUER} --verbose
    if [ $? -eq 0 ];then
        echo '======== upload successfully ========'
        exit 0
    else
        echo '======== upload failed ========'
        exit 1
    fi
fi

