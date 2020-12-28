#!/bin/sh

set -u

if ! type diff-pdf >/dev/null; then
  echo "diff-pdf command not found"
  exit 1
fi

cd "$(dirname "$0")"

status=0

for saty in $(ls *.saty); do
  testcase="$(basename ${saty} .saty)"
  echo -n "${testcase} ... "
  if diff-pdf ${testcase}_expected.pdf ${testcase}_actual.pdf --output-diff=${testcase}_diff.pdf 2>/dev/null; then
    echo "passed"
  else
    echo "failed"
    status=1
  fi
done

exit $status
