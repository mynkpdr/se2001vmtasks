#!/bin/bash

if [ -z "$cmd" ]; then
	    echo "Error: cmd variable is not set."
	        exit 1
fi

man_file="man_${cmd}.txt"
err_file="man_${cmd}.err"

man $cmd > "$man_file" 2> "$err_file" || {
    help $cmd > "$man_file"
}
