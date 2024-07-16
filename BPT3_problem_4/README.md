Write a `script.sh` that takes one argument: a directory path. The script should use the find command to search for all empty files in the specified directory and its subdirectories, and then delete these files. The script should print the names of the deleted files.

**Sample Input Directory Structure**

```
/path/to/directory
|-- file1.txt (empty)
|-- file2.txt (non-empty)
|-- subdir
    |-- file3.txt (empty)
    |-- file4.txt (non-empty)
```

**Sample Output**

```
/path/to/directory/file1.txt
/path/to/directory/subdir/file3.txt
```
