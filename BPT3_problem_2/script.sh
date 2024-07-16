#!/bin/bash

# Read from stdin (assuming people.csv is given as standard input)
while IFS=',' read -r Name Age; do
	    # Skip the header line
	        if [[ "$Name" == "Name" && "$Age" == "Age" ]]; then
			        continue
				    fi
				        
				        # Check if Age is a multiple of 5
					    if [ $((Age % 5)) -eq 0 ]; then
						            echo "$Name"
							        fi
							done < people.csv

