#!/bin/bash

set -euo pipefail
shopt -s nullglob

# Directory containing test files
test_dir="tests"

# Function to run promtool and ensure output is shown
run_test() {
  local test_file="$1"
  promtool test rules "$test_file"
}

# Export the function so it's available to xargs
export -f run_test

# Find all .test files and run them using promtool with parallel execution
# TODO add xargs argument -P 4 when this starts take over 2 minutes
if find "$test_dir" -type f -name '*.test' -print0 | xargs -0 -I {} bash -c 'run_test "$@"' _ {}; then
    echo "All tests passed successfully."
    exit 0
else
    echo "One or more tests failed."
    exit 1
fi