#!/bin/sh

set -eu -o pipefail

if ! type satysfi >/dev/null; then
  echo "satysfi command not found"
  exit 1
fi

cd "$(dirname "$0")"

for saty in $(ls *.saty); do
  testcase=$(basename ${saty} .saty)
  satysfi ${saty} -o ${testcase}_actual.pdf
done
