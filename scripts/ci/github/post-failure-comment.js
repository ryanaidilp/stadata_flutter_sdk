/**
 * Post a failure notification comment when APK build fails
 *
 * This script posts a helpful comment with debugging information
 * and common solutions when the APK build process fails.
 */

module.exports = async ({ github, context }) => {
  const prNumber = parseInt(process.env.PR_NUMBER);
  const runId = process.env.RUN_ID;
  const artifactUrl = `https://github.com/${context.repo.owner}/${context.repo.repo}/actions/runs/${runId}`;

  const commentBody = `
## ❌ APK Build Failed

The APK build for this PR has failed. Please check the build logs for more details.

### 🔍 Debugging
- **Build Run**: [#${runId}](${artifactUrl})
- **PR**: #${prNumber}

### 💡 Common Solutions
1. Check for compilation errors in your Flutter code
2. Ensure all dependencies are properly specified
3. Verify that the code builds locally with \`flutter build apk --release\`

---

🤖 *This comment is automatically generated when APK builds fail.*
`;

  await github.rest.issues.createComment({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: prNumber,
    body: commentBody
  });

  console.log('Posted failure notification comment');
};
