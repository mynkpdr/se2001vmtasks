#!/bin/bash

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
xargs touch
bash "../$(dirname "${BASH_SOURCE[0]}")/texts.sh" 2>&1 < /dev/null
if [[ -e "textFiles.txt" ]]; then
  cat "textFiles.txt"
else
  echo "textFiles.txt not found"
fi
echo "---"
if [[ -e "noFiles.txt" ]]; then
  cat "noFiles.txt"
else
  echo "noFiles.txt not found"
fi
popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf
