#!/bin/bash

set -eu

base="https://shibaruby.github.io/lgtm/lgtm/"
output="docs/index.json"

lgtms=$(ls -t docs/lgtm/)

echo -n '[' > $output

for lgtm in $lgtms; do
  echo -n '"'$base$lgtm'",' >> $output
done

sed -i '$s/.$//' $output

echo -n ']' >> $output
