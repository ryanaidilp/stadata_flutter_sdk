#!/bin/bash

# STADATA Flutter SDK - Changelog Generator
# 
# This script generates a changelog from git commits using conventional commit format.
# It's designed for local development use.
#
# Usage:
#   ./scripts/generate-changelog.sh [options]
#
# Examples:
#   # Generate changelog since last tag
#   ./scripts/generate-changelog.sh
#
#   # Generate changelog for specific version
#   ./scripts/generate-changelog.sh --version 1.0.0
#
#   # Generate changelog since specific tag
#   ./scripts/generate-changelog.sh --from-tag v0.8.0 --version 0.8.1
#
#   # Preview without updating file
#   ./scripts/generate-changelog.sh --dry-run
#
#   # Generate with specific commit types only
#   ./scripts/generate-changelog.sh --types feat,fix,docs

set -e

# Default values
VERSION=""
FROM_TAG=""
OUTPUT=""
TYPES="feat,fix,docs,style,refactor,perf,test,chore,ci,build"
DRY_RUN=false
PREVIEW=false
UPDATE_MAIN=false
HELP=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Function to show help
show_help() {
    cat << EOF
STADATA Flutter SDK - Changelog Generator

USAGE:
    ./scripts/generate-changelog.sh [OPTIONS]

OPTIONS:
    --version VERSION        Version for the changelog entry
    --from-tag TAG          Generate changelog from this tag (exclusive)
    --to-tag TAG            Generate changelog to this tag (default: HEAD)
    --types TYPES           Comma-separated commit types (default: feat,fix,docs,style,refactor,perf,test,chore,ci,build)
    --output FILE           Output file (default: show on stdout)
    --update-main           Update the main CHANGELOG.md file
    --dry-run               Show what would be generated without writing
    --preview               Show preview and ask for confirmation
    --help                  Show this help message

EXAMPLES:
    # Generate changelog since last tag
    ./scripts/generate-changelog.sh

    # Generate for specific version
    ./scripts/generate-changelog.sh --version 1.0.0 --update-main

    # Preview before updating
    ./scripts/generate-changelog.sh --version 1.0.0 --preview --update-main

    # Generate with only specific commit types
    ./scripts/generate-changelog.sh --types feat,fix --version 1.0.0

    # Dry run to see what would be generated
    ./scripts/generate-changelog.sh --dry-run

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --version)
            VERSION="$2"
            shift 2
            ;;
        --from-tag)
            FROM_TAG="$2"
            shift 2
            ;;
        --to-tag)
            TO_TAG="$2"
            shift 2
            ;;
        --types)
            TYPES="$2"
            shift 2
            ;;
        --output)
            OUTPUT="$2"
            shift 2
            ;;
        --update-main)
            UPDATE_MAIN=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --preview)
            PREVIEW=true
            shift
            ;;
        --help)
            HELP=true
            shift
            ;;
        *)
            print_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Show help if requested
if [ "$HELP" = true ]; then
    show_help
    exit 0
fi

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ] && [ ! -f "packages/stadata_flutter_sdk/pubspec.yaml" ]; then
    print_error "Please run this script from the root of the STADATA Flutter SDK repository"
    exit 1
fi

# Check if Python script exists
SCRIPT_PATH=".github/scripts/generate_changelog.py"
if [ ! -f "$SCRIPT_PATH" ]; then
    print_error "Changelog generator script not found at $SCRIPT_PATH"
    exit 1
fi

# Ensure we have Python
if ! command -v python3 &> /dev/null; then
    print_error "Python 3 is required but not installed"
    exit 1
fi

# If no version specified, try to determine from git
if [ -z "$VERSION" ] && [ "$DRY_RUN" = false ]; then
    # Try to get version from latest tag
    LATEST_TAG=$(git tag --sort=-version:refname | head -1 2>/dev/null || echo "")
    if [ -n "$LATEST_TAG" ]; then
        print_info "No version specified. Latest tag is: $LATEST_TAG"
        read -p "Enter version for new changelog entry (or press Enter to use date): " VERSION
        if [ -z "$VERSION" ]; then
            VERSION=$(date +"%Y-%m-%d")
        fi
    else
        VERSION=$(date +"%Y-%m-%d")
        print_info "No git tags found. Using date as version: $VERSION"
    fi
