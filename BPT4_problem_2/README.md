George is working on his father's laptop to help him categorize data present on his system. He observed that in the desktop folder there are numerous files of various types. He wants to do a preliminary analysis of what files are present and what their types are.

To help him, create a Bash script named `script.sh` that reads from a file `input.txt` (containing the output of ls -a) and uses a case statement to **determine the file type based on its extension**. 

The script should print "Image file" for .jpg, .png, .gif; "Document file" for .pdf, .docx, .txt; "Compressed file" for .zip, .tar, .gz; and "Unknown file type" for any other extensions.

Additionally, the script should count the number of each type of file and generate a small report at the end of the script execution.

**Note**

	- The file `input.txt` is provided to the script through standard input.

**Sample input**

````
example.jpg
example.png
example.gif
example.pdf
example.docx
example.txt
example.zip
example.tar
example.gz
example.xyz
example.abc
```

**Sample Output**

```
Report:
Image file: 3
Document file: 3
Compressed file: 3
Unknown file type: 2
```
