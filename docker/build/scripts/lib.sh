#!/usr/bin/env bash

create_build_script() {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  cd "${DIR}" || exit
  cp build_go_template ./build_go.sh
  sed -i "s/<1>/${1}/g" ./build_go.sh
  sed -i "s/<2>/${2}/g" ./build_go.sh
  sed -i "s/<3>/${3}/g" ./build_go.sh
  sed -i "s+<4>+"${4}"+g" ./build_go.sh
}
