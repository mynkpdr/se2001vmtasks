#!/bin/bash

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
read month
month=$month bash "../$(dirname "${BASH_SOURCE[0]}")/calendar.sh" 2>&1 </dev/null
if [[ ! -e "$month".txt ]]; then
  echo "Error: $month.txt not found"
else
  echo "---$month.txt---"
  cat "$month".txt
fi
if [[ ! -e error.txt ]]; then
  echo "Error: error.txt not found"
else
  echo "---error.txt---"
  if [[ $(wc -c < "$month.txt") -ne 0 && $(wc -c < error.txt ) -eq 0 ]] || grep -qFw "$month" error.txt; then
    echo "error.txt is correct"
  else
    echo "error.txt is not correct"
  fi
fi

popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf
