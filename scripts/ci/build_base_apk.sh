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
REPO_ROOT="$(pwd)"

# Ensure clean working directory before checkout
# This is safe because we're in CI and any changes will be preserved in the PR branch
echo "🧹 Ensuring clean working directory..."
git reset --hard HEAD

# Checkout base branch
echo "📥 Fetching and checking out develop branch..."
git fetch origin develop
git checkout origin/develop

# Always return to the PR branch on exit, even if a later step in this
# script fails (e.g. develop's toolchain no longer matches the Flutter
# version this job resolved). Without this, a failure here would leave
# the job's working tree checked out on develop for every step that
# runs after this one.
cleanup() {
  cd "$REPO_ROOT"
  rm -f app/example/lib/core/di/injectable.config.dart
  rm -f app/example/lib/core/navigation/app_router.gr.dart
  rm -f app/example/lib/core/generated/strings.g.dart
  rm -f app/example/lib/core/generated/strings_en.g.dart
  rm -f app/example/lib/core/generated/strings_id.g.dart
  rm -f app/example/.env
  git reset --hard HEAD
  echo "📥 Returning to PR branch..."
  git checkout -
}
trap cleanup EXIT

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
# slang_build_runner can no longer overwrite its own pre-existing
# (git-committed) outputs now that build_runner removed
# --delete-conflicting-outputs, so clear them before generating.
rm -f lib/core/generated/strings.g.dart lib/core/generated/strings_en.g.dart lib/core/generated/strings_id.g.dart
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

cd "$REPO_ROOT"
echo "✅ Base branch build complete"
