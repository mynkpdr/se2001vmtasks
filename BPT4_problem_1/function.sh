#!/bin/bash

file_check() {
    local filename="$1"
    local valid=true

    while IFS= read -r line || [[ -n "$line" ]]; do
        if ! [[ "$line" =~ ^[A-Za-z]+:[0-9a-fA-F]+$ ]]; then
            valid=false
            break
        fi
    done < "$filename"

    if $valid; then
        echo "$filename PASSED"
    else
        echo "$filename FAILED"
    fi
}

# Uncomment the line below to allow running the function directly from the script
# file_check "$1"

