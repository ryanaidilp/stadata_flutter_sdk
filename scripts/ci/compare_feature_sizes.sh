#!/bin/bash

# Compare feature-level sizes between base and PR builds
# Usage: ./compare_feature_sizes.sh <base_json> <pr_json> <output_file>
# Outputs: Markdown table with feature size comparison

set -e

BASE_JSON="$1"
PR_JSON="$2"
OUTPUT_FILE="${3:-feature_size_comparison.md}"

SCRIPT_DIR="$(dirname "$0")"

if [ ! -f "$BASE_JSON" ] || [ ! -f "$PR_JSON" ]; then
  echo "⚠️  JSON files not found"
  echo "Base: $BASE_JSON"
  echo "PR: $PR_JSON"
  # Create a minimal output file
  cat > "$OUTPUT_FILE" << 'EOF'
## 📦 Package Size Breakdown

⚠️ **Feature size comparison unavailable** - Size analysis JSON files not found.
EOF
  exit 0
fi

echo "📊 Comparing feature sizes..."

# Install jq if needed
if ! command -v jq &> /dev/null; then
  echo "Installing jq..."
  sudo apt-get update -qq && sudo apt-get install -y -qq jq
fi

# Extract feature sizes from both builds
echo "Extracting features from base build..."
BASE_FEATURES=$("$SCRIPT_DIR/extract_feature_sizes.sh" "$BASE_JSON")
echo "Extracting features from PR build..."
PR_FEATURES=$("$SCRIPT_DIR/extract_feature_sizes.sh" "$PR_JSON")

# Check if extraction was successful
BASE_TOTAL=$(echo "$BASE_FEATURES" | jq -r '.total // 0' 2>/dev/null || echo "0")
PR_TOTAL=$(echo "$PR_FEATURES" | jq -r '.total // 0' 2>/dev/null || echo "0")

# Warn if sizes are 0 but still generate tables
if [ "$BASE_TOTAL" = "0" ]; then
  echo "⚠️  Base SDK total is 0 - may indicate SDK not found in base build"
fi
if [ "$PR_TOTAL" = "0" ]; then
  echo "⚠️  PR SDK total is 0 - may indicate SDK not found in PR build"
fi

# Generate comparison table
cat > "$OUTPUT_FILE" << 'EOF'
## 📦 Package Size Breakdown

| Package | Base Size | PR Size | Diff | Change |
|---------|-----------|---------|------|--------|
EOF

# Calculate total package size difference (totals already extracted above)
DIFF_TOTAL=$((PR_TOTAL - BASE_TOTAL))
DIFF_TOTAL_KB=$(echo "scale=2; $DIFF_TOTAL / 1024" | bc)
BASE_TOTAL_KB=$(echo "scale=2; $BASE_TOTAL / 1024" | bc)
PR_TOTAL_KB=$(echo "scale=2; $PR_TOTAL / 1024" | bc)

# Determine sign and emoji
if [ "$DIFF_TOTAL" -gt 0 ]; then
  SIGN="+"
  EMOJI="📈"
elif [ "$DIFF_TOTAL" -lt 0 ]; then
  SIGN=""
  EMOJI="📉"
else
  SIGN=""
  EMOJI="➡️"
fi

# Calculate percentage (handle division by zero)
if [ "$BASE_TOTAL" -gt 0 ]; then
  DIFF_PCT=$(echo "scale=2; ($DIFF_TOTAL * 100) / $BASE_TOTAL" | bc)
else
  DIFF_PCT="N/A"
fi

# Add total row
echo "| **package:stadata_flutter_sdk** | **${BASE_TOTAL_KB} KB** | **${PR_TOTAL_KB} KB** | **${SIGN}${DIFF_TOTAL_KB} KB** | **${SIGN}${DIFF_PCT}%** $EMOJI |" >> "$OUTPUT_FILE"

# Add separator
cat >> "$OUTPUT_FILE" << 'EOF'

## 📋 Feature-Level Breakdown

| Feature | Base Size | PR Size | Diff | Change |
|---------|-----------|---------|------|--------|
EOF

# Get all unique features
ALL_FEATURES=$(echo "$BASE_FEATURES $PR_FEATURES" | jq -rs '
  [.[].features | to_entries[]] |
  map(.key) |
  unique |
  sort[]
' | tr -d '"')

# Compare each feature
while IFS= read -r feature; do
  [ -z "$feature" ] && continue

  BASE_SIZE=$(echo "$BASE_FEATURES" | jq -r ".features.\"$feature\" // 0")
  PR_SIZE=$(echo "$PR_FEATURES" | jq -r ".features.\"$feature\" // 0")

  # Skip if both are 0
  if [ "$BASE_SIZE" = "0" ] && [ "$PR_SIZE" = "0" ]; then
    continue
  fi

  DIFF=$((PR_SIZE - BASE_SIZE))
  BASE_KB=$(echo "scale=2; $BASE_SIZE / 1024" | bc)
  PR_KB=$(echo "scale=2; $PR_SIZE / 1024" | bc)
  DIFF_KB=$(echo "scale=2; $DIFF / 1024" | bc)

  # Determine sign and emoji for feature
  if [ "$DIFF" -gt 0 ]; then
    FEAT_SIGN="+"
    FEAT_EMOJI="📈"
  elif [ "$DIFF" -lt 0 ]; then
    FEAT_SIGN=""
    FEAT_EMOJI="📉"
  else
    FEAT_SIGN=""
    FEAT_EMOJI="➡️"
  fi

  # Calculate feature percentage
  if [ "$BASE_SIZE" -gt 0 ]; then
    FEAT_PCT=$(echo "scale=2; ($DIFF * 100) / $BASE_SIZE" | bc)
  else
    FEAT_PCT="N/A"
  fi

  # Format feature name
  FEATURE_NAME=$(echo "$feature" | sed 's/_/ /g' | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) tolower(substr($i,2))}}1')

  if [ "$FEAT_PCT" = "N/A" ]; then
    echo "| $FEATURE_NAME | ${BASE_KB} KB | ${PR_KB} KB | ${FEAT_SIGN}${DIFF_KB} KB | New $FEAT_EMOJI |" >> "$OUTPUT_FILE"
  else
    echo "| $FEATURE_NAME | ${BASE_KB} KB | ${PR_KB} KB | ${FEAT_SIGN}${DIFF_KB} KB | ${FEAT_SIGN}${FEAT_PCT}% $FEAT_EMOJI |" >> "$OUTPUT_FILE"
  fi
done <<< "$ALL_FEATURES"

echo "✅ Feature size comparison saved to $OUTPUT_FILE"

# Output summary to GitHub Actions
if [ -n "$GITHUB_OUTPUT" ]; then
  echo "feature_breakdown_file=$OUTPUT_FILE" >> $GITHUB_OUTPUT
  echo "package_size_base_kb=${BASE_TOTAL_KB}KB" >> $GITHUB_OUTPUT
  echo "package_size_pr_kb=${PR_TOTAL_KB}KB" >> $GITHUB_OUTPUT
  echo "package_size_diff_kb=${SIGN}${DIFF_TOTAL_KB}KB" >> $GITHUB_OUTPUT
  echo "package_size_diff_pct=${SIGN}${DIFF_PCT}%" >> $GITHUB_OUTPUT
fi

cat "$OUTPUT_FILE"
