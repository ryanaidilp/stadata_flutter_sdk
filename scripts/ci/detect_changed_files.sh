#!/bin/bash

# Detect changed files between base and head branch
# Usage: ./detect_changed_files.sh <base_branch> <head_branch>
# Outputs: List of changed file paths

set -e

BASE_BRANCH="${1:-develop}"
HEAD_BRANCH="${2:-HEAD}"

echo "🔍 Detecting changed files between $BASE_BRANCH and $HEAD_BRANCH..."

# Fetch base branch if needed
if ! git rev-parse --verify "origin/$BASE_BRANCH" &>/dev/null; then
  echo "📥 Fetching $BASE_BRANCH..."
  git fetch origin "$BASE_BRANCH"
fi

# Get list of changed files
CHANGED_FILES=$(git diff --name-only "origin/$BASE_BRANCH"..."$HEAD_BRANCH" 2>/dev/null || git diff --name-only "$BASE_BRANCH"..."$HEAD_BRANCH" 2>/dev/null || echo "")

if [ -z "$CHANGED_FILES" ]; then
  echo "⚠️  No changed files detected"
  exit 0
fi

echo "📝 Changed files:"
echo "$CHANGED_FILES"
echo ""
echo "changed_files<<EOF" >> $GITHUB_OUTPUT
echo "$CHANGED_FILES" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT
