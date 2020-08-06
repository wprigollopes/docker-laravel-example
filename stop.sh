#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd ${SCRIPT_PATH}
docker-compose --project-name=ecommerce2 -f docker-compose.yml stop
