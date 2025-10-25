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
    .. | objects | select(.n? == "package:stadata_flutter_sdk" and .children);

  # Find the src folder within the package
  def find_src:
    [find_package | .children[]? | select(.n? == "src")] |
    if length > 0 then .[0] else null end;

  # Find the features folder within src
  def find_features_folder:
    find_src |
    if . then .children[]? | select(.n? == "features") else null end;

  # Extract feature sizes from the features folder
  def extract_features:
    find_features_folder |
    if . and .children then
      .children[] |
      {
        feature: .n,
        size: sum_values
      }
    else
      empty
    end;

  # Extract core and shared sizes
  def extract_core_shared:
    find_src |
    if . and .children then
      .children[] |
      select(.n? == "core" or .n? == "shared") |
      {
        feature: .n,
        size: sum_values
      }
    else
      empty
    end;

  # Combine all results
  {
    # Calculate total from nested package that has "src" as child
    total: (
      .. | objects |
      select(.n? == "package:stadata_flutter_sdk" and (.children | if . then (map(.n) | any(. == "src")) else false end)) |
      sum_values
    ),
    # Feature breakdown
    features: (
      [extract_features, extract_core_shared] |
      group_by(.feature) |
      map({
        feature: .[0].feature,
        size: (map(.size) | add)
      }) |
      map({(.feature): .size}) | add // {}
    )
  }
' "$JSON_FILE" 2>/dev/null || echo "{}"
