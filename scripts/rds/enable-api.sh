#!/bin/bash
# ./scripts/rds/enable-api.sh <stage>
set -e
IFS='|'

STAGE=$1

aws rds modify-db-cluster --db-cluster-identifier <project-name>-$STAGE-cluster --apply-immediately --enable-http-endpoint --profile <project-name>-${STAGE}developer