A CSV file `people.csv` that contains rows with names and ages. Write a `grep` command to a file `script.sh` to remove all rows where the age is not a numeric value assuming the input in coming from standard input.

**Sample Input**
```bash
Name,Age
John Doe,30
Jane Smith,twenty-five
Alice Johnson,25
Bob Brown,45
```
**Sample Output**

```bash
John Doe,30
Alice Johnson,25
Bob Brown,45
```

