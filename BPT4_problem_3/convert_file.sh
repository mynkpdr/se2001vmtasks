#!/bin/bash

# Parse command-line options
while getopts ":i:o:t:" opt; do
    case $opt in
	i) input_file="$OPTARG" ;;
	o) output_file="$OPTARG" ;;
	t) conversion_type="$OPTARG" ;;
	*) usage ;;
    esac
done

# Check if all required options are provided
if [ -z "$input_file" ] || [ -z "$output_file" ] || [ -z "$conversion_type" ]; then
    usage
fi

# Perform the conversion
case $conversion_type in
    csv2tsv)
	sed 's/,/\t/g' "$input_file" > "$output_file"
	;;
    tsv2csv)
	sed 's/\t/,/g' "$input_file" > "$output_file"
	;;
    *)
	echo "Invalid conversion type. Use either csv2tsv or tsv2csv."
	exit 1
	;;
esac

echo "Conversion completed successfully."
