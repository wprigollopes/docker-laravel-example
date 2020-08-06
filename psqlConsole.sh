#!/bin/bash

# Local client
#psql -Upostgres -h127.0.0.1 ecommerce
# Docker client (check if psql is installed on container)
docker exec -it ecommerce_web_1 psql -Upostgres -h127.0.0.1 ecommerce
