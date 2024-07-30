Anju is tasked with ensuring that each file she sends to the analyst team is correctly formatted and requires no further data cleaning from her part. The problem is that she receives these files in hundreds. She wants to automate the task.

Help her by constructing a function that she can use to check these files. Write a script named `function.sh` that contains a function called `file_check` which takes a file name as an argument and tests if the file has two fields separated by a colon (":"). The first column should have alphabets while the second column should have a hexadecimal code. If the file is correctly formatted, print the file name followed by PASSED; otherwise, print the file name followed by FAILED.

**Example Command**

```
file_check example.txt
```

Example example.txt
```
Name1:1a2b3c
Name2:4d5e6f
InvalidLine
Name3:7g8h9i
Name4:abc123
```
Example Output

For the above example.txt, the command bash function.sh example.txt should produce:

```
example.txt FAILED
```

**Note**

	- Use regex patterns to validate each line.
	- Handle both valid and invalid content cases.
