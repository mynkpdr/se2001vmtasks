#!/bin/bash
extension=$(echo "$filename" | cut -d. -f2)
echo "$extension"
