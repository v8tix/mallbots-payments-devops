#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. "${DIR}/lib.sh"

CURRENT_TIME=$(date --iso-8601=seconds)
GIT_DESCRIPTION=$(git describe --always --dirty --tags --long)
BIN_NAME="payments"
BUILD_DIR=./cmd

create_build_script "${CURRENT_TIME}" "${GIT_DESCRIPTION}" "${BIN_NAME}" "${BUILD_DIR}"
