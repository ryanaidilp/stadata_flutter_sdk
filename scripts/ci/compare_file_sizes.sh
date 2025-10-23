#!/bin/bash

# Compare file-level sizes between two builds
# Usage: ./compare_file_sizes.sh <base_json> <pr_json> <output_file>

set -e

BASE_JSON="$1"
PR_JSON="$2"
OUTPUT_FILE="$3"

SCRIPT_DIR="$(dirname "$0")"

# Extract file sizes from both builds
BASE_BREAKDOWN=$(mktemp)
PR_BREAKDOWN=$(mktemp)

"$SCRIPT_DIR/extract_file_sizes.sh" "$BASE_JSON" | sort -t'|' -k1 > "$BASE_BREAKDOWN"
"$SCRIPT_DIR/extract_file_sizes.sh" "$PR_JSON" | sort -t'|' -k1 > "$PR_BREAKDOWN"

# Generate diff report
echo "| File | Size Change |" > "$OUTPUT_FILE"
echo "|------|-------------|" >> "$OUTPUT_FILE"

# Process differences
HAS_CHANGES=false

# Combine all files from both builds
cat "$BASE_BREAKDOWN" "$PR_BREAKDOWN" | cut -d'|' -f1 | sort -u | while read -r filepath; do
  if [ -z "$filepath" ]; then continue; fi

  BASE_SIZE=$(grep "^${filepath}|" "$BASE_BREAKDOWN" | cut -d'|' -f2 || echo "0")
  PR_SIZE=$(grep "^${filepath}|" "$PR_BREAKDOWN" | cut -d'|' -f2 || echo "0")

  BASE_SIZE=${BASE_SIZE:-0}
  PR_SIZE=${PR_SIZE:-0}

  if [ "$BASE_SIZE" != "$PR_SIZE" ]; then
    DIFF=$((PR_SIZE - BASE_SIZE))
    if [ "$DIFF" -ne 0 ]; then
      DIFF_KB=$(echo "scale=2; $DIFF / 1024" | bc)
      if [ "$DIFF" -gt 0 ]; then
        echo "| \`${filepath}\` | 📈 +${DIFF_KB}KB |" >> "$OUTPUT_FILE"
      else
        # Remove negative sign for display
        POS_DIFF_KB=$(echo "$DIFF_KB" | tr -d '-')
        echo "| \`${filepath}\` | 📉 -${POS_DIFF_KB}KB |" >> "$OUTPUT_FILE"
      fi
      HAS_CHANGES=true
    fi
  fi
done

# Cleanup
rm -f "$BASE_BREAKDOWN" "$PR_BREAKDOWN"

# Check if we have any changes
if [ "$HAS_CHANGES" = true ] && [ $(wc -l < "$OUTPUT_FILE") -gt 2 ]; then
  echo "true"
else
  rm -f "$OUTPUT_FILE"
  echo "false"
fi
