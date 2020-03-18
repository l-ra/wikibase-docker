#!/usr/bin/env bash
#Oneline for full directory name see: https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e
<<<<<<< HEAD
docker build "$DIR/../base" -t ${DOCKER_REPO}/wikibase:1.33 -t ${DOCKER_REPO}/wikibase:1.33-base -t ${DOCKER_REPO}/wikibase:latest -t ${DOCKER_REPO}/wikibase:latest-base
docker build "$DIR/../bundle" -t ${DOCKER_REPO}/wikibase:1.33-bundle -t ${DOCKER_REPO}/wikibase:latest-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push ${DOCKER_REPO}/wikibase:1.33
    docker push ${DOCKER_REPO}/wikibase:latest
    docker push ${DOCKER_REPO}/wikibase:1.33-base
    docker push ${DOCKER_REPO}/wikibase:latest-base
    docker push ${DOCKER_REPO}/wikibase:1.33-bundle
    docker push ${DOCKER_REPO}/wikibase:latest-bundle
=======
docker build "$DIR/../base" -t wikibase/wikibase:1.33 -t wikibase/wikibase:1.33-base -t wikibase/wikibase:legacy -t wikibase/wikibase:legacy-base
docker build "$DIR/../bundle" -t wikibase/wikibase:1.33-bundle -t wikibase/wikibase:legacy-bundle

if [ "$SHOULD_DOCKER_PUSH" = true ]; then
    docker push wikibase/wikibase:1.33
    docker push wikibase/wikibase:legacy
    docker push wikibase/wikibase:1.33-base
    docker push wikibase/wikibase:legacy-base
    docker push wikibase/wikibase:1.33-bundle
    docker push wikibase/wikibase:legacy-bundle
>>>>>>> 644495b12565717641d342b452cc79a1eaef08ad
fi
