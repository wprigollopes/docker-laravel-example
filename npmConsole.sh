#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

docker run -itv "$SCRIPT_PATH/../":/usr/src/app -w /usr/src/app node:8 sh -c 'bash'

# Useful to run:
#
# npm update
# npm install <package>
# npm watch
# npm run
