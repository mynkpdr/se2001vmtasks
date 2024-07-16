#!/bin/bash

# Prompt the user to enter a number
read number

# Initialize sum variable
sum=0

# Loop through each digit of the number
while [ $number -gt 0 ]; do
	    # Extract the last digit
	        digit=$((number % 10))
		    # Add the digit to sum
		        sum=$((sum + digit))
			    # Remove the last digit from number
			        number=$((number / 10))
			done

			# Print the sum of digits
			echo "$sum"

