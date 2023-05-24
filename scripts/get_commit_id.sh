#!/usr/bin/env bash

set -euo pipefail

BRANCH_NAME=$(cat $1 | cut -d/ -f3)
cat ".git/refs/heads/$BRANCH_NAME"
