#!/bin/bash
# ./scripts/deploy/web.sh
# ./scripts/deploy/web.sh
set -e
IFS='|'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_HOME="${DIR}../../"

STAGE=$1
BRANCH=$STAGE
APP_ID=$(aws amplify list-apps --profile <project-name>-${STAGE}developer --query apps[0].appId)


cd $PROJECT_HOME
$DIR/common.sh
git push
sleep 5
aws amplify list-jobs --app-id $APP_ID --branch-name $BRANCH --profile <project-name>-${STAGE}developer
