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

  // Check if we already have a failure comment on this PR
  const comments = await github.rest.issues.listComments({
    owner: context.repo.owner,
    repo: context.repo.repo,
    issue_number: prNumber
  });

  const botFailureComments = comments.data.filter(comment =>
    comment.user.login === 'github-actions[bot]' &&
    comment.body.includes('❌ APK Build Failed')
  );

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
4. Check for build_runner issues - try running \`flutter pub run build_runner build --delete-conflicting-outputs\`

---

🤖 *This comment is automatically updated when builds fail. Push new commits to retry the build.*
`;

  if (botFailureComments.length > 0) {
    // Update the existing failure comment
    await github.rest.issues.updateComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      comment_id: botFailureComments[0].id,
      body: commentBody
    });
    console.log('Updated existing failure comment');
  } else {
    // Create a new failure comment
    await github.rest.issues.createComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: prNumber,
      body: commentBody
    });
    console.log('Created new failure comment');
  }
};
