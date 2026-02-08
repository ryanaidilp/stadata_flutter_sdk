#!/bin/bash
set -e

# Build PR APK with size analysis
#
# This script builds the Flutter example app APK with size analysis enabled.
#
# Outputs:
#   Sets GITHUB_OUTPUT with:
#     - apk_path: Path to the built APK
#     - apk_size: Human-readable APK size
#     - size_json: Path to size analysis JSON

echo "Building APK with size analysis..."

# Clean build directory to ensure fresh analysis
flutter clean

# Build APK with size analysis (without --release flag as per Flutter docs)
# The --analyze-size flag automatically builds in release mode
flutter build apk --analyze-size --target-platform android-arm64

# Check for APK
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"

if [ ! -f "$APK_PATH" ]; then
  echo "❌ APK build failed - file not found: $APK_PATH"
  exit 1
fi

echo "✅ APK built successfully: $APK_PATH"

# Get APK size
APK_SIZE=$(du -h "$APK_PATH" | cut -f1)
echo "apk_size=$APK_SIZE" >> $GITHUB_OUTPUT
echo "📊 APK size: $APK_SIZE"

# Output APK path
echo "apk_path=$APK_PATH" >> $GITHUB_OUTPUT

# Check for size analysis JSON
echo "🔍 Searching for size analysis JSON..."

# Get the directory containing the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Call find_size_analysis_json.sh from the script directory
if [ -f "$SCRIPT_DIR/find_size_analysis_json.sh" ]; then
  echo "Using find_size_analysis_json.sh script"
  SIZE_JSON=$("$SCRIPT_DIR/find_size_analysis_json.sh" . || echo "")
else
  # Fallback: search manually
  echo "Searching in HOME/.flutter-devtools..."
  SIZE_JSON=$(find "$HOME/.flutter-devtools" -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)
  if [ -z "$SIZE_JSON" ]; then
    echo "Searching in build directory..."
    SIZE_JSON=$(find build -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)
  fi
fi

if [ -n "$SIZE_JSON" ] && [ -f "$SIZE_JSON" ]; then
  echo "✅ Found size analysis JSON: $SIZE_JSON"
  echo "size_json=$SIZE_JSON" >> $GITHUB_OUTPUT
else
  echo "⚠️  Size analysis JSON not found"
  echo "Searched locations:"
  echo "  - $HOME/.flutter-devtools"
  echo "  - build/"
fi
