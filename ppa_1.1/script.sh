#!/usr/bin/bash

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
xargs touch file_1.txt file_2.deb
mkdir -p level1
bash "../$(dirname "${BASH_SOURCE[0]}")/movetext.sh" &>/dev/null < /dev/null
ls -1 level1 | sort
popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf

