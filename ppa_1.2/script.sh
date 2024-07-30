#!/bin/bash

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
echo "some text" > abc.txt
xargs touch
mkdir -p level1
bash "../$(dirname "${BASH_SOURCE[0]}")/filetypes.sh" 2>&1 < /dev/null
popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf
