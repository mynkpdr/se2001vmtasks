#!/bin/bash

# Initialize counters
image_count=0
document_count=0
compressed_count=0
unknown_count=0

# Function to determine file type based on extension
determine_file_type() {
    local file="$1"
    case "${file,,}" in
        *.jpg|*.png|*.gif)
            image_count=$((image_count + 1))
            ;;
        *.pdf|*.docx|*.txt)
            document_count=$((document_count + 1))
            ;;
        *.zip|*.tar|*.gz)
            compressed_count=$((compressed_count + 1))
            ;;
        *)
            unknown_count=$((unknown_count + 1))
            ;;
    esac
}

# Check if input.txt exists and is readable
if [[ ! -f "input.txt" ]]; then
    echo "Error: input.txt not found."
    exit 1
fi

# Read input.txt and process each file
while IFS= read -r file; do
    file=$(echo "$file" | xargs)  # Remove any leading/trailing whitespace
    determine_file_type "$file"
done < "input.txt"

# Generate report
echo "Report:"
echo "Image file: $image_count"
echo "Document file: $document_count"
echo "Compressed file: $compressed_count"
echo "Unknown file type: $unknown_count"

