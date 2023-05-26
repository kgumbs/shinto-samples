#!/bin/sh
set -e
set +x
set -o pipefail
if [ "${DEBUG}" == "true" ]; then
    set -x
fi

declare -a LIST=("jib-gradle" "jib-maven" "python-pip" "python-poetry" "springboot-gradle" "springboot-kotlin" "springboot-maven")

DEFAULT_DIR=$(PWD)/..
read -e -p  "Parent directory: [$DEFAULT_DIR] " PARENT_DIR
PARENT_DIR="${PARENT_DIR:-$DEFAULT_DIR}"
for INDEX in "${LIST[@]}"; do
    shinto-manager register $PARENT_DIR/$INDEX/.shinto/props.json
done