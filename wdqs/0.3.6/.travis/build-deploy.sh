#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
docker build "$DIR/../" -t ${DOCKER_REPO}/wdqs:0.3.6 -t ${DOCKER_REPO}/wdqs:latest

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push ${DOCKER_REPO}/wdqs:0.3.6
fi
