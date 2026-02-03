#!/bin/bash

# Calculate coverage percentage from lcov.info
# Usage: ./calculate_coverage.sh <lcov_file> <output_file>

set -e

LCOV_FILE="$1"
OUTPUT_FILE="$2"

echo "## 📊 Test Coverage Report" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

if [ -f "$LCOV_FILE" ] && [ -s "$LCOV_FILE" ]; then
  # Fast coverage calculation using grep
  echo "📊 Calculating coverage from lcov.info..."

  # Count lines found (LF) and lines hit (LH)
  TOTAL_LINES=0
  HIT_LINES=0

  while IFS= read -r line; do
    if [[ $line == LF:* ]]; then
      TOTAL_LINES=$((TOTAL_LINES + ${line#LF:}))
    elif [[ $line == LH:* ]]; then
      HIT_LINES=$((HIT_LINES + ${line#LH:}))
    fi
  done < "$LCOV_FILE"

  if [ "$TOTAL_LINES" -gt 0 ]; then
    COVERAGE_PERCENT=$(awk "BEGIN {printf \"%.1f\", ($HIT_LINES/$TOTAL_LINES)*100}")
    TOTAL_COVERAGE="${COVERAGE_PERCENT}%"
  else
    TOTAL_COVERAGE="0%"
  fi

  echo "### 🎯 Coverage: ${TOTAL_COVERAGE}" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "| Metric | Value |" >> "$OUTPUT_FILE"
  echo "|--------|-------|" >> "$OUTPUT_FILE"
  echo "| **Total Lines** | ${TOTAL_LINES} |" >> "$OUTPUT_FILE"
  echo "| **Lines Hit** | ${HIT_LINES} |" >> "$OUTPUT_FILE"
  echo "| **Coverage** | ${TOTAL_COVERAGE} |" >> "$OUTPUT_FILE"
  echo "| **Minimum Required** | 80.0% |" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"

  # Check if coverage meets requirement
  COVERAGE_NUM=$(echo $COVERAGE_PERCENT | awk '{printf "%.0f", $1}')
  if [ "$COVERAGE_NUM" -ge 80 ]; then
    echo "✅ Coverage meets the minimum requirement of 80%" >> "$OUTPUT_FILE"
  else
    echo "⚠️ Coverage is below the minimum requirement of 80%" >> "$OUTPUT_FILE"
  fi

  # Output coverage percentage for use in workflow
  echo "$COVERAGE_PERCENT"
else
  echo "### ⚠️ No Coverage Data" >> "$OUTPUT_FILE"
  echo "" >> "$OUTPUT_FILE"
  echo "Coverage data was not generated or tests failed." >> "$OUTPUT_FILE"
  echo "0"
fi
