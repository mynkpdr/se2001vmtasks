#!/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"

TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR" -type d -name "test_case*" | wc -l)
passed_public_testcases=0

evaluate() {
  test_case_dir=$1
  expected_output_file=$2

  # Run the setup script
  source ${test_case_dir}/setup.sh

  # Run the student's script
  pushd ${test_case_dir} > /dev/null
  source ~/se2001/BPT2_problem_2/script.sh
  popd > /dev/null

  # Check if default_config exists and compare with expected output
  if [[ -f $(pwd)/default_config ]]; then
	  echo "default_config should exist" > $(pwd)/actual_output.txt
  else
	  echo "default_config should not exist" > $(pwd)/actual_output.txt
  fi

  # Compare the actual output with the expected output
  if diff -u ${expected_output_file} $(pwd)/actual_output.txt > /dev/null; then
    echo "PASS: ${test_case_dir}"
    passed_public_testcases=$((passed_public_testcases + 1))
  else
    echo "FAIL: ${test_case_dir}"
    echo "Differences:"
    diff -u ${expected_output_file} $(pwd)/actual_output.txt
  fi

  # Clean up
  rm -f  $(pwd)/actual_output.txt
}

while read -r test_case; do
  echo "-> $test_case" >&2
  [ -z "$test_case" ] && continue
  evaluate "$test_case" "${test_case}/output.txt"
done < <(find "$SYNCHRO_ASSIGNMENT_DIR" -type d -name "test_case*" | sort)

echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

