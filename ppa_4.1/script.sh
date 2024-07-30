#!/bin/bash

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
while read directory perm; do
  [[ "$directory" == "" ]] && break
  mkdir $directory
  chmod $perm $directory
done
bash "../$(dirname "${BASH_SOURCE[0]}")/dirs.sh" 2>&1 < /dev/null

popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf
