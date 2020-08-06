#!/bin/bash

SCRIPT_PATH="$( cd "$(dirname "$0")" ; pwd -P )"

cd $SCRIPT_PATH
./nodeCmd.sh "npm install && npm run dev"
