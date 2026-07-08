---
name: stadata
description: Load when working on the stadata_flutter_sdk repository. Covers Flutter/Dart tooling, clean architecture conventions, git flow, dependabot handling, release process, and common mistakes to avoid.
---

# Stadata Flutter SDK — Repo Skill

Load this skill at the start of every session in this repo. It prevents the most common agent errors.

---

## 1. Tooling — Always Use These

### After any Dart/Flutter file change
```bash
melos format        # dart format on all packages
melos fix           # dart fix --apply on all packages
melos analyze       # check for lint errors
```

### Generating code (routes, injectable, etc.)
```bash
cd app/example
flutter pub run build_runner build --delete-conflicting-outputs
```

### Regenerating slang translations (i18n)
**CRITICAL:** `build_runner` alone does NOT regenerate `strings_en.g.dart` / `strings_id.g.dart`.
You must run:
```bash
cd app/example
dart run slang
```
Always run this after editing any file in `app/example/lib/translations/*.i18n.json`.
Failure to do so causes APK build failures with "getter not defined" errors.

### Running tests
```bash
melos test                    # all packages
cd packages/stadata_flutter_sdk && flutter test   # SDK only
```

Coverage must stay above **80%**. When adding a new feature, add tests for:
- model `fromJson` / `toJson` / `copyWith`
- use case call paths (success + failure)
- repository impl (success + failure)
- remote data source (success + failure)

---

## 2. Clean Architecture — Feature Structure

Every feature lives at `packages/stadata_flutter_sdk/lib/src/features/{feature}/` and follows:

```
{feature}/
├── domain/
│   ├── entities/         # Pure Dart classes extending BaseEntity
│   ├── repositories/     # Abstract interfaces
│   └── usecases/         # Single-method use cases with Param class
├── data/
│   ├── datasources/      # Remote data source interface + impl
│   ├── models/           # JSON models extending entity
│   └── repositories/     # Repository impl
└── injector/             # DI setup
```

### Parameter rules
- Single field → use the field type directly
- Multiple fields → create a `{Feature}Param` class extending `BaseEntity`

### Typed enums over primitives
Use enums for constrained values (e.g., `SdgGoalNumber` instead of `int goal`). Pass `.value` to the API query.

### Exports
- Each layer has a barrel `{layer}.dart`
- New features must be exported in `lib/src/features/features.dart`
- Public API types must be added to `lib/stadata_flutter_sdk.dart` show list

### Import style
Always use full package paths — never relative imports:
```dart
// ✅
import 'package:stadata_flutter_sdk/src/features/features.dart';
// ❌
import '../../features/features.dart';
```

---

## 3. Git Flow — Branch & PR Rules

| Branch type | From | PR target |
|------------|------|-----------|
| `feature/*` | develop | develop |
| `fix/*` | develop | develop |
| `docs/*` | develop | develop |
| `release/*` | develop | main |
| `hotfix/*` | main | main + develop |

**Never push directly to `main` or `develop`.** Always open a PR.

After merging to main: back-merge main → develop via PR.

### Commit style (conventional commits, no attribution)
```
feat(list): add glossary endpoint
fix(test): use raw string for dollar sign
chore(release): update changelog for 1.2.0
ci: regenerate slang translations before build_runner
```

---

## 4. Dependabot PRs — Known False Failures

Dependabot PRs in this repo always show `auto-merge` and `notify` as **FAILED**. This is a CI config issue (auto-merge disabled on the repo) — **not a real failure**. Check that all other jobs pass, then merge with:

```bash
gh pr merge <number> --squash --delete-branch --admin
```

### Merge conflicts between dependabot PRs
When multiple dependabot PRs touch `app/example/pubspec.yaml` or `pubspec.lock`, later ones conflict. Resolution pattern:
1. Create a `fix/{package}-bump` branch from `main`
2. Apply only the version bump that PR intended, keeping all other versions already on `main`
3. Open PR, merge, close the stale dependabot PR with a comment

---

## 5. Release Process

```bash
# 1. Create release branch
git checkout develop && git checkout -b release/X.Y.Z

# 2. Generate changelog
./scripts/generate-changelog.sh --version X.Y.Z --update-main
rm -f CHANGELOG_NEW.md CHANGELOG_BACKUP.md
git add CHANGELOG.md && git commit -m "chore(release): update changelog for X.Y.Z"

# 3. PR release/X.Y.Z → main, merge with --merge (not squash)
# 4. Tag on main
git tag -a X.Y.Z origin/main -m "Release X.Y.Z"
git push origin X.Y.Z

# 5. GitHub release
gh release create X.Y.Z --title "vX.Y.Z" --notes "..." --target main

# 6. Docs snapshot
cd docs && npm run docusaurus -- docs:version X.Y.Z
# Update docusaurus.config.js: lastVersion → X.Y.Z, add X.Y.Z entry, move previous to versioned path
# Commit, PR to develop, then PR to main

# 7. Back-merge main → develop
git checkout -b chore/back-merge-main-to-develop origin/develop
git merge origin/main --no-ff -m "chore: back-merge main into develop"
# PR to develop
```

---

## 6. Example App Patterns

Located at `app/example/`. Uses GetX + BLoC (Cubit).

### Cubit pattern for paginated list features
```dart
@injectable
class FeatureResultsCubit extends BaseCubit<BaseState> {
  // ...
  int get page => _currentPage;
  set page(int value) {
    final page = value;   // non-trivial body avoids unnecessary_getters_setters lint
    _currentPage = page;
  }

  void nextPage() {
    page = _currentPage + 1;
    unawaited(loadData());   // import 'dart:async' for unawaited
  }
}
```

### Translation keys
After adding a feature screen, add keys to BOTH:
- `app/example/lib/translations/en.i18n.json`
- `app/example/lib/translations/id.i18n.json`

Then run `dart run slang` to regenerate.

### Route registration
Add `@RoutePage()` to page classes and register in `app/example/lib/core/navigation/app_router.dart`, then regenerate:
```bash
cd app/example && flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 7. Lint Rules to Watch (very_good_analysis)

| Lint | Fix |
|------|-----|
| `discarded_futures` | Wrap void async calls in `unawaited()` |
| `use_raw_strings` | Use `r'...$...'` for strings with `$` |
| `sort_pub_dependencies` | Keep pubspec deps alphabetical |
| `unnecessary_getters_setters` | Give setter a non-trivial body (see cubit pattern above) |
| `use_setters_to_change_properties` | Use `set foo(T value)` instead of `void setFoo(T v)` |

---

## 8. CI Workflow Notes

- **APK build**: Runs on PRs to develop. Must pass before merging feature branches.
- **Coverage**: Checked on every PR. Must stay ≥ 80%.
- **Slang regeneration**: The workflow runs `dart run slang` before `build_runner` to avoid stale cache issues.
- **Cache**: build_runner cache uses restore-keys fallback — stale `*.g.dart` may be restored. `dart run slang` step mitigates this for translation files.
