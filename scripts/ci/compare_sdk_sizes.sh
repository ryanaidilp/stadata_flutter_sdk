#!/bin/bash

# Compare SDK sizes between base and PR builds
# Usage: ./compare_sdk_sizes.sh <base_json> <pr_json>
# Outputs GitHub Actions outputs and returns exit code

set -e

BASE_JSON="$1"
PR_JSON="$2"
THRESHOLD_BYTES=51200
THRESHOLD_KB=50

SCRIPT_DIR="$(dirname "$0")"

echo "🔍 Calculating SDK size from base build..."
BASE_SDK_SIZE=$("$SCRIPT_DIR/calculate_sdk_size.sh" "$BASE_JSON")

echo "🔍 Calculating SDK size from PR build..."
PR_SDK_SIZE=$("$SCRIPT_DIR/calculate_sdk_size.sh" "$PR_JSON")

echo "📊 Extracted sizes:"
echo "  Base SDK size: $BASE_SDK_SIZE bytes"
echo "  PR SDK size: $PR_SDK_SIZE bytes"

# Calculate difference
if [ "$BASE_SDK_SIZE" = "0" ] || [ "$PR_SDK_SIZE" = "0" ]; then
  echo "⚠️  SDK size not found in one or both builds, skipping comparison"
  echo "size_increased=false" >> $GITHUB_OUTPUT
  exit 0
fi

SIZE_DIFF=$((PR_SDK_SIZE - BASE_SDK_SIZE))
SIZE_DIFF_PCT=$(echo "scale=2; ($SIZE_DIFF * 100) / $BASE_SDK_SIZE" | bc)

echo "sdk_size_base=$BASE_SDK_SIZE" >> $GITHUB_OUTPUT
echo "sdk_size_pr=$PR_SDK_SIZE" >> $GITHUB_OUTPUT
echo "sdk_size_diff=$SIZE_DIFF" >> $GITHUB_OUTPUT
echo "sdk_size_diff_pct=$SIZE_DIFF_PCT" >> $GITHUB_OUTPUT

# Format sizes for display
BASE_SIZE_KB=$(echo "scale=2; $BASE_SDK_SIZE / 1024" | bc)
PR_SIZE_KB=$(echo "scale=2; $PR_SDK_SIZE / 1024" | bc)
DIFF_KB=$(echo "scale=2; $SIZE_DIFF / 1024" | bc)

echo "sdk_size_base_kb=${BASE_SIZE_KB}KB" >> $GITHUB_OUTPUT
echo "sdk_size_pr_kb=${PR_SIZE_KB}KB" >> $GITHUB_OUTPUT
echo "sdk_size_diff_kb=${DIFF_KB}KB" >> $GITHUB_OUTPUT

if [ "$SIZE_DIFF" -gt "$THRESHOLD_BYTES" ]; then
  echo "⚠️  SDK size increased by ${DIFF_KB}KB (threshold: ${THRESHOLD_KB}KB)"
  echo "size_increased=true" >> $GITHUB_OUTPUT
  echo "requires_approval=true" >> $GITHUB_OUTPUT
else
  echo "✅ SDK size change is within acceptable threshold (< ${THRESHOLD_KB}KB)"
  echo "size_increased=false" >> $GITHUB_OUTPUT
  echo "requires_approval=false" >> $GITHUB_OUTPUT
fi
