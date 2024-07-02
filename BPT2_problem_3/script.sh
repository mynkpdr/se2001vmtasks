# !/bin/bash

if grep -q "database_error" app.log; then
	    timestamp=$(date)
	        echo "$timestamp: Database error found" >> error_report.log
fi
