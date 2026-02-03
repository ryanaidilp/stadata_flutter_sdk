/**
 * Add size-increase labels and request review when SDK size exceeds threshold
 *
 * This script creates required labels if they don't exist, adds them to the PR,
 * and requests review from the maintainer.
 */

module.exports = async ({ github, context }) => {
  const prNumber = parseInt(process.env.PR_NUMBER);

  // Get all repository labels
  const { data: repoLabels } = await github.rest.issues.listLabelsForRepo({
    owner: context.repo.owner,
    repo: context.repo.repo,
  });

  const labelNames = repoLabels.map(label => label.name);

  // Check and create labels if they don't exist
  const requiredLabels = [
    { name: 'size-increase', color: 'ff9800', description: 'SDK size increased beyond threshold' },
    { name: 'needs-review', color: 'd93f0b', description: 'Requires maintainer review' }
  ];

  for (const label of requiredLabels) {
    if (!labelNames.includes(label.name)) {
      try {
        await github.rest.issues.createLabel({
          owner: context.repo.owner,
          repo: context.repo.repo,
          name: label.name,
          color: label.color,
          description: label.description
        });
        console.log(`Created label: ${label.name}`);
      } catch (error) {
        console.error(`Failed to create label ${label.name}:`, error.message);
      }
    }
  }

  // Add labels to PR
  try {
    await github.rest.issues.addLabels({
      owner: context.repo.owner,
      repo: context.repo.repo,
      issue_number: prNumber,
      labels: ['size-increase', 'needs-review']
    });
    console.log('✅ Added size-increase and needs-review labels');
  } catch (error) {
    console.error('❌ Failed to add labels:', error.message);
  }

  // Request review from maintainer
  try {
    await github.rest.pulls.requestReviewers({
      owner: context.repo.owner,
      repo: context.repo.repo,
      pull_number: prNumber,
      reviewers: ['ryanaidilp']
    });
    console.log('✅ Requested review from ryanaidilp');
  } catch (error) {
    console.error('❌ Failed to request review:', error.message);
  }
};
