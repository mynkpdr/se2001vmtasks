#!/bin/bash



stdout_file=$(mktemp)

if $cmd 2> error.txt > "$stdout_file"; then
	        cat "$stdout_file"
	else
		        cat error.txt >&2
fi

rm "$stdout_file"

