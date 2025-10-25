#!/bin/bash

# Calculate SDK size from Flutter size analysis JSON
# Usage: ./calculate_sdk_size.sh <json_file>

set -e

JSON_FILE="$1"

if [ -z "$JSON_FILE" ] || [ ! -f "$JSON_FILE" ]; then
  echo "⚠️  No JSON file provided or file doesn't exist: $JSON_FILE" >&2
  echo "0"
  exit 0
fi

echo "🔍 Searching for SDK package in: $(basename $JSON_FILE)" >&2

# Debug: Check if jq is available
if ! command -v jq &> /dev/null; then
  echo "⚠️  jq not found, installing..." >&2
  sudo apt-get update -qq && sudo apt-get install -y -qq jq >&2
fi

# Calculate SDK size using jq with multiple search patterns
RESULT=$(jq '
  def sum_values:
    if type == "object" then
      (.value // 0) + (if .children then (.children | map(sum_values) | add // 0) else 0 end)
    elif type == "array" then
      map(sum_values) | add // 0
    else
      0
    end;

  # Try multiple patterns to find the SDK package
  (
    [.. | objects | select(.n? == "package:stadata_flutter_sdk")] |
    if length > 0 then
      (.[0] | sum_values)
    else
      # Try alternative pattern without package: prefix
      [.. | objects | select(.n? == "stadata_flutter_sdk")] |
      if length > 0 then
        (.[0] | sum_values)
      else
        # Try pattern with lib prefix
        [.. | objects | select(.n? | test("stadata_flutter_sdk"))] |
        if length > 0 then
          (.[0] | sum_values)
        else
          0
        end
      end
    end
  )
' "$JSON_FILE" 2>/dev/null)

if [ -z "$RESULT" ] || [ "$RESULT" = "null" ]; then
  echo "⚠️  Could not extract SDK size from JSON" >&2
  echo "0"
  exit 0
fi

if [ "$RESULT" = "0" ]; then
  echo "⚠️  SDK package not found in size analysis JSON" >&2
  echo "   Searched for: package:stadata_flutter_sdk, stadata_flutter_sdk" >&2
else
  echo "✅ Found SDK size: $RESULT bytes" >&2
fi

echo "$RESULT"
