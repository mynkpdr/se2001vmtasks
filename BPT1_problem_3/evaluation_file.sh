#!/usr/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0
while read -r test_case; do
    echo "-> $test_case" >&2
    [ -z "$test_case" ] && continue
    diff <(col <"$test_case/output.txt") <( ./script.sh | col) --color=always
    if [ $? -eq 0 ]; then
        passed_public_testcases=$((passed_public_testcases + 1))
    fi
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)
echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

