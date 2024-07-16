#!/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/$(basename "$(pwd)")

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

evaluate() {
  test_case_dir=$1

  # Get expected output
  expected_output=$(cat ${test_case_dir}/output.txt)

  # Prepare the people.csv file
  cp ${test_case_dir}/input.txt $STUDENT_WORK_DIR/people.csv

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null
  actual_output=$(cat people.csv|bash script.sh)
  popd > /dev/null

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

