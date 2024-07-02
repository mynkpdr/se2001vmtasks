#!/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/BPT2_problem_3

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

generate_expected_output() {
  case_name=$1
  current_date=$(date)

  if [ "$case_name" == "test_case_2" ] || [ "$case_name" == "test_case_4" ]; then
    echo "" > ${STUDENT_WORK_DIR}/expected_output.txt
  else
    echo "$current_date: Database error found" > ${STUDENT_WORK_DIR}/expected_output.txt
  fi
}

evaluate() {
  test_case_dir=$1
  case_name=$(basename "$test_case_dir")

  # Run the setup script to prepare the environment
  source ${test_case_dir}/setup.sh

  # Remove any existing error_report.log to start fresh
  rm -f ${STUDENT_WORK_DIR}/error_report.log

  # Generate the expected output based on the current date
  generate_expected_output "$case_name"

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null
  bash script.sh
  popd > /dev/null

  # Check if error_report.log should not be created and verify
  if [[ ! -s ${STUDENT_WORK_DIR}/expected_output.txt && ! -f ${STUDENT_WORK_DIR}/error_report.log ]]; then
    echo "PASS: ${test_case_dir}"
    passed_public_testcases=$((passed_public_testcases + 1))
    return
  fi

  # Compare the actual output with the expected output
  if [ -f ${STUDENT_WORK_DIR}/error_report.log ]; then
    if diff -u ${STUDENT_WORK_DIR}/expected_output.txt ${STUDENT_WORK_DIR}/error_report.log > /dev/null; then
      echo "PASS: ${test_case_dir}"
      passed_public_testcases=$((passed_public_testcases + 1))
    else
      echo "FAIL: ${test_case_dir}"
      echo "Differences:"
      diff -u ${STUDENT_WORK_DIR}/expected_output.txt ${STUDENT_WORK_DIR}/error_report.log
    fi
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    echo "Expected output:"
    cat ${STUDENT_WORK_DIR}/expected_output.txt
    echo "Actual output: (file not created)"
  fi

  # Clean up
  rm -f ${STUDENT_WORK_DIR}/error_report.log ${STUDENT_WORK_DIR}/expected_output.txt
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

