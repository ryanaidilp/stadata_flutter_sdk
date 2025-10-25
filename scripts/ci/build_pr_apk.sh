#!/bin/bash
set -e

# Build PR APK with size analysis
#
# This script builds the Flutter example app APK with size analysis enabled,
# renames it with PR information, and captures the size analysis JSON.
#
# Arguments:
#   $1 - PR_NUMBER: Pull request number
#   $2 - SHORT_SHA: Short commit SHA
#   $3 - APK_NAME: Target APK filename
#
# Outputs:
#   Sets GITHUB_OUTPUT with:
#     - apk_path: Path to the built APK
#     - apk_size: Human-readable APK size
#     - size_json: Path to size analysis JSON

PR_NUMBER="$1"
SHORT_SHA="$2"
APK_NAME="$3"

echo "Building APK for PR #${PR_NUMBER} with size analysis..."

# Clean build directory to ensure fresh analysis
flutter clean

# Build APK with size analysis (without --release flag as per Flutter docs)
# The --analyze-size flag automatically builds in release mode
flutter build apk --analyze-size --target-platform android-arm64

# Rename APK with PR info
APK_PATH="build/app/outputs/flutter-apk/app-release.apk"

if [ -f "$APK_PATH" ]; then
  mv "$APK_PATH" "build/app/outputs/flutter-apk/$APK_NAME"
  # Output relative path from current directory (app/example)
  echo "apk_path=build/app/outputs/flutter-apk/$APK_NAME" >> $GITHUB_OUTPUT
  echo "✅ APK built successfully: $APK_NAME"

  # Get APK size
  APK_SIZE=$(du -h "build/app/outputs/flutter-apk/$APK_NAME" | cut -f1)
  echo "apk_size=$APK_SIZE" >> $GITHUB_OUTPUT
  echo "📊 APK size: $APK_SIZE"

  # Check for size analysis JSON
  echo "🔍 Searching for size analysis JSON..."

  # Get the directory containing the script
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  # Call find_size_analysis_json.sh from the script directory
  if [ -f "$SCRIPT_DIR/find_size_analysis_json.sh" ]; then
    SIZE_JSON=$("$SCRIPT_DIR/find_size_analysis_json.sh" . || echo "")
  else
    # Fallback: search manually
    SIZE_JSON=$(find "$HOME/.flutter-devtools" -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)
    if [ -z "$SIZE_JSON" ]; then
      SIZE_JSON=$(find build -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)
    fi
  fi

  if [ -n "$SIZE_JSON" ]; then
    echo "✅ Found size analysis JSON: $(basename $SIZE_JSON)"

    # Copy to a known location with descriptive name
    mkdir -p build/size-analysis
    cp "$SIZE_JSON" "build/size-analysis/size_analysis_pr_${SHORT_SHA}.json"
    # Output relative path from current directory (app/example)
    echo "size_json=build/size-analysis/size_analysis_pr_${SHORT_SHA}.json" >> $GITHUB_OUTPUT
    echo "✅ Size analysis saved as: size_analysis_pr_${SHORT_SHA}.json"
  else
    echo "⚠️  Size analysis JSON not found"
  fi
else
  echo "❌ APK build failed - file not found"
  exit 1
fi
