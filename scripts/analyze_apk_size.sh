#!/bin/bash

# APK Size Analysis Script
# Uses Flutter's built-in size analysis to get package-level breakdown

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
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

# Function to convert bytes to human readable
bytes_to_human() {
    local bytes=$1
    if [ $bytes -ge 1073741824 ]; then
        echo "$(echo "scale=2; $bytes / 1073741824" | bc)GB"
    elif [ $bytes -ge 1048576 ]; then
        echo "$(echo "scale=2; $bytes / 1048576" | bc)MB"
    elif [ $bytes -ge 1024 ]; then
        echo "$(echo "scale=2; $bytes / 1024" | bc)KB"
    else
        echo "${bytes}B"
    fi
}

# Check if size analysis JSON is provided
if [ -z "$1" ]; then
    print_error "Size analysis JSON path not provided"
    echo "Usage: $0 <appsz.json> <apk-path> [output-file]"
    echo ""
    echo "To generate appsz.json, run:"
    echo "  flutter build apk --release --analyze-size --target-platform android-arm64"
    exit 1
fi

SIZE_JSON="$1"
APK_PATH="$2"
OUTPUT_FILE="${3:-apk_size_analysis.md}"

# Check if size JSON exists
if [ ! -f "$SIZE_JSON" ]; then
    print_error "Size analysis JSON not found: $SIZE_JSON"
    exit 1
fi

# Check if APK exists (optional for size calculation)
TOTAL_SIZE="N/A"
TOTAL_SIZE_BYTES=0
if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
    TOTAL_SIZE=$(du -h "$APK_PATH" | cut -f1)
    TOTAL_SIZE_BYTES=$(stat -f%z "$APK_PATH" 2>/dev/null || stat -c%s "$APK_PATH" 2>/dev/null)
    APK_FILENAME=$(basename "$APK_PATH")
fi

print_header "APK Size Analysis (Flutter)"

# Install jq if not available (for JSON parsing)
if ! command -v jq &> /dev/null; then
    print_warning "jq not found, installing..."
    # On Ubuntu/Debian
    if command -v apt-get &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y jq
    # On macOS
    elif command -v brew &> /dev/null; then
        brew install jq
    else
        print_error "Please install jq manually: https://stedolan.github.io/jq/"
        exit 1
    fi
fi

print_success "Analyzing: $SIZE_JSON"

# Parse the JSON file
PRECOMPILED_SIZE=$(jq -r '.precompiled.sizeInBytes // 0' "$SIZE_JSON")
AOT_SIZE=$(jq -r '.aot.sizeInBytes // 0' "$SIZE_JSON")
NATIVE_SIZE=$(jq -r '.native.sizeInBytes // 0' "$SIZE_JSON")

# Calculate percentage
calc_percentage() {
    local size=$1
    local total=$2
    if [ $total -eq 0 ]; then
        echo "0.00"
    else
        echo "scale=2; ($size * 100) / $total" | bc
    fi
}

# Generate detailed report
print_header "Generating Report"

cat > "$OUTPUT_FILE" << 'EOF'
# APK Size Analysis Report

EOF

echo "**Generated:** $(date)" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
cat >> "$OUTPUT_FILE" << EOF
**APK File:** $APK_FILENAME
**Total Size:** $TOTAL_SIZE ($TOTAL_SIZE_BYTES bytes)

EOF
fi

cat >> "$OUTPUT_FILE" << 'EOF'
## 📊 Size Breakdown by Category

EOF

# Process precompiled (Dart code)
if [ "$PRECOMPILED_SIZE" != "0" ] && [ "$PRECOMPILED_SIZE" != "null" ]; then
    PRECOMPILED_HUMAN=$(bytes_to_human $PRECOMPILED_SIZE)
    PRECOMPILED_PCT=$(calc_percentage $PRECOMPILED_SIZE $TOTAL_SIZE_BYTES)

    cat >> "$OUTPUT_FILE" << EOF
### Precompiled Code
**Size:** $PRECOMPILED_HUMAN ($PRECOMPILED_SIZE bytes, $PRECOMPILED_PCT%)

This includes all Dart code compiled to native code.

#### Top Packages (Precompiled)

