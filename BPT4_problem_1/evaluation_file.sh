#!/bin/bash

cat > script.sh << EOF
#!/usr/bin/bash

chmod 755 function.sh
source function.sh

EOF
chmod 755 script.sh
source script.sh

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
STUDENT_WORK_DIR=~/se2001/$(basename "$(pwd)")
TEMP_DIR=~/temp_test_dir

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

evaluate() {
  test_case_dir=$1

  # Create a temporary directory for the test case
  rm -rf $TEMP_DIR
  mkdir -p $TEMP_DIR
  cp -r $test_case_dir/* $TEMP_DIR/

  # Get expected output
  expected_output=$(cat ${test_case_dir}/output.txt)

  # Change to the student's work directory and run the student's script
  pushd $STUDENT_WORK_DIR > /dev/null
  actual_output=$(source function.sh; $(cat $test_case_dir/input.txt))
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

