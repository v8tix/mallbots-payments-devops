#!/usr/bin/env bash

echo "$@"

docker run \
  --cpus="${1}" \
  --memory="${2}" \
  -t \
  -d \
  --rm \
  --name "${3}" \
  --hostname "${3}" \
  -v "${4}":"${5}"/ \
  -p "${6}":"${7}" \
  "${8}" \
  "${9}" \
  "${10}"