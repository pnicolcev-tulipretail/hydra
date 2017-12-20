#!/bin/bash

set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

OUTPUT_DIR=~/Repos/php/
CLIENT_DIR=hydra-php-client

##
# Process:
#
# Brew install swagger-codegen or
# curl -O scripts/swagger-codegen-cli-2.2.3.jar http://central.maven.org/maven2/io/swagger/swagger-codegen-cli/2.2.3/swagger-codegen-cli-2.2.3.jar
#
# scripts/run-genswag.sh
#
rm -rf $OUTPUT_DIR/$CLIENT_DIR

# Get additional-properties using `swagger-codegen config-help -l php`
swagger-codegen generate -i ./docs/api.swagger.json -l php \
    --invoker-package Hydra\\SDK --git-repo-id $CLIENT_DIR --git-user-id tulip --additional-properties "packagePath=$CLIENT_DIR,description=Client for Hydra" -o $OUTPUT_DIR

