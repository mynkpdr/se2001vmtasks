#!/bin/bash

cat > script.sh << EOF
#!/usr/bin/bash

awk -f count_tickets.awk

EOF
chmod 755 script.sh

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/$(basename "$(pwd)")
TEMP_DIR=~/temp_test_dir

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
TOTAL_PRIVATE_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/private" -type d -name "test_case*" | wc -l)
passed_public_testcases=0
passed_private_testcases=0

setup_test_environment() {
  test_case_dir=$1
  rm -rf $TEMP_DIR
  mkdir -p $TEMP_DIR

  # Copy input and expected output files to temp directory
  cp "$test_case_dir/input.txt" "$TEMP_DIR/input.txt"
  cp "$test_case_dir/output.txt" "$TEMP_DIR/output.txt"
}

evaluate() {
  test_case_dir=$1

  # Setup test environment
  setup_test_environment $test_case_dir

  # Check if expected output file exists
  if [ ! -f ${TEMP_DIR}/output.txt ]; then
    echo "Expected output file not found: ${TEMP_DIR}/expected_output.txt"
    exit 1
  fi

  # Get expected output
  expected_output=$(cat ${TEMP_DIR}/output.txt)

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null

  case "$(basename "$test_case_dir")" in
    test_case_1|test_case_2|test_case_3|test_case_4)
      # Run awk script for counting tickets per topic group
      awk -f $STUDENT_WORK_DIR/count_tickets.awk < $TEMP_DIR/input.txt > $TEMP_DIR/actual_output.txt
      ;;
    # Add cases for other test cases if needed
  esac

  # Capture the actual output
  if [ -f $TEMP_DIR/actual_output.txt ]; then
    actual_output=$(cat $TEMP_DIR/actual_output.txt)
  else
    actual_output=""
  fi
  popd > /dev/null

  # Compare the actual output with the expected output using diff -w to ignore whitespace differences
  if diff -w <(echo "$actual_output") <(echo "$expected_output") > /dev/null; then
    return 0
  else
    echo "Differences:"
    echo "Expected:"
    echo "$expected_output"
    echo "Actual:"
    echo "$actual_output"
    diff -w <(echo "$actual_output") <(echo "$expected_output")
    return 1
  fi
}

echo "Public Test Cases:"
while read -r test_case; do
  echo "-> $test_case" >&2
  [ -z "$test_case" ] && continue
  if evaluate "$test_case"; then
    echo "PASS: ${test_case}"
    passed_public_testcases=$((passed_public_testcases + 1))
  else
    echo "FAIL: ${test_case}"
  fi
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)

echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

echo "Private Test Cases:"
while read -r test_case; do
  echo "-> $test_case" >&2
  [ -z "$test_case" ] && continue
  if evaluate "$test_case"; then
    echo "PASS: ${test_case}"
    passed_private_testcases=$((passed_private_testcases + 1))
  else
    echo "FAIL: ${test_case}"
  fi
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/private" -type d -name "test_case*" | sort)

echo "Private Testcases Passed: $passed_private_testcases/$TOTAL_PRIVATE_TESTCASES" >&2

if [ "$passed_private_testcases" -ne "$TOTAL_PRIVATE_TESTCASES" ]; then
    exit 1
fi

