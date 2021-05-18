#!/bin/bash

set -e
set -x

PATH_OF_HOME_DIRECTORY=$(cd ~;pwd)
PATH_OF_WORKING_DIRECTORY=$(cd "$(dirname "$0")";pwd)
PATH_OF_TEMPLATES_DIRECTORY="$PATH_OF_HOME_DIRECTORY/Library/Developer/Xcode/Templates/ZApp"

ln -s "$PATH_OF_WORKING_DIRECTORY/ZApp" $PATH_OF_TEMPLATES_DIRECTORY