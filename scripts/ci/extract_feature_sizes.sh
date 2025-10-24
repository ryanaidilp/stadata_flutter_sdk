#!/bin/bash

# Extract feature-level size breakdown from Flutter size analysis JSON
# Usage: ./extract_feature_sizes.sh <json_file>
# Outputs: JSON object with feature sizes

set -e

JSON_FILE="$1"

if [ -z "$JSON_FILE" ] || [ ! -f "$JSON_FILE" ]; then
  echo "{}"
  exit 0
fi

# Install jq if needed
if ! command -v jq &> /dev/null; then
  echo "⚠️  jq not found, installing..." >&2
  sudo apt-get update && sudo apt-get install -y jq >&2
fi

# Extract feature sizes using jq
jq -r '
  def sum_values:
    if type == "object" then
      (.value // 0) + (if .children then (.children | map(sum_values) | add // 0) else 0 end)
    elif type == "array" then
      map(sum_values) | add // 0
    else
      0
    end;

  # Find the stadata_flutter_sdk package node
  def find_package:
    .. | objects | select(.n? == "package:stadata_flutter_sdk");

  # Extract feature sizes
  def extract_features:
    find_package |
    if .children then
      .children[] |
      select(.n? // "" | test("^src/features/")) |
      {
        feature: (.n | split("/")[2]),
        size: sum_values
      }
    else
      empty
    end;

  # Also extract core and shared sizes
  def extract_core_shared:
    find_package |
    if .children then
      .children[] |
      select(.n? // "" | test("^src/(core|shared)/")) |
      {
        feature: (.n | split("/")[1]),
        size: sum_values
      }
    else
      empty
    end;

  # Combine all results
  [extract_features, extract_core_shared] |
  group_by(.feature) |
  map({
    feature: .[0].feature,
    size: (map(.size) | add)
  }) |
  {
    total: (map(.size) | add // 0),
    features: (map({(.feature): .size}) | add // {})
  }
' "$JSON_FILE" 2>/dev/null || echo "{}"