fi

# If no from_tag specified, use latest tag
if [ -z "$FROM_TAG" ] && [ "$DRY_RUN" = false ]; then
    FROM_TAG=$(git tag --sort=-version:refname | head -1 2>/dev/null || echo "")
    if [ -n "$FROM_TAG" ]; then
        print_info "Using latest tag as starting point: $FROM_TAG"
    fi
fi

# Build the Python command
PYTHON_CMD="python3 $SCRIPT_PATH"

if [ -n "$VERSION" ]; then
    PYTHON_CMD="$PYTHON_CMD --version '$VERSION'"
fi

if [ -n "$FROM_TAG" ]; then
    PYTHON_CMD="$PYTHON_CMD --from-tag '$FROM_TAG'"
fi

if [ -n "$TO_TAG" ]; then
    PYTHON_CMD="$PYTHON_CMD --to-tag '$TO_TAG'"
fi

if [ -n "$TYPES" ]; then
    PYTHON_CMD="$PYTHON_CMD --types '$TYPES'"
fi

if [ "$DRY_RUN" = true ]; then
    PYTHON_CMD="$PYTHON_CMD --dry-run"
fi

# Add output file if specified
if [ -n "$OUTPUT" ]; then
    PYTHON_CMD="$PYTHON_CMD --output '$OUTPUT'"
elif [ "$UPDATE_MAIN" = true ] && [ "$DRY_RUN" = false ]; then
    # We'll handle main changelog update separately
    PYTHON_CMD="$PYTHON_CMD --output CHANGELOG_NEW.md"
fi

# Add other options
PYTHON_CMD="$PYTHON_CMD --include-author"

print_info "Generating changelog..."
print_info "Command: $PYTHON_CMD"

# Execute the Python script
if [ "$PREVIEW" = true ] && [ "$DRY_RUN" = false ]; then
    # First do a dry run for preview
    eval "python3 $SCRIPT_PATH --dry-run --version '$VERSION' ${FROM_TAG:+--from-tag '$FROM_TAG'} --types '$TYPES' --include-author"
    
    echo ""
    read -p "Do you want to proceed with generating the changelog? (y/N): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_warning "Changelog generation cancelled"
        exit 0
    fi
fi

# Execute the command
eval "$PYTHON_CMD"

# Handle main changelog update
if [ "$UPDATE_MAIN" = true ] && [ "$DRY_RUN" = false ] && [ -f "CHANGELOG_NEW.md" ]; then
    print_info "Updating main CHANGELOG.md..."
    
    # Create backup
    cp CHANGELOG.md CHANGELOG_BACKUP.md
    print_success "Created backup: CHANGELOG_BACKUP.md"
    
    # Combine changelogs
    {
        echo "# Change Log"
        echo ""
        cat CHANGELOG_NEW.md
        echo ""
        # Skip the header of the existing changelog
        tail -n +3 CHANGELOG.md
    } > CHANGELOG_TEMP.md
    
    # Replace original
    mv CHANGELOG_TEMP.md CHANGELOG.md
    rm CHANGELOG_NEW.md
    
    print_success "Updated CHANGELOG.md successfully!"
    print_info "Backup saved as CHANGELOG_BACKUP.md"
    
    # Show git status
    echo ""
    print_info "Git status:"
    git status --porcelain CHANGELOG.md
    
    # Ask about committing
    echo ""
    read -p "Do you want to commit the changelog update? (y/N): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add CHANGELOG.md
        git commit -m "docs(changelog): update for version $VERSION

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>"
        print_success "Changelog committed!"
    else
        print_info "Changelog updated but not committed. You can commit manually with:"
        echo "  git add CHANGELOG.md"
        echo "  git commit -m \"docs(changelog): update for version $VERSION\""
    fi
fi

print_success "Changelog generation completed!"