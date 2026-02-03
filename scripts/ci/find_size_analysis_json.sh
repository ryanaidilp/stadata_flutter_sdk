#!/bin/bash

# Find the latest Flutter size analysis JSON file
# Usage: ./find_size_analysis_json.sh [working_directory]
# Returns: Path to the latest JSON file, or empty if not found

set -e

WORKING_DIR="${1:-.}"

# Search for the latest numbered analysis JSON (Flutter increments when files exist)
# Use sort -V for version sorting, tail -n 1 to get the latest
SIZE_JSON=$(find "$HOME/.flutter-devtools" -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)

if [ -n "$SIZE_JSON" ]; then
  echo "$SIZE_JSON"
  exit 0
fi

# Fallback: search in build directory
cd "$WORKING_DIR" 2>/dev/null || exit 1
SIZE_JSON=$(find build -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)

if [ -n "$SIZE_JSON" ]; then
  echo "$SIZE_JSON"
  exit 0
fi

# Not found
exit 1
