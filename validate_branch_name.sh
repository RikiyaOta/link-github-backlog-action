#!/bin/bash

BRANCH_NAME="$1"
BACKLOG_PROJECT_KEY="$2"

if [[ "$BRANCH_NAME" =~ "$BACKLOG_PROJECT_KEY"-[0-9]+ ]]; then
    echo 0
else
    echo 1
fi