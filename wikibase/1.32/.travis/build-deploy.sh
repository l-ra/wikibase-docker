#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
docker build "$DIR/../base" -t ${DOCKER_REPO}/wikibase:1.32 -t ${DOCKER_REPO}/wikibase:1.32-base
docker build "$DIR/../bundle" -t ${DOCKER_REPO}/wikibase:1.32-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push ${DOCKER_REPO}/wikibase:1.32
    docker push ${DOCKER_REPO}/wikibase:1.32-base
    docker push ${DOCKER_REPO}/wikibase:1.32-bundle
fi