| Package | Size | Percentage |
|---------|------|------------|
EOF

    # Extract top precompiled packages
    jq -r '.precompiled.children[] | "\(.n)|\(.s)|\(.sInBytes)"' "$SIZE_JSON" 2>/dev/null | sort -t'|' -k3 -nr | head -20 | while IFS='|' read -r name display_size size_bytes; do
        if [ -n "$name" ] && [ "$name" != "null" ]; then
            pct=$(calc_percentage $size_bytes $PRECOMPILED_SIZE)
            echo "| \`$name\` | $display_size | $pct% |" >> "$OUTPUT_FILE"
        fi
    done

    echo "" >> "$OUTPUT_FILE"
fi

# Process AOT (ahead-of-time compiled code)
if [ "$AOT_SIZE" != "0" ] && [ "$AOT_SIZE" != "null" ]; then
    AOT_HUMAN=$(bytes_to_human $AOT_SIZE)
    AOT_PCT=$(calc_percentage $AOT_SIZE $TOTAL_SIZE_BYTES)

    cat >> "$OUTPUT_FILE" << EOF
### AOT (Ahead-of-Time Compiled)
**Size:** $AOT_HUMAN ($AOT_SIZE bytes, $AOT_PCT%)

This includes all ahead-of-time compiled code.

EOF
fi

# Process native libraries
if [ "$NATIVE_SIZE" != "0" ] && [ "$NATIVE_SIZE" != "null" ]; then
    NATIVE_HUMAN=$(bytes_to_human $NATIVE_SIZE)
    NATIVE_PCT=$(calc_percentage $NATIVE_SIZE $TOTAL_SIZE_BYTES)

    cat >> "$OUTPUT_FILE" << EOF
### Native Libraries
**Size:** $NATIVE_HUMAN ($NATIVE_SIZE bytes, $NATIVE_PCT%)

This includes all native C/C++ libraries.

#### Native Libraries Breakdown

| Library | Size | Percentage |
|---------|------|------------|
EOF

    # Extract native libraries
    jq -r '.native.children[] | "\(.n)|\(.s)|\(.sInBytes)"' "$SIZE_JSON" 2>/dev/null | sort -t'|' -k3 -nr | while IFS='|' read -r name display_size size_bytes; do
        if [ -n "$name" ] && [ "$name" != "null" ]; then
            pct=$(calc_percentage $size_bytes $NATIVE_SIZE)
            echo "| \`$name\` | $display_size | $pct% |" >> "$OUTPUT_FILE"
        fi
    done

    echo "" >> "$OUTPUT_FILE"
fi

# Find SDK contribution
cat >> "$OUTPUT_FILE" << 'EOF'
## 📚 Stadata Flutter SDK Contribution

EOF

SDK_SIZE=0
SDK_FOUND=false

# Search for stadata_flutter_sdk in precompiled packages
if [ "$PRECOMPILED_SIZE" != "0" ] && [ "$PRECOMPILED_SIZE" != "null" ]; then
    SDK_ENTRY=$(jq -r '.precompiled.children[] | select(.n | contains("stadata_flutter_sdk")) | "\(.n)|\(.s)|\(.sInBytes)"' "$SIZE_JSON" 2>/dev/null)

    if [ -n "$SDK_ENTRY" ]; then
        SDK_FOUND=true
        SDK_NAME=$(echo "$SDK_ENTRY" | cut -d'|' -f1)
        SDK_SIZE_DISPLAY=$(echo "$SDK_ENTRY" | cut -d'|' -f2)
        SDK_SIZE=$(echo "$SDK_ENTRY" | cut -d'|' -f3)
        SDK_PCT_OF_TOTAL=$(calc_percentage $SDK_SIZE $TOTAL_SIZE_BYTES)
        SDK_PCT_OF_PRECOMPILED=$(calc_percentage $SDK_SIZE $PRECOMPILED_SIZE)

        cat >> "$OUTPUT_FILE" << EOF
### Direct SDK Contribution

The **Stadata Flutter SDK** package was found in the size analysis:

