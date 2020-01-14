#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
docker build "$DIR/../base" -t ${DOCKER_REPO}/wikibase:1.31 -t ${DOCKER_REPO}/wikibase:1.31-base -t ${DOCKER_REPO}/wikibase:lts -t ${DOCKER_REPO}/wikibase:lts-base
docker build "$DIR/../bundle" -t ${DOCKER_REPO}/wikibase:1.31-bundle -t ${DOCKER_REPO}/wikibase:lts-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push ${DOCKER_REPO}/wikibase:1.31
    docker push ${DOCKER_REPO}/wikibase:lts
    docker push ${DOCKER_REPO}/wikibase:1.31-base
    docker push ${DOCKER_REPO}/wikibase:lts-base
    docker push ${DOCKER_REPO}/wikibase:1.31-bundle
    docker push ${DOCKER_REPO}/wikibase:lts-bundle
fi
