#!/bin/bash

set -eu

output="tmp/build/index.html"

lgtms=$(ls -t docs/lgtm/)

mkdir -p tmp/build

cat <<HTML > $output
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Ruby's LGTM List</title>
</head>
<body>
  <ul>
HTML

for lgtm in $lgtms; do
  cat <<HTML >> $output
    <li><a href="./lgtm/$lgtm">lgtm/$lgtm</a></li>
HTML
done

cat <<HTML >> $output
  </ul>
</body>
</html>
HTML
