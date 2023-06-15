create_dockerfile() {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  cd "${DIR}" || exit
  cp Dockerfile_template ./Dockerfile
  sed -i "s/<1>/${1}/g" ./Dockerfile
  sed -i "s+<2>+"${2}"+g" ./Dockerfile
  sed -i "s/<3>/${3}/g" ./Dockerfile
}

create_const() {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  cd "${DIR}" || exit
  cp const_template ./const.sh
  sed -i "s/<1>/${1}/g" ./const.sh
}

create_gen_build_script() {
  DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
  cd "${DIR}" || exit
  cp gen_build_go_script_template.sh ./gen_build_go_script.sh
  sed -i "s/<1>/${1}/g" ./gen_build_go_script.sh
  sed -i "s+<2>+"${2}"+g" ./gen_build_go_script.sh
}
