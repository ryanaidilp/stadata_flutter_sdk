#!/bin/bash

# Get affected test files based on changed source files
# Usage: ./get_affected_tests.sh <changed_files>
# Outputs: List of test files to run

set -e

# Read changed files from input or stdin
if [ -n "$1" ]; then
  CHANGED_FILES="$1"
else
  CHANGED_FILES=$(cat)
fi

if [ -z "$CHANGED_FILES" ]; then
  echo "⚠️  No changed files provided"
  echo "run_all_tests=true" >> $GITHUB_OUTPUT
  exit 0
fi

echo "🔍 Analyzing changed files to determine affected tests..."

# Initialize arrays
declare -a TEST_FILES
declare -a FEATURES_CHANGED
RUN_ALL_TESTS=false

# Check if critical files changed that require all tests
CRITICAL_PATTERNS=(
  "packages/stadata_flutter_sdk/lib/src/core/"
  "packages/stadata_flutter_sdk/lib/src/shared/"
  "packages/stadata_flutter_sdk/pubspec.yaml"
  ".github/workflows/"
  "melos.yaml"
)

for pattern in "${CRITICAL_PATTERNS[@]}"; do
  if echo "$CHANGED_FILES" | grep -q "$pattern"; then
    echo "⚠️  Critical file changed: Files matching $pattern"
    echo "🔄 Running all tests due to critical file changes"
    RUN_ALL_TESTS=true
    break
  fi
done

if [ "$RUN_ALL_TESTS" = true ]; then
  echo "run_all_tests=true" >> $GITHUB_OUTPUT
  echo "test_files=" >> $GITHUB_OUTPUT
  exit 0
fi

# Analyze each changed file
while IFS= read -r file; do
  # Skip empty lines
  [ -z "$file" ] && continue

  # Feature changes
  if [[ "$file" =~ packages/stadata_flutter_sdk/lib/src/features/([^/]+) ]]; then
    FEATURE="${BASH_REMATCH[1]}"
    FEATURES_CHANGED+=("$FEATURE")

    # Find corresponding test files for this feature
    FEATURE_TEST_DIR="packages/stadata_flutter_sdk/test/src/features/$FEATURE"
    if [ -d "$FEATURE_TEST_DIR" ]; then
      while IFS= read -r test_file; do
        TEST_FILES+=("$test_file")
      done < <(find "$FEATURE_TEST_DIR" -type f -name "*_test.dart" 2>/dev/null)
    fi
  fi

  # Direct test file changes
  if [[ "$file" =~ packages/stadata_flutter_sdk/test/.*_test\.dart$ ]]; then
    TEST_FILES+=("$file")
  fi

  # Example app changes - run integration tests if available
  if [[ "$file" =~ app/example/ ]]; then
    if [ -d "app/example/integration_test" ]; then
      while IFS= read -r test_file; do
        TEST_FILES+=("$test_file")
      done < <(find "app/example/integration_test" -type f -name "*_test.dart" 2>/dev/null)
    fi
  fi
done <<< "$CHANGED_FILES"

# Remove duplicates and sort
if [ ${#TEST_FILES[@]} -gt 0 ]; then
  UNIQUE_TESTS=$(printf '%s\n' "${TEST_FILES[@]}" | sort -u)
  TEST_COUNT=$(echo "$UNIQUE_TESTS" | wc -l | tr -d ' ')

  echo "✅ Found $TEST_COUNT test file(s) to run:"
  echo "$UNIQUE_TESTS"

  echo "run_all_tests=false" >> $GITHUB_OUTPUT
  echo "test_files<<EOF" >> $GITHUB_OUTPUT
  echo "$UNIQUE_TESTS" >> $GITHUB_OUTPUT
  echo "EOF" >> $GITHUB_OUTPUT

  if [ ${#FEATURES_CHANGED[@]} -gt 0 ]; then
    UNIQUE_FEATURES=$(printf '%s\n' "${FEATURES_CHANGED[@]}" | sort -u | tr '\n' ',' | sed 's/,$//')
    echo "features_changed=$UNIQUE_FEATURES" >> $GITHUB_OUTPUT
    echo "📦 Features affected: $UNIQUE_FEATURES"
  fi
else
  echo "⚠️  No specific test files found, running all tests"
  echo "run_all_tests=true" >> $GITHUB_OUTPUT
  echo "test_files=" >> $GITHUB_OUTPUT
fi
