#!/bin/bash

set -eu

lgtms=$(ls -t docs/lgtm/)

cat <<HTML > docs/index.html
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
  cat <<HTML >> docs/index.html
    <li><a href="./lgtm/$lgtm">lgtm/$lgtm</a></li>
HTML
done

cat <<HTML >> docs/index.html
  </ul>
</body>
</html>
HTML
