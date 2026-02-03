#!/bin/bash

# Extract file-level sizes from Flutter size analysis JSON
# Usage: ./extract_file_sizes.sh <json_file>

set -e

JSON_FILE="$1"

if [ -z "$JSON_FILE" ] || [ ! -f "$JSON_FILE" ]; then
  exit 0
fi

jq -r '
  # Recursively find all SDK-related nodes and sum their values
  def sum_node_values:
    if type == "object" then
      (.value // 0) + (if .children then (.children | map(sum_node_values) | add // 0) else 0 end)
    else
      0
    end;

  # Find all .dart files under stadata_flutter_sdk
  def find_dart_files:
    if type == "object" then
      if .n? and (.n | type == "string") and (.n | endswith(".dart")) then
        {path: .n, size: sum_node_values}
      else
        (if .children then .children | map(find_dart_files) else [] end)
      end
    else
      []
    end;

  # Navigate to SDK package and extract files
  [.. | objects | select(.n? == "package:stadata_flutter_sdk")] |
  if length > 0 then
    .[0] | [find_dart_files] | flatten | map(select(.path)) |
    sort_by(-.size) |
    .[] |
    "\(.path)|\(.size)"
  else
    empty
  end
' "$JSON_FILE" 2>/dev/null
