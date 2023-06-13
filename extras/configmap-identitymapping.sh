#!/bin/sh
set -e
set +x
set -o pipefail
if [ "${DEBUG}" == "true" ]; then
    set -x
fi

DEFAULT_ANSWER='n'
DEFAULT_REGION='us-east-1'
ROLENAME='shinto-deploy'
USERNAME='shinto-deploy'
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
        read -e -p  "Create role [y/N]: " ANSWER
        ANSWER="${ANSWER:-$DEFAULT_ANSWER}"
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            ROLE_ARN=$(aws iam create-role --role-name ${ROLENAME} --assume-role-policy-document "${TRUST_POLICY}" | jq -r ".Role.Arn" )
        else
            ROLE_ARN=$(aws iam get-role --role-name ${ROLENAME} | jq -r ".Role.Arn" ) 
        fi
        aws iam put-role-policy --role-name ${ROLENAME} --policy-name deploy --policy-document "${EXECUTION_POLICY}"
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            eksctl create cluster --name ${TARGET_CLUSTERNAME} --region ${TARGET_REGION} --fargate
        fi
        eksctl create iamidentitymapping --cluster ${TARGET_CLUSTERNAME} --region=${TARGET_REGION} \
            --group "system:masters" --arn ${ROLE_ARN} --username ${USERNAME} --no-duplicate-arns
    else
        echo "PROFILE: ${PROFILE}"
        read -e -p  "Create role [y/N]: " ANSWER
        ANSWER="${ANSWER:-$DEFAULT_ANSWER}"
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            ROLE_ARN=$(aws iam create-role --role-name ${ROLENAME} --assume-role-policy-document "${TRUST_POLICY}" --profile ${PROFILE} | jq -r ".Role.Arn" )
        else
            ROLE_ARN=$(aws iam get-role --role-name ${ROLENAME} --profile ${PROFILE} | jq -r ".Role.Arn" ) 
        fi
        aws iam put-role-policy --role-name ${ROLENAME} --policy-name deploy --policy-document "${EXECUTION_POLICY}" --profile ${PROFILE}
        if [ "${ANSWER}" == "y" ] || [ "${ANSWER}" == "Y" ]; then
            eksctl create cluster --name ${TARGET_CLUSTERNAME} --region ${TARGET_REGION} --fargate --profile ${PROFILE}
        fi
        eksctl create iamidentitymapping --cluster ${TARGET_CLUSTERNAME} --region=${TARGET_REGION} \
            --group "system:masters" --arn ${ROLE_ARN} --username ${USERNAME} --no-duplicate-arns --profile ${PROFILE}
    fi
else
    echo "Missing required agruments..."
fi
