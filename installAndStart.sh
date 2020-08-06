#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"
PROJECT_PATH="${SCRIPT_PATH}/.."
CONTAINER_WEB="ecommerce_web_1"

# Copy configurations file
if [ ! -f ${PROJECT_PATH}/.env ]; then
    cp ${PROJECT_PATH}/.env.example ${PROJECT_PATH}/.env
fi

# Allow write permissions
chmod 777 -Rf $PROJECT_PATH/storage/logs $PROJECT_PATH/storage/app $PROJECT_PATH/storage/framework
chmod 777 -Rf $PROJECT_PATH/bootstrap/cache/

# Start containers
cd ${SCRIPT_PATH}
./start.sh $1

# Take a moment
sleep 15

# Check if containers are running
if [ ! "$(docker ps | grep ${CONTAINER_WEB})" ]; then
    echo "Looks like that your ${CONTAINER_WEB} couldn't started correctly."
    exit
fi

docker exec ${CONTAINER_WEB} composer update
docker exec ${CONTAINER_WEB} composer dump-autoload
docker exec ${CONTAINER_WEB} php artisan key:generate

# If needed, uncomment
# docker exec ${CONTAINER_WEB} php artisan migrate
# docker exec ${CONTAINER_WEB} php artisan db:seed

