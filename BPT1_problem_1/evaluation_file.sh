#!/usr/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0
while read -r test_case; do
    echo "-> $test_case" >&2
    [ -z "$test_case" ] && continue
    rm -r project
    ./script.sh
    for dept in {1..5}; do
	        for team in {A..C}; do
			        for project in {1..10}; do
					            if [ ! -f "./Dept${dept}/Team${team}/project${project}" ]; then
							                    exit 1
									                fi
											        done
												    done
											    done

    if [ $? -eq 0 ]; then
        passed_public_testcases=$((passed_public_testcases + 1))
    fi
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)
echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

