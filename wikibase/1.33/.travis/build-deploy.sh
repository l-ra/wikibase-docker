#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
docker build "$DIR/../base" -t ${DOCKER_REPO}/wikibase:1.33 -t ${DOCKER_REPO}/wikibase:1.33-base -t ${DOCKER_REPO}/wikibase:latest -t ${DOCKER_REPO}/wikibase:latest-base
docker build "$DIR/../bundle" -t ${DOCKER_REPO}/wikibase:1.33-bundle -t ${DOCKER_REPO}/wikibase:latest-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push ${DOCKER_REPO}/wikibase:1.33
    docker push ${DOCKER_REPO}/wikibase:latest
    docker push ${DOCKER_REPO}/wikibase:1.33-base
    docker push ${DOCKER_REPO}/wikibase:latest-base
    docker push ${DOCKER_REPO}/wikibase:1.33-bundle
    docker push ${DOCKER_REPO}/wikibase:latest-bundle
fi
