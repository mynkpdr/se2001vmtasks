
#!/usr/bin/awk -f
BEGIN {
	FS = ",";  # Set the field separator to a comma
       
}

NR > 1 {  # Skip the header line
	topic_group[$2]++;  # Increment the count for each topic group
}

END {
	for (group in topic_group) {
		print "Topic Group: " group", Count:", topic_group[group];
	}
}

