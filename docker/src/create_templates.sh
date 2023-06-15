#!/usr/bin/env bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
. "${DIR}/lib.sh"

create_gen_build_script "${1}" "${2}"
create_dockerfile "${3}" "${4}" "${1}"
create_const "${3}"
