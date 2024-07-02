Create a script `script.sh` which checks for "database_error" string in `app.log` and if found, adds a timestamped entry to `error_report.log`. 

**Hint**

- To add the time stamp you need to call `date` command.
-  Assume that the file is present in current working directory

**Sample input (from app.log)**

```bash
2024-06-27 12:00:00 INFO Application started
2024-06-27 12:01:00 ERROR Failed to connect to database
2024-06-27 12:02:00 ERROR database_error detected in module X
2024-06-27 12:03:00 INFO Processing request
2024-06-27 12:04:00 ERROR database_error: connection lost

```
**Sample output**

```bash
Fri Jun 28 12:00:00 UTC 2024: Database error found
```
