#!/bin/sh
set -e
set +x
set -o pipefail
if [ "${DEBUG}" == "true" ]; then
    set -x
fi

declare -a LIST=("cdk-java" "cdk-python" "cdk-typescript" "jib-gradle" "jib-maven" "python-pip" "python-poetry" "springboot-gradle" "springboot-kotlin" "springboot-maven")

DEFAULT_DIR=$(PWD)/..
DEFAULT_SLEEPTIME=15
DEFAULT_PROFILE='shinto-manager'
read -e -p  "AWS PROFILE: [$DEFAULT_PROFILE] " PROFILE
PROFILE="${PROFILE:-$DEFAULT_PROFILE}"
read -e -p  "PARENT DIRECTORY:  [$DEFAULT_DIR] " PARENT_DIR
PARENT_DIR="${PARENT_DIR:-$DEFAULT_DIR}"
read -e -p  "SLEEP TIME BETWEEN SAMPLES: [$DEFAULT_SLEEPTIME] " SLEEPTIME
SLEEPTIME="${SLEEPTIME:-$DEFAULT_SLEEPTIME}"

for INDEX in "${LIST[@]}"; do
    echo "unregistering ${INDEX} sample....."
    shinto-manager unregister $PARENT_DIR/$INDEX/.shinto/props.json --profile $PROFILE
    echo "pausing between unregistering...${SLEEPTIME} seconds"
    sleep ${SLEEPTIME}
done