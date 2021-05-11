#!/bin/bash


# setup environments
if [ -z "$ENVIRONMENT_VARIABLES_INITIALIZED" ]; then
    SCRIPT_HOME=$(cd "$(dirname "$0")";pwd)
    echo "======== setup environments ========"
    source "$SCRIPT_HOME/setup_environments.sh"
fi

export_timestamp_start=`date +%s`
# xcodebuild -exportArchive -archivePath <xcarchive_path> -exportPath <export_ipa_path> -exportOptionsPlist <exportOptionsPlist_path>
# <xcarchive_path>： archive path
# <export_ipa_path>： product path
# <exportOptionsPlist_path>：path of ExportOptions.plist
xcodebuild -exportArchive -archivePath ${CONSTRUCTION_ARCHIVE_PATH} -exportPath ${PRODUCT_HOME} -exportOptionsPlist ${CONSTRUCTION_EXPORT_OPTIONS_PLIST_PATH}
export_timestamp_end=`date +%s`
echo `export duration: $[ export_timestamp_end - export_timestamp_start ]s`

echo "~~~~~~~~~~~~~~~~检查是否成功导出  ipa~~~~~~~~~~~~~~~~~~~"
IPAPATH=${IPAPATH}/${PROJECT_NAME}.ipa
if [ -f "$IPAPATH" ]
then
    echo "导出ipa成功......"
else
    echo "导出ipa失败......"
# 结束时间
exit 1
fi