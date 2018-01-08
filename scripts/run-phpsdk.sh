#!/bin/bash

set -euo pipefail

cd "$( dirname "${BASH_SOURCE[0]}" )/.."

OUTPUT_DIR=~/Repos/php/
CLIENT_DIR=hydra-php-client

rm -rf $OUTPUT_DIR/$CLIENT_DIR

# Get additional-properties using `swagger-codegen config-help -l php`
swagger-codegen generate -i ./docs/api.swagger.json -l php \
    --invoker-package Hydra\\SDK --git-repo-id $CLIENT_DIR --git-user-id ory --additional-properties "packagePath=$CLIENT_DIR,description=Client for Hydra" -o $OUTPUT_DIR

