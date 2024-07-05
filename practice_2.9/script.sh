#!/bin/bash

filename=$(basename "$file")
filename_without_extension="${filename%.*}"
echo "$filename_without_extension"

