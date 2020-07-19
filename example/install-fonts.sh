#!/usr/bin/env bash

set -eu

fontsfile=${1:-fonts.txt}
fontsdir=.satysfi/dist/fonts

cd $(dirname $0)
mkdir -p $fontsdir
tempdir=$(mktemp -d)

cat $fontsfile | while read filename url
do
  echo $filename
  echo $url
  wget -O $tempdir/$filename $url
  unzip -o -d $tempdir $tempdir/$filename
done

echo "downloaded."

cp $tempdir/*.otf $fontsdir/

echo "done."
