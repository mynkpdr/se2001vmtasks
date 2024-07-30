#!/usr/bin/bash
sed -E '
# Match lines starting with a hexadecimal code followed by a space
/^([0-9a-fA-F]+) / {
    # Replace the second occurrence of 'error' with 'issue' in a case-insensitive manner
    s/((\b[eE][rR][rR][oO][rR]\b.*?){1})\b[eE][rR][rR][oO][rR]\b/\1issue/I
}
' inputfile