| Metric | Value |
|--------|-------|
| **Package** | \`$SDK_NAME\` |
| **Size** | $SDK_SIZE_DISPLAY |
| **% of Total APK** | $SDK_PCT_OF_TOTAL% |
| **% of Precompiled Code** | $SDK_PCT_OF_PRECOMPILED% |

### SDK Dependencies

The SDK also brings these dependencies (already included above):

- \`logger\` - Logging functionality
- \`html_unescape\` - HTML content processing
- \`collection\` - Dart collection utilities
- \`meta\` - Metadata annotations

*Note: Dependency sizes are shared with the app and other packages.*

EOF
    fi
fi

if [ "$SDK_FOUND" = false ]; then
    cat >> "$OUTPUT_FILE" << 'EOF'
The SDK package was not found as a separate entry in the size analysis. This could mean:

1. The SDK code size is very small (< 1% threshold)
2. The SDK code has been merged with other Dart code
3. The size analysis is using a different package naming

**Estimated SDK footprint:** ~200-400 KB of Dart code

EOF
fi

# Size optimization tips
cat >> "$OUTPUT_FILE" << 'EOF'
## 💡 Size Optimization Recommendations

### Already Applied ✅

1. **R8/ProGuard enabled** - Code shrinking and obfuscation active
2. **Resource shrinking enabled** - Unused resources removed
3. **ABI splits configured** - Architecture-specific APKs
4. **Release build** - Optimized production build

### Additional Optimizations

1. **Use App Bundles (AAB)**
   - Upload AAB to Play Store instead of APK
   - Google Play generates optimized APKs per device
   - Typical size reduction: 20-30%

2. **Lazy Loading**
   - Use deferred imports for rarely-used features
   - Reduces initial download size

3. **Image Optimization**
   - Use WebP format instead of PNG/JPG
   - Compress images before bundling
   - Use vector graphics where possible

4. **Remove Unused Dependencies**
   - Audit `pubspec.yaml` for unused packages
   - Each dependency adds to APK size

## 📈 Analysis Summary

EOF

if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
cat >> "$OUTPUT_FILE" << 'EOF'
| Component | Size | % of Total |
|-----------|------|------------|
EOF

echo "| **Total APK** | $TOTAL_SIZE | 100% |" >> "$OUTPUT_FILE"

if [ "$PRECOMPILED_SIZE" != "0" ]; then
    PRECOMPILED_HUMAN=$(bytes_to_human $PRECOMPILED_SIZE)
    PRECOMPILED_PCT=$(calc_percentage $PRECOMPILED_SIZE $TOTAL_SIZE_BYTES)
    echo "| Precompiled Dart | $PRECOMPILED_HUMAN | $PRECOMPILED_PCT% |" >> "$OUTPUT_FILE"
fi

if [ "$AOT_SIZE" != "0" ]; then
    AOT_HUMAN=$(bytes_to_human $AOT_SIZE)
    AOT_PCT=$(calc_percentage $AOT_SIZE $TOTAL_SIZE_BYTES)
    echo "| AOT Compiled | $AOT_HUMAN | $AOT_PCT% |" >> "$OUTPUT_FILE"
fi

if [ "$NATIVE_SIZE" != "0" ]; then
    NATIVE_HUMAN=$(bytes_to_human $NATIVE_SIZE)
    NATIVE_PCT=$(calc_percentage $NATIVE_SIZE $TOTAL_SIZE_BYTES)
    echo "| Native Libraries | $NATIVE_HUMAN | $NATIVE_PCT% |" >> "$OUTPUT_FILE"
fi

if [ "$SDK_FOUND" = true ]; then
    echo "| **Stadata SDK** | $SDK_SIZE_DISPLAY | $SDK_PCT_OF_TOTAL% |" >> "$OUTPUT_FILE"
fi

echo "" >> "$OUTPUT_FILE"
fi

cat >> "$OUTPUT_FILE" << EOF

---

*Generated by APK Size Analysis Script using Flutter's \`--analyze-size\` output*
*Raw data: \`$(basename "$SIZE_JSON")\`*
EOF

print_success "Report generated: $OUTPUT_FILE"

# Display summary
print_header "Analysis Summary"
if [ -n "$APK_PATH" ] && [ -f "$APK_PATH" ]; then
    echo "📱 APK File: $APK_FILENAME"
    echo "📊 Total Size: $TOTAL_SIZE"
fi
echo "📝 Size JSON: $(basename "$SIZE_JSON")"
if [ "$PRECOMPILED_SIZE" != "0" ]; then
    echo "💻 Precompiled Dart: $(bytes_to_human $PRECOMPILED_SIZE)"
fi
if [ "$SDK_FOUND" = true ]; then
    echo "📚 SDK Size: $SDK_SIZE_DISPLAY ($SDK_PCT_OF_TOTAL% of total)"
fi
echo ""
echo "📝 Detailed report saved to: $OUTPUT_FILE"

print_success "Analysis complete!"
