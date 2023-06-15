#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. "${DIR}/lib.sh"

CURRENT_TIME=$(date --iso-8601=seconds)
GIT_DESCRIPTION=$(git describe --always --dirty --tags --long)
BIN_NAME="<1>"
BUILD_DIR=<2>

create_build_script "${CURRENT_TIME}" "${GIT_DESCRIPTION}" "${BIN_NAME}" "${BUILD_DIR}"
