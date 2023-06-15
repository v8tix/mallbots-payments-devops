#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. "${DIR}/../configuration/const.sh"

docker build --no-cache -t "${IMAGE_TAG}" .
