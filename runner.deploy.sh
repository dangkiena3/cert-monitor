#!/bin/bash

# Stop script when error
set -e;

DEPLOY_HOST=$1
DEPLOY_PORT=$2
PROJECT_LOCATION=$3
##Deploy via ssh
ssh $DEPLOY_HOST -p $DEPLOY_PORT <<EOT
    set -e;
    cd $PROJECT_LOCATION;
    echo "Get new code from git"
    git fetch;
    git reset --hard $CI_BUILD_REF;
EOT
