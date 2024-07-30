#!/bin/bash

cat > script.sh << EOF
#!/usr/bin/bash

sed -f replace_second_occurrence.sed

EOF
chmod 755 script.sh


SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/$(basename "$(pwd)")
TEMP_DIR=~/temp_test_dir

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

setup_test_environment() {
  test_case_dir=$1
  rm -rf $TEMP_DIR
  mkdir -p $TEMP_DIR

  # Copy input and expected output files to temp directory
  cp "$test_case_dir/input.txt" "$TEMP_DIR/input.txt"
  cp "$test_case_dir/output.txt" "$TEMP_DIR/expected_output.txt"
}

evaluate() {
  test_case_dir=$1

  # Setup test environment
  setup_test_environment $test_case_dir

  # Check if expected output file exists
  if [ ! -f ${TEMP_DIR}/expected_output.txt ]; then
    echo "Expected output file not found: ${TEMP_DIR}/expected_output.txt"
    exit 1
  fi

  # Get expected output
  expected_output=$(cat ${TEMP_DIR}/expected_output.txt)

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null

  # Run the student's sed script with the input file and output file
  cat $TEMP_DIR/input.txt | sed -f $STUDENT_WORK_DIR/replace_second_occurrence.sed > $TEMP_DIR/actual_output.txt

  # Capture the actual output
  if [ -f $TEMP_DIR/actual_output.txt ]; then
    actual_output=$(cat $TEMP_DIR/actual_output.txt)
  else
    actual_output=""
  fi
  popd > /dev/null

  # Compare the actual output with the expected output using diff -w to ignore whitespace differences
  if diff -w <(echo "$actual_output") <(echo "$expected_output") > /dev/null; then
    echo "PASS: ${test_case_dir}"
    passed_public_testcases=$((passed_public_testcases + 1))
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    echo "Expected:"
    echo "$expected_output"
    echo "Actual:"
    echo "$actual_output"
    diff -w <(echo "$actual_output") <(echo "$expected_output")
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

