#!/bin/sh
DIR=$(dirname $0)
if [ -f ${DIR}/set-env ]; then 
  . ${DIR}/set-env
fi

docker-compose -d 