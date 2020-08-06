#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker run -v "$SCRIPT_PATH/../":/usr/src/app -w /usr/src/app node:8 sh -c "$1"
