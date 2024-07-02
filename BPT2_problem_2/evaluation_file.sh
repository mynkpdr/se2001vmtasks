#!/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/BPT2_problem_2

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

evaluate() {
  test_case_dir=$1
  expected_output_file=$2

  # Run the setup script to prepare the environment
  source ${test_case_dir}/setup.sh

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null
  bash script.sh
  popd > /dev/null

  # Check if default_config exists and write the result to actual_output.txt
  if [[ -f ${STUDENT_WORK_DIR}/default_config ]]; then
    echo "default_config should exist" > ${STUDENT_WORK_DIR}/actual_output.txt
  else
    echo "default_config should not exist" > ${STUDENT_WORK_DIR}/actual_output.txt
  fi

  # Compare the actual output with the expected output
  if diff -u ${expected_output_file} ${STUDENT_WORK_DIR}/actual_output.txt > /dev/null; then
    echo "PASS: ${test_case_dir}"
    passed_public_testcases=$((passed_public_testcases + 1))
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    diff -u ${expected_output_file} ${STUDENT_WORK_DIR}/actual_output.txt
  fi

  # Clean up
  rm -f ${STUDENT_WORK_DIR}/default_config ${STUDENT_WORK_DIR}/actual_output.txt
}

while read -r test_case; do
  echo "-> $test_case" >&2
  [ -z "$test_case" ] && continue
  echo the directory is : $test_case
  evaluate "$test_case" "${test_case}/output.txt"
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)

echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

