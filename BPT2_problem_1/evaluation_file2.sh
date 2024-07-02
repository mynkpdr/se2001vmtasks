#!/bin/bash

# Function to evaluate the output
evaluate() {
  test_case_dir=$1
  expected_output_file=$2
  output_file="${test_case_dir}/output.txt"

  # Run the student's script to generate the output
  cat ${test_case_dir}/input.html | bash extract_data.sh > $output_file

  # Compare the output with the expected output
  if diff -u $expected_output_file $output_file; then
    echo "PASS: ${test_case_dir}"
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    diff -u $expected_output_file $output_file
  fi
}

# Test Case 1
echo "Running Test Case 1..."
source test_case_1/setup.sh
evaluate "test_case_1" "test_case_1/expected_output.txt"

# Test Case 2
echo "Running Test Case 2..."
source test_case_2/setup.sh
evaluate "test_case_2" "test_case_2/expected_output.txt"

# Test Case 3
echo "Running Test Case 3..."
source test_case_3/setup.sh
evaluate "test_case_3" "test_case_3/expected_output.txt"

# Test Case 4
echo "Running Test Case 4..."
source test_case_4/setup.sh
evaluate "test_case_4" "test_case_4/expected_output.txt"

