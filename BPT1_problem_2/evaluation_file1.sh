#!/usr/bin/bash

SYNCHRO_ASSIGNMENT_DIR="/opt/se2001/$(basename "$(pwd)")"
TOTAL_PUBLIC_TESTCASES=$(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | wc -l)
passed_public_testcases=0
while read -r test_case; do
    echo "-> $test_case" >&2
    [ -z "$test_case" ] && continue
    [ -a project ] && rm -r project
    #./script.sh
    [ -d ./project ] || exit 1
    [ -d ./project/src ] || exit 1
    [ -d ./project/src/module1 ] || exit 1
    [ -d ./project/src/module2 ] || exit 1
    [ -d ./project/src/module1/include ] || exit 1
    [ -d ./project/src/module1/lib ] || exit 1
    [ -d ./project/src/module2/include ] || exit 1
    [ -d ./project/src/module2/lib ] || exit 1
    [ -d ./project/docs ] || exit 1
    [ -d ./project/docs/api ] || exit 1
    [ -d ./project/docs/manual ] || exit 1
    [ -d ./project/bin ] || exit 1

    [ -f ./project/src/module1/include/module1.h ] || exit 1
    [ -f ./project/src/module1/lib/module1.so ] || exit 1
    [ -f ./project/src/module2/include/module2.h ] || exit 1
    [ -f ./project/src/module2/lib/module2.so ] || exit 1

    [ -L ./project/documentation ] && [ -d ./project/documentation ] || exit 1

    [ -L ./project/backup/reports_backup.txt ] || exit 1

    [ -L ./project/src/module2/lib/module1_symlink.so ] || exit 1


    [ -f ./project/bin/module1_hardlink.h ] || exit 1
    [ -f ./project/bin/module2_hardlink.so ] || exit 1

    [[ "$(realpath ./project/docs)" == "$(realpath ./project/documentation)" ]] || exit 1
    
    [[ "$(realpath ./project/src/module2/lib/module1.h)" == "$(realpath ./project/src/module2/lib/module1_symlink.so)" ]] || exit 1
    
    [[ "$(stat -c '%i' ./project/src/module1/include/module1.h)" == "$(stat -c '%i' ./project/bin/module1_hardlink.h)" ]] || exit 1

    [[ "$(stat -c '%i' ./project/src/module1/lib/module2.so)" -eq "$(stat -c '%i' ./project/bin/module2_hardlink.so)" ]] || exit 1

    find ./project -maxdepth 0 -type d -perm 755 || exit 1
    find ./project/src -type d ! -perm 700 | grep -q . && exit 1
    find ./project -type f -name "*.h" ! -perm 644 | grep -q . && exit 1
    find ./project -type f -name "*.so" ! -perm 755 | grep -q . && exit 1

    if [ $? -eq 0 ]; then
        passed_public_testcases=$((passed_public_testcases + 1))
    fi
done < <(find "$SYNCHRO_ASSIGNMENT_DIR/public" -type d -name "test_case*" | sort)
echo "Public Testcases Passed: $passed_public_testcases/$TOTAL_PUBLIC_TESTCASES" >&2

if [ "$passed_public_testcases" -ne "$TOTAL_PUBLIC_TESTCASES" ]; then
    exit 1
fi

