#!/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/$(basename "$(pwd)")
TEMP_DIR=~/temp_test_dir

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

evaluate() {
  test_case_dir=$1

  # Get expected output
  expected_output=$(cat ${test_case_dir}/output.txt)

  # Create a temporary directory for the test case
  rm -rf $TEMP_DIR
  mkdir -p $TEMP_DIR
  cp -r $test_case_dir/* $TEMP_DIR/

  # Read input from input.txt
  input=$(cat $TEMP_DIR/input.txt)

  # Prepare the input arguments
  directory=$(echo $input | cut -d ' ' -f 1)
  arg2=$(echo $input | cut -d ' ' -f 2-)

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null
  if [[ -z "$arg2" ]]; then
    actual_output=$(bash script.sh $TEMP_DIR)
  else
    actual_output=$(bash script.sh $TEMP_DIR $arg2)
  fi
  popd > /dev/null

  # Normalize paths in the actual output
  actual_output=$(echo "$actual_output" | sed "s|$TEMP_DIR|$test_case_dir|g")

  # Compare the actual output with the expected output
  if [[ "$actual_output" == "$expected_output" ]]; then
    echo "PASS: ${test_case_dir}"
    passed_public_testcases=$((passed_public_testcases + 1))
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    echo "Expected:"
    echo "$expected_output"
    echo "Actual:"
    echo "$actual_output"
  fi

  # Clean up the temporary directory
  rm -rf $TEMP_DIR
}

while read -r test_case; do
  echo "-> $test_case" >&2
  [ -z "$test_case" ] && continue
  evaluate "$test_case"
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)

echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

