#!/usr/bin/env bash

echo "$@"
payments -d="${1}" -f="${2}"

