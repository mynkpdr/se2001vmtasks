You have stored logs in a txt file where each line starts with a hexadecimal code followed by a log message. Your task is to write a sed script named `replace_second_occurrence.sed` that **replaces the second occurrence of the word "error" with the word "issue" in each line, but only if the line starts with a hexadecimal code.**

**Note**

	- Assume that the file is given as standard input to your script.
	- make sure that your sed expression is case insensitve.

**Example Command:**
```
cat input.txt | bash replace_second_occurrence.sh > output.txt
```

**Sample input.log:**

```
1a2b3c4d This is an error message with an issue that needs fixing.
5f6e7d8c No errors here, just a warning.
abcd1234 Another error followed by issue.
1234abcd error issue error error
nohexcode error should not be replaced here. or it will be an error.
```


**Sample output.txt:**

```
1a2b3c4d This is an error message with an issue that needs fixing.
5f6e7d8c No errors here, just a warning.
abcd1234 Another error followed by issue.
1234abcd error issue error error
nohexcode error should not be replaced here. or it will be an error.
```
