/**
 * Post APK build information and size analysis as a PR comment
 *
 * This script generates and posts (or updates) a comprehensive comment
 * on a pull request with APK download links, size analysis, and warnings.
 */

module.exports = async ({ github, context, core, fs }) => {
  const prNumber = parseInt(process.env.PR_NUMBER);
  const branchName = process.env.BRANCH_NAME;
  const commitSha = process.env.COMMIT_SHA;
  const apkName = process.env.APK_NAME;
  const apkSize = process.env.APK_SIZE;
  const artifactUrl = process.env.ARTIFACT_URL;
  const runId = process.env.RUN_ID;

  // Size comparison data
  const sizeIncreased = process.env.SIZE_INCREASED === 'true';
  const requiresApproval = process.env.REQUIRES_APPROVAL === 'true';
  const sdkSizeBaseKb = process.env.SDK_SIZE_BASE_KB;
  const sdkSizePrKb = process.env.SDK_SIZE_PR_KB;
  const sdkSizeDiffKb = process.env.SDK_SIZE_DIFF_KB;
  const sdkSizeDiffPct = process.env.SDK_SIZE_DIFF_PCT;
  const sdkSizeDiff = parseFloat(process.env.SDK_SIZE_DIFF || '0');
  const comparisonSource = process.env.COMPARISON_SOURCE;
  const fileChangesDetected = process.env.FILE_CHANGES_DETECTED === 'true';
  const featuresChanged = process.env.FEATURES_CHANGED;
  const testMode = process.env.TEST_MODE;

  // Read APK size analysis report
  let sizeAnalysisReport = '';
  try {
    sizeAnalysisReport = fs.readFileSync('apk_size_analysis.md', 'utf8');
    console.log('✅ Found APK size analysis report');
  } catch (error) {
    console.log('No APK size analysis report found:', error.message);
  }

  // Read feature-level breakdown if available
  let featureBreakdownSection = '';
  try {
    const featureBreakdown = fs.readFileSync('feature_size_breakdown.md', 'utf8');
    if (featureBreakdown && featureBreakdown.trim().length > 0) {
      featureBreakdownSection = `

${featureBreakdown}
`;
      console.log('✅ Found feature size breakdown report');
    }
  } catch (error) {
    console.log('No feature breakdown report found:', error.message);
  }

  // Read file-level changes if available
  let fileChangesSection = '';
  if (fileChangesDetected) {
    try {
      const fileChanges = fs.readFileSync('size_file_changes.md', 'utf8');
      if (fileChanges && fileChanges.trim().length > 0) {
        fileChangesSection = `

<details>
<summary>📊 File-Level Changes (click to expand)</summary>

${fileChanges}

</details>
`;
      }
    } catch (error) {
      console.log('No file changes report found:', error.message);
    }
  }

  // Check if we already commented on this PR
  const comments = await github.rest.issues.listComments({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: prNumber
  });

  const botComments = comments.data.filter(comment =>
    comment.user.login === 'github-actions[bot]' &&
    comment.body.includes('📱 APK Build Complete')
  );

  // Build size comparison section
  let sizeComparisonSection = '';
  if (sdkSizeBaseKb && sdkSizePrKb && sdkSizeBaseKb !== '' && sdkSizePrKb !== '') {
    const diffSign = sdkSizeDiff >= 0 ? '+' : '';
    const diffEmoji = sdkSizeDiff >= 0 ? '📈' : '📉';

    sizeComparisonSection = `

### ${diffEmoji} SDK Size Comparison

| Metric | Value |
|--------|-------|
| **Base (develop)** | ${sdkSizeBaseKb} |
| **This PR** | ${sdkSizePrKb} |
| **Difference** | ${diffSign}${sdkSizeDiffKb} (${diffSign}${sdkSizeDiffPct}%) |
`;

    if (sizeIncreased && requiresApproval) {
      sizeComparisonSection += `

> ⚠️ **Warning:** SDK size increased by **${sdkSizeDiffKb}**, exceeding the 50KB threshold!
>
> **Action Required:** This PR requires approval from @ryanaidilp or a maintainer before merging.
>
> Please justify the size increase in the PR description or reduce the SDK size.
`;
    } else if (sdkSizeDiff > 0) {
      sizeComparisonSection += `

ℹ️ SDK size increased but within acceptable threshold (< 50KB).
`;
    } else {
      sizeComparisonSection += `

✅ SDK size decreased or remained stable!
`;
    }

    // Add feature-level breakdown if available
    if (featureBreakdownSection) {
      sizeComparisonSection += featureBreakdownSection;
    }

    // Add file-level changes if available
    if (fileChangesSection) {
      sizeComparisonSection += fileChangesSection;
    }
  }

  // Build test info section
  let testInfoSection = '';
  if (testMode === 'targeted' && featuresChanged) {
    testInfoSection = `
- **Tests Run**: Targeted (${featuresChanged.split(',').length} feature(s): ${featuresChanged})`;
  } else if (testMode === 'all') {
    testInfoSection = `
- **Tests Run**: All tests (critical files changed)`;
  }

  const commentBody = `
## 📱 APK Build Complete

✅ **APK successfully built for this PR!**

### 📋 Build Details
- **PR**: #${prNumber}
- **Branch**: \`${branchName}\`
- **Commit**: \`${commitSha}\`
- **APK Size**: ${apkSize}
- **Build Run**: [#${runId}](${artifactUrl})${testInfoSection}
${sizeComparisonSection}

### 📥 Download APK

**Method 1: Direct Download (Recommended)**
1. Click on the [**Build Run Link**](${artifactUrl}) above
2. Scroll down to the **"Artifacts"** section
3. Click on \`stadata-example-pr-${prNumber}-${commitSha}\` to download

**Method 2: GitHub CLI (if you have it installed)**
\`\`\`bash
gh run download ${runId} --repo ${context.repo.owner}/${context.repo.repo} --name stadata-example-pr-${prNumber}-${commitSha}
\`\`\`

### 📝 APK Info
- **Filename**: \`${apkName}\`
- **Version**: PR #${prNumber} (${commitSha})
- **Platform**: Android (Release build)
- **Retention**: 30 days

### 📊 Size Analysis

${sizeAnalysisReport ? `
<details>
<summary>📈 Detailed APK Size Analysis (click to expand)</summary>

${sizeAnalysisReport}

</details>
` : `
Detailed APK size analysis report is not available.

**Download the raw data:**
1. Go to [Build Run #${runId}](${artifactUrl})
2. Scroll to **"Artifacts"** section
3. Download \`size-analysis-json-pr-${prNumber}-${commitSha}\`
`}

### 🚀 Installation
1. Download the APK file
2. Enable "Install from Unknown Sources" in your Android settings
3. Install the APK on your Android device
4. Test the latest changes from this PR

---

🤖 *This comment is automatically updated when new commits are pushed to this PR.*
`;

  if (botComments.length > 0) {
    // Update the existing comment
    await github.rest.issues.updateComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: botComments[0].id,
      body: commentBody
    });
    console.log('Updated existing APK comment');
  } else {
    // Create a new comment
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: prNumber,
      body: commentBody
    });
    console.log('Created new APK comment');
  }
};
