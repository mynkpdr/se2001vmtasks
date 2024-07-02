#!/bin/bash
# Setup for Test Case 1: database_error present in app.log
cat <<EOT > ~/se2001/BPT2_problem_3/app.log
2024-06-27 12:00:00 INFO Application started
2024-06-27 12:01:00 ERROR Failed to connect to database
2024-06-27 12:02:00 ERROR database_error detected in module X
2024-06-27 12:03:00 INFO Processing request
2024-06-27 12:04:00 ERROR database_error: connection lost
EOT

