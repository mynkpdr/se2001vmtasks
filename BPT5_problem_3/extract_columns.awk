BEGIN {
	    FS = ","         # Set the field separator to comma
	        OFS = ","        # Set the output field separator to comma
		    print "Circle Name,Region Name,District,StateName,Pincode" # Print the header
	    }

NR > 1 {
	circle_name = $1
	    region_name = $2
	        district = $8
		    state_name = $9
		        pincode = $5
			gsub(/^[ \t]+|[ \t]+$/, "", circle_name)
			    gsub(/^[ \t]+|[ \t]+$/, "", region_name)
			        gsub(/^[ \t]+|[ \t]+$/, "", district)
				    gsub(/^[ \t]+|[ \t]+$/, "", state_name)
				        gsub(/^[ \t]+|[ \t]+$/, "", pincode)

					print circle_name, region_name, district, state_name, pincode
	}
