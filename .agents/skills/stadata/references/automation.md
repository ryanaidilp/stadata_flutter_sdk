# CI/CD Automation Reference

Read this before any release, publish, docs-deploy, or dependabot task. The point of this file: **most of it is automated — trigger the pipeline, don't hand-roll it.**

## Workflow inventory (`.github/workflows/`)

| File | Trigger | What it does |
|---|---|---|
| `main.yaml` (ci) | PR/push to main·develop | change-detection → semantic-PR check, spell-check, build+analyze+test+coverage(≥80%), PR coverage & summary comments |
| `pr-apk-build.yml` | PR to develop | builds example APK; runs `dart run slang` before build_runner to avoid stale i18n part files |
| `release.yml` | push to `release/**`·`hotfix/**`, or PR-closed to main | reusable `banua-coder/banua-coder-workflow` — version bump (`version-files: pubspec.yaml,packages/stadata_flutter_sdk/pubspec.yaml`), keepachangelog, tag, backport (`auto-merge-backport: false`) |
| `generate-changelog.yml` | push to `release/**`, or manual dispatch | generates changelog from conventional commits, syncs to package CHANGELOG/README, opens a PR into the release branch |
| `publish.yml` | push tag `X.Y.Z` | publishes `packages/stadata_flutter_sdk` to pub.dev via OIDC (`dart-lang/setup-dart`) |
| `create-release-with-apk.yml` | after "Publish to pub.dev" succeeds | builds example APK, regenerates changelog, creates GitHub Release `📦 STADATA Flutter SDK vX.Y.Z` with APK attached |
| `check-pubdev-and-notify.yml` / `notify-discord-release.yml` / `notify-discord-pr.yml` | publish/PR events | Discord notifications |
| `deploy-docs.yml` | push to `main` | builds Docusaurus and deploys to GitHub Pages |
| `test-deploy-docs.yml` | PR touching docs | test docs build |
| `dependabot-auto-merge.yml` | dependabot PR opened/sync | auto-merge minor/patch (currently broken — repo auto-merge disabled), label majors |
| `housekeeping.yml` | PR closed to main·develop | delete merged branches |
| `codecov.yaml` | — | coverage upload |
| `cleanup-pr-artifacts.yml` | PR closed | remove PR build artifacts |

## The release chain (what actually happens)

```
push release/X.Y.Z
   ├─ generate-changelog.yml → PR with changelog into release/X.Y.Z
   └─ release.yml (reusable) → bump version files, merge, tag X.Y.Z, open backport PR to develop
          └─ tag X.Y.Z pushed
                └─ publish.yml → pub.dev publish
                      └─ create-release-with-apk.yml → GitHub Release + APK
```

### Agent's actual release checklist
1. Confirm `develop` is green and holds everything for the release.
2. `git checkout develop && git pull`
3. Create and push the release branch: `git checkout -b release/X.Y.Z && git push -u origin release/X.Y.Z`
4. **Let the automation run.** Review/merge the changelog PR it opens into the release branch if human sign-off is wanted.
5. Ensure the release branch merges to `main` (the reusable workflow drives this; follow its PR).
6. **Docs snapshot (only manual step):**
   ```bash
   cd docs && npm run docusaurus -- docs:version X.Y.Z
   # edit docusaurus.config.js: lastVersion → X.Y.Z, add entry, move previous version to its own path
   ```
   Land the snapshot on `main` (via develop → main) so `deploy-docs.yml` publishes it.
7. Back-merge `main → develop` via PR (backport is not auto-merged).

### Do NOT, during a release
- `git tag X.Y.Z` yourself
- `gh release create`
- `dart pub publish`
- edit `version:` in either pubspec
- run `scripts/generate-changelog.sh`

All of the above are done by the pipeline. Manual duplication is what produced the off-format `v1.2.0` release instead of `📦 STADATA Flutter SDK v1.2.0`.

## Known rough edges
- **Dependabot auto-merge is broken:** the workflow uses `gh pr merge --auto`, but repo auto-merge is disabled → job fails (`enablePullRequestAutoMerge`); the `notify` job goes red too. Both are false failures. Merge minor/patch manually with `gh pr merge <n> --squash --delete-branch --admin`. Durable fix: enable auto-merge in repo settings.
- **`create-release-with-apk.yml` picks "latest tag":** a non-semver tag (e.g. the old `docs-version-1.1.0`) can trigger a junk release. Only push semver tags — and only via the release flow.
- **build_runner cache can restore stale `*.g.dart`:** slang part files are the usual victim; the `dart run slang` step before build_runner mitigates it.
