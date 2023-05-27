#!/bin/sh
set -e
set +x
set -o pipefail
if [ "${DEBUG}" == "true" ]; then
    set -x
fi

COGNITO_USERNAME='admin'
DEFAULT_PASSWORD='Password01!'
DEFAULT_CLIENT_ID='59ntjm9mb0j6keujpvd5slflgc'

read -e -p  "Enter admin password: [$DEFAULT_PASSWORD] " COGNITO_PASSWORD
COGNITO_PASSWORD="${COGNITO_PASSWORD:-$DEFAULT_PASSWORD}"
read -e -p  "Enter cognito client id: [$DEFAULT_CLIENT_ID] " COGNITO_CLIENT_ID
COGNITO_CLIENT_ID="${COGNITO_CLIENT_ID:-$DEFAULT_CLIENT_ID}"

SHINTO_TOKEN=$(aws cognito-idp initiate-auth  \
                --client-id ${COGNITO_CLIENT_ID} \
                --auth-flow USER_PASSWORD_AUTH \
                --query "AuthenticationResult.IdToken" \
                --output text \
                --auth-parameters USERNAME=${COGNITO_USERNAME},PASSWORD=${COGNITO_PASSWORD})

echo "SHINTO_TOKEN=${SHINTO_TOKEN}"