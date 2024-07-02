#!/bin/bash

if [ "$#" -ne 3 ]; then
	    echo "Usage: $0 <city-name> <min|max> <mode|average>"
	        exit 1
fi

CITY_NAME=$1
TEMP_TYPE=$2
STAT_TYPE=$3

# Define the URL
URL="http://weather.local/city/${CITY_NAME}.html"

# Fetch the HTML content
HTML_CONTENT=$(curl -s "$URL")

# Extract temperatures
if [ "$TEMP_TYPE" == "min" ]; then
	    TEMPS=$(echo "$HTML_CONTENT" | grep -oP '\d{2}°C \| \d{2}°C' | sed 's/°C \| \d{2}°C//' | sed 's/°C//' | awk '{print $1}')
    elif [ "$TEMP_TYPE" == "max" ]; then
	        TEMPS=$(echo "$HTML_CONTENT" | grep -oP '\d{2}°C \| \d{2}°C' | sed 's/\d{2}°C \| //' | sed 's/°C//' | awk '{print $2}')
	else
		    echo "Invalid temperature type: $TEMP_TYPE"
		        exit 1
fi

# Calculate average
if [ "$STAT_TYPE" == "average" ]; then
	    AVERAGE=$(echo "$TEMPS" | awk '{ sum += $1; count += 1 } END { if (count > 0) print sum/count; else print 0; }')
	        RESULT=$(printf "%.2f" "$AVERAGE")
fi

# Calculate mode
if [ "$STAT_TYPE" == "mode" ]; then
	    MODE=$(echo "$TEMPS" | sort | uniq -c | sort -nr | awk 'NR==1 {print $2}')
	        RESULT=$(printf "%.2f" "$MODE")
fi

# Print the result
echo $RESULT

