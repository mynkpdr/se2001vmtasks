#!/bin/bash
mkdir -p encryption/two-level/binary/positive-offset/
touch encryption/two-level/binary/positive-offset/encoding-key
bash "$(dirname "${BASH_SOURCE[0]}")/safety.sh" 2>&1 </dev/null
cat > encryption/two-level/binary/positive-offset/encoding-key
rm encryption -rf
cat ek 2>&1
rm ek
