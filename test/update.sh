#!/bin/sh

set -e -o pipefail

if ! type satysfi >/dev/null; then
  echo "satysfi command not found"
  exit 1
fi

cd "$(dirname "$0")"

function update() {
  testcase=$1
  satysfi ${testcase}.saty -o ${testcase}_expected.pdf
}

case "$1" in
  "all" )
    for saty in $(ls *.saty); do
      testcase=$(basename ${saty} .saty)
      update $testcase
    done
    ;;
  "" )
    echo "Usage: update.sh {all|TESTCASE}"
    ;;
  * )
    update "$1"
    ;;
esac
