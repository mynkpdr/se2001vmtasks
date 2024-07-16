Write a `script.sh` that reads a CSV file `student_data.csv` containing student information with columns StudentID,Name,Age,Grade. The script should check if the `StudentID` field is **numeric** for each row. Print a lists of each row with an `invalid StudentID` error messege along with the corresponding row number. Please refer to the following Sample input and output for reference. 

Note:
	- Assume that the `student_data.csv` is present in the current working directory. It is created dynamically for each test case.
	- Using `tail -n +2 student_data.csv` will allow you to access the file without the header of the file.

**Sample input**

```
StudentID,Name,Age,Grade
101,John Doe,20,A
abc123,Jane Smith,22,B
104,Mike Brown,23,C
105,,19,D
```

**Sample output**

```
Row 2: Invalid StudentID
```
