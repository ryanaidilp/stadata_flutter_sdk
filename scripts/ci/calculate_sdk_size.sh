#!/bin/bash

# Calculate SDK size from Flutter size analysis JSON
# Usage: ./calculate_sdk_size.sh <json_file>

set -e

JSON_FILE="$1"

if [ -z "$JSON_FILE" ] || [ ! -f "$JSON_FILE" ]; then
  echo "0"
  exit 0
fi

# Calculate SDK size using jq
jq '
  def sum_values:
    if type == "object" then
      (.value // 0) + (if .children then (.children | map(sum_values) | add // 0) else 0 end)
    elif type == "array" then
      map(sum_values) | add // 0
    else
      0
    end;

  [.. | objects | select(.n? == "package:stadata_flutter_sdk")] |
  if length > 0 then
    (.[0] | sum_values)
  else
    0
  end
' "$JSON_FILE" 2>/dev/null || echo "0"
