#!/bin/bash

# Define the base directory
BASE_DIR="$(pwd)/project"

# Initialize a counter for passed tests
passed_tests=0
total_tests=28

# Function to check the existence of a directory
check_directory() {
    if [ -d "$1" ]; then
        echo "Directory $1 exists."
        passed_tests=$((passed_tests + 1))
    else
        echo "Directory $1 does not exist."
        exit 1
    fi
}

# Function to check the existence of a file
check_file() {
    if [ -f "$1" ]; then
        echo "File $1 exists."
        passed_tests=$((passed_tests + 1))
    else
        echo "File $1 does not exist."
        exit 1
    fi
}

# Function to check the existence of a hard link
check_hard_link() {
    if [ -f "$1" ] && [ "$(stat -c %h "$1")" -gt 1 ]; then
        echo "Hard link $1 exists."
        passed_tests=$((passed_tests + 1))
    else
        echo "Hard link $1 does not exist."
        exit 1
    fi
}

# Function to check the existence of a soft link
check_soft_link() {
    if [ -L "$1" ]; then
        target=$(readlink "$1")
        if [ "$target" == "$2" ]; then
            echo "Soft link $1 exists and points to $2."
            passed_tests=$((passed_tests + 1))
        else
            echo "Soft link $1 points to $target instead of $2."
            exit 1
        fi
    else
        echo "Soft link $1 does not exist."
        exit 1
    fi
}

# Function to check permissions
check_permissions() {
    if [ "$(stat -c %a "$1")" == "$2" ]; then
        echo "Permissions for $1 are correctly set to $2."
        passed_tests=$((passed_tests + 1))
    else
        echo "Permissions for $1 are not set to $2."
        exit 1
    fi
}

# 1. Check Directories
check_directory "$BASE_DIR"
check_directory "$BASE_DIR/src/module1/include"
check_directory "$BASE_DIR/src/module1/lib"
check_directory "$BASE_DIR/src/module2/include"
check_directory "$BASE_DIR/src/module2/lib"
check_directory "$BASE_DIR/docs/api"
check_directory "$BASE_DIR/docs/manual"
check_directory "$BASE_DIR/bin"

# 2. Check Files
check_file "$BASE_DIR/src/module1/include/module1.h"
check_file "$BASE_DIR/src/module1/lib/module1.so"
check_file "$BASE_DIR/src/module2/include/module2.h"
check_file "$BASE_DIR/src/module2/lib/module2.so"

# 3. Check Hard Links
check_hard_link "$BASE_DIR/bin/module1_hardlink.h"
check_hard_link "$BASE_DIR/bin/module2_hardlink.so"

# 4. Check Soft Links
check_soft_link "$BASE_DIR/documentation" "$BASE_DIR/docs"
check_soft_link "$BASE_DIR/src/module2/lib/module1_symlink.so" "$BASE_DIR/src/module1/lib/module1.so"

# 5. Check Permissions
check_permissions "$BASE_DIR" "755"

# Check permissions for all directories under `project/src`
for dir in $(find "$BASE_DIR/src" -type d); do
    check_permissions "$dir" "700"
done

# Check permissions for all `.h` files
for file in $(find "$BASE_DIR/src" -type f -name "*.h"); do
    check_permissions "$file" "644"
done

# Check permissions for all `.so` files
for file in $(find "$BASE_DIR/src" -type f -name "*.so"); do
    check_permissions "$file" "755"
done

# Summary of results
echo "Passed tests: $passed_tests/$total_tests"
if [ "$passed_tests" -ne "$total_tests" ]; then
    exit 1
else
    exit 0
fi

