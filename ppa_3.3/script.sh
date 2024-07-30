#!/bin/bash
test() {
  echo test $1 execution started
  if [[ $1 != "" ]]; then
    case $1 in
    "-e")
      undeclaredfunction
      echo test $1 execution have some error
      ;;
    "-n")
      echo test $1 executed successfully
      ;;
    *)
      echo Invalid option $1
      ;;
    esac
  else
    echo test executed successfully
  fi
}

rand_dir=$(mktemp -d XXXXXX)
pushd "$rand_dir" > /dev/null || exit 1
source "../$(dirname "${BASH_SOURCE[0]}")/errorlog.sh" 2>&1 < /dev/null

grep "undeclaredfunction: command not found" errorlog -c
cat
popd > /dev/null || exit 1
[[ -d "$rand_dir" ]] && rm "${rand_dir?}" -rf
