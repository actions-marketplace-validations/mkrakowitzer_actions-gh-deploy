#!/bin/sh
GITHUB_URL="https://github.com"
GITHUB_API_URL="https://api.github.com"

ENVIRONMENT=$1
TASK=$2
DESCRIPTION=$3
TRANSIENT=$4

# See https://developer.github.com/v3/repos/deployments/#create-a-deployment
curl --silent --show-error --fail \
    -X POST "${GITHUB_API_URL}/repos/${GITHUB_REPOSITORY}/deployments" \
    -H "Authorization: token ${GITHUB_TOKEN}" \
    -H "Content-Type: text/json; charset=utf-8" \
    -H "Accept: application/vnd.github.ant-man-preview+json" \
    -d @- <<EOF
{
  "ref": "${GITHUB_SHA}",
  "environment": "${ENVIRONMENT}",
  "task": "${TASK}",
  "description": "${DESCRIPTION}",
  "transient_environment": ${TRANSIENT}
}
EOF
