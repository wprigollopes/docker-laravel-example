#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Start containers
cd ${SCRIPT_PATH}

# Guarantee if everything is stopped
./stop.sh

# Rebuild project
docker-compose --project-name=ecommerce2 -f docker-compose.yml up -d --build

./npmBuildAssets.sh
