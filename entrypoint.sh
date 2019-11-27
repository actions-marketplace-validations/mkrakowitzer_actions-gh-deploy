#!/bin/sh
GITHUB_URL="https://github.com"
GITHUB_API_URL="https://api.github.com"

# See https://developer.github.com/v3/repos/deployments/#create-a-deployment
curl --silent --show-error --fail \
    -X POST "${GITHUB_API_URL}/repos/${GITHUB_REPOSITORY}/deployments" \
    -H "Authorization: token ${INPUT_TOKEN}" \
    -H "Content-Type: text/json; charset=utf-8" \
    -H "Accept: application/vnd.github.ant-man-preview+json" \
    -d @- <<EOF
{
  "ref": "${GITHUB_SHA}",
  "auto_merge": false,
  "environment": "${INPUT_ENVIRONMENT}",
  "task": "${INPUT_TASK}",
  "description": "${INPUT_DESCRIPTION}",
  "required_contexts": []
}
EOF
