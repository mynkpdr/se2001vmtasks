# Programming Practice Assignment - Week 2 - Question 2

## Problem Statement

`encoding-key` is a file located at the path `encryption/two-level/binary/positive-offset/`.
The file encoding-key is updated often and shared between multiple users.
This file is important to you, and you are worried that the file could be deleted by mistake.
Create a file `ek` in the current working directory, such that it is always in sync with the contents of file `encoding-key` and if `encoding-key` gets deleted by any chance the content in it should be available in file `ek`.

## Instructions

Directory `encryption` is located in current working directory.
Write your code in the file `safety.sh`. It will not receive any input in arguments or from standard input.
Your code should not produce any output.

**NOTE**: The folder `encryption` will be automatically created and present before your `safety.sh` is run during evaluation.
