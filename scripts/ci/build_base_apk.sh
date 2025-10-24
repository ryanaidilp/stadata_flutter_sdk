#!/bin/bash
set -e

# Build base branch (develop) APK for size comparison
#
# This script checks out the develop branch, builds the APK with size analysis,
# and captures the size analysis JSON for comparison with the PR build.
#
# Arguments:
#   $1 - ENV_BASE64 (optional): Base64 encoded .env file content
#
# Outputs:
#   Sets GITHUB_OUTPUT with base_size_json path if successful

echo "📦 Building base branch (develop) for size comparison..."
echo "ℹ️  Cached artifact not available, building from develop branch"

ENV_BASE64="${1:-}"

# Save current branch state
git stash || true

# Ensure clean working directory (discard changes to tracked files)
# This is safe because generated files will be regenerated on the target branch
git reset --hard HEAD

# Checkout base branch
git fetch origin develop
git checkout origin/develop

cd app/example

# Setup .env for base build
if [ -n "$ENV_BASE64" ]; then
  echo "Decoding .env file from secret..."
  echo "$ENV_BASE64" | base64 -d > .env
  echo "✅ .env file created"
else
  echo "⚠️  No ENV_BASE64 provided, creating empty .env"
  touch .env
fi

# Get dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Run build_runner
echo "🔨 Running build_runner..."
flutter pub run build_runner build --delete-conflicting-outputs || true

# Clean build directory
echo "🧹 Cleaning build directory..."
flutter clean

# Build base APK with size analysis
echo "🏗️  Building base APK with size analysis..."
flutter build apk --analyze-size --target-platform android-arm64

# Check for size analysis JSON
echo "🔍 Searching for base size analysis JSON..."

# Search for latest numbered JSON file
SIZE_JSON=$(find "$HOME/.flutter-devtools" -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)

if [ -z "$SIZE_JSON" ]; then
  # Fallback: check build directory
  SIZE_JSON=$(find build -name "apk-code-size-analysis_*.json" -type f 2>/dev/null | sort -V | tail -n 1)
fi

if [ -n "$SIZE_JSON" ]; then
  echo "✅ Found base size analysis JSON: $(basename $SIZE_JSON)"

  # Copy to a known location with descriptive name
  mkdir -p build/size-analysis
  cp "$SIZE_JSON" build/size-analysis/size_analysis_develop.json

  # Output path (relative to repo root)
  echo "base_size_json=app/example/build/size-analysis/size_analysis_develop.json" >> $GITHUB_OUTPUT
  echo "✅ Base size analysis saved as: size_analysis_develop.json"
else
  echo "⚠️  Base size analysis JSON not found"
fi

# Return to PR branch
cd ../..
git checkout -
git stash pop || true

echo "✅ Base branch build complete"
