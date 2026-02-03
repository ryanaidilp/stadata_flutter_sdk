/**
 * Cleanup PR artifacts after PR is closed/merged
 *
 * This script deletes all artifacts associated with a PR when it's closed,
 * freeing up storage space and keeping the artifacts list clean.
 */

module.exports = async ({ github, context, core }) => {
  const prNumber = context.payload.pull_request.number;
  const isMerged = context.payload.pull_request.merged;
  const action = isMerged ? 'merged' : 'closed without merging';

  console.log(`PR #${prNumber} was ${action}`);
  console.log('🧹 Starting artifact cleanup...');

  try {
    // List all artifacts in the repository
    const { data: artifacts } = await github.rest.actions.listArtifactsForRepo({
      owner: context.repo.owner,
      repo: context.repo.repo,
      per_page: 100
    });

    // Filter artifacts that belong to this PR
    // Artifacts are named: stadata-example-pr-{prNumber}-{sha} and size-analysis-json-pr-{prNumber}-{sha}
    const prArtifacts = artifacts.artifacts.filter(artifact => {
      const patterns = [
        `stadata-example-pr-${prNumber}-`,
        `size-analysis-json-pr-${prNumber}-`
      ];
      return patterns.some(pattern => artifact.name.startsWith(pattern));
    });

    if (prArtifacts.length === 0) {
      console.log(`✅ No artifacts found for PR #${prNumber}`);
      return;
    }

    console.log(`📦 Found ${prArtifacts.length} artifact(s) to delete:`);
    prArtifacts.forEach(artifact => {
      console.log(`  - ${artifact.name} (${(artifact.size_in_bytes / 1024 / 1024).toFixed(2)} MB)`);
    });

    // Delete each artifact
    let deletedCount = 0;
    let failedCount = 0;

    for (const artifact of prArtifacts) {
      try {
        await github.rest.actions.deleteArtifact({
          owner: context.repo.owner,
          repo: context.repo.repo,
          artifact_id: artifact.id
        });
        console.log(`✅ Deleted: ${artifact.name}`);
        deletedCount++;
      } catch (error) {
        console.error(`❌ Failed to delete ${artifact.name}:`, error.message);
        failedCount++;
      }
    }

    // Summary
    const totalSize = prArtifacts.reduce((sum, a) => sum + a.size_in_bytes, 0);
    const totalSizeMB = (totalSize / 1024 / 1024).toFixed(2);

    console.log('');
    console.log('📊 Cleanup Summary:');
    console.log(`  - Deleted: ${deletedCount} artifact(s)`);
    console.log(`  - Failed: ${failedCount} artifact(s)`);
    console.log(`  - Storage freed: ~${totalSizeMB} MB`);
    console.log('');
    console.log(`✅ Artifact cleanup complete for PR #${prNumber}`);

    if (failedCount > 0) {
      core.setFailed(`Failed to delete ${failedCount} artifact(s)`);
    }
  } catch (error) {
    console.error('❌ Error during artifact cleanup:', error);
    core.setFailed(error.message);
  }
};
