#!/bin/sh
set -e
set +x
set -o pipefail
if [ "${DEBUG}" == "true" ]; then
    set -x
fi

ROLENAME='shinto-deployment'
USERNAME='shinto-deployment'
DEFAULT_REGION='us-east-1'
DEFAULT_ANSWER='n'
TRUST_POLICY=$(echo '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Principal":{"Service":"codebuild.amazonaws.com"},"Action":"sts:AssumeRole"}]}')
EXECUTION_POLICY=$(echo '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":"eks:DescribeCluster","Resource":"*"}]}')

while getopts ":p:" arg; do
    case $arg in
        p) PROFILE=$OPTARG;;
    esac
done
read -e -p  "TARGET_REGION: [$DEFAULT_REGION] " TARGET_REGION
TARGET_REGION="${TARGET_REGION:-$DEFAULT_REGION}"
read -e -p  "TARGET_CLUSTERNAME: " TARGET_CLUSTERNAME

if [ ! -z "${TARGET_REGION:-}" ] && [ ! -z "${TARGET_CLUSTERNAME:-}" ]; then
    read -e -p  "Create cluster [y/N]: " ANSWER
    ANSWER="${ANSWER:-$DEFAULT_ANSWER}"

    if [ -z "${PROFILE:-}" ]; then
        ROLE_ARN=$(aws iam create-role --role-name ${ROLENAME} --assume-role-policy-document "${TRUST_POLICY}" | jq -r ".Role.Arn" )
        aws iam put-role-policy --role-name ${ROLENAME} --policy-name deployment --policy-document "${EXECUTION_POLICY}"
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            eksctl create cluster --name ${TARGET_CLUSTERNAME} --region ${TARGET_REGION} --fargate
        fi
        eksctl create iamidentitymapping --cluster ${TARGET_CLUSTERNAME} --region=${TARGET_REGION} \
            --group "system:masters" --arn ${ROLE_ARN} --username ${USERNAME} --no-duplicate-arns
    else
        echo "PROFILE: ${PROFILE}"
        ROLE_ARN=$(aws iam create-role --role-name ${ROLENAME} --assume-role-policy-document "${TRUST_POLICY}" --profile ${PROFILE} | jq -r ".Role.Arn" )
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            eksctl create cluster --name ${TARGET_CLUSTERNAME} --region ${TARGET_REGION} --fargate --profile ${PROFILE}
        fi
        eksctl create iamidentitymapping --cluster ${TARGET_CLUSTERNAME} --region=${TARGET_REGION} \
            --group "system:masters" --arn ${ROLE_ARN} --username ${USERNAME} --no-duplicate-arns --profile ${PROFILE}
    fi
else
    echo "Missing required agruments..."
fi
