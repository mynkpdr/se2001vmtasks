#!/bin/bash
tail -n +2 student_data.csv | while IFS=, read -r StudentID Name Age Grade; do
  # Increment the row counter
    ((row_number++))

      # Check if StudentID is numeric
        if ! [[ "$StudentID" =~ ^[0-9]+$ ]]; then
		    echo "Row $row_number: Invalid StudentID"
		      fi
	      done
