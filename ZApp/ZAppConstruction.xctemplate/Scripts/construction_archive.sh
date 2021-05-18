#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

echo "======== archive ========"
archive_timestamp_start=`date +%s`
# xcodebuild archive -workspace <workspace_path> -scheme <app_scheme> -archivePath <xcarchive_path>
# <xcarchive_path>： 导出achive文件路径
xcodebuild archive -workspace ${CONSTRUCTION_WORKSPACE_PATH} -scheme ${PROJECT_TARGET_NAME} -archivePath ${CONSTRUCTION_ARCHIVE_PATH} -configuration ${CLEAN_CONFIGURATION}
archive_timestamp_end=`date +%s`
echo `======== archive duration: $[ archive_timestamp_end - archive_timestamp_start ]s ========`

echo "======== check archive result ========"
 # xcarchive 实际是一个文件夹不是一个文件,使用 -d 判断
if [ -d "$CONSTRUCTION_ARCHIVE_PATH" ]
then
       echo "======== successfully ========"
else
       echo "======== failed ========"
exit 1
fi