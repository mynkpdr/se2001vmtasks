#!/bin/bash

# Check if all required arguments are provided
if [ "$#" -ne 3 ]; then
	    echo "Usage: $0 <city-name> <min|max> <average|mode>"
	        exit 1
fi

city="$1"
temperature_type="$2"
calculation_mode="$3"

# Fetch the weather data HTML
weather_html=$(curl -s http://weather.local/city/${city}.html)

# Parse and extract temperature data
temperature_data=$(echo "$weather_html" | grep -oP '<td>\d+°C \| \d+°C</td>' | sed 's/<\/\?td>//g' | tr '\n' ' ')

# Extract minimum or maximum temperature based on argument
if [ "$temperature_type" = "min" ]; then
	    temperatures=$(echo "$temperature_data" | grep -oP '\d+' | awk 'BEGIN {min=1000} {if ($1<min) min=$1} END {print min}')
    elif [ "$temperature_type" = "max" ]; then
	        temperatures=$(echo "$temperature_data" | grep -oP '\d+' | awk 'BEGIN {max=0} {if ($1>max) max=$1} END {print max}')
	else
		    echo "Invalid temperature type. Use 'min' or 'max'."
		        exit 1
fi

# Calculate average or mode based on argument
if [ "$calculation_mode" = "average" ]; then
	    sum=0
	        count=0
		    for temp in $temperatures; do
			            sum=$(echo "$sum + $temp" | bc)
				            count=$((count + 1))
					        done
						    average=$(echo "scale=10; $sum / $count" | bc)
						    average_rounded=$(printf "%.2f\n" "$average")
						    echo "$average_rounded"
						elif [ "$calculation_mode" = "mode" ]; then
							mode=$(echo "$temperatures" | sort | uniq -c | sort -n | awk '{print $2}' | head -n 1)
							        echo "$mode"
							else
								    echo "Invalid calculation mode. Use 'average' or 'mode'."
								        exit 1
fi
