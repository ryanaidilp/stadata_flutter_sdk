# Changelog Archive

Historical changelog entries moved out of `CHANGELOG.md` on 2026-09-05 because the
combined file exceeded pub.dev's 262144-byte limit on `CHANGELOG.md` content, which
blocked publishing v2.1.0. This content is duplicated (and, in places, itself
duplicated further) legacy output from earlier changelog-generation tooling used
before the current automated release pipeline. It is preserved here verbatim for
historical reference; it is not shipped as part of the published package.

---

# Changelog
## [2.1.0] - 2026-09-05

### 📚 Documentation

- docs(skill): capture verified release automation behavior and new rough edges (da888363)
- docs(changelog): update for version 2.1.0 (#304) (9620d562)

### 🏗️ Build

- build(deps): bump actions/setup-java from 5 to 6 (#298) (c25c7f14)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#299) (64e4951c)
- build(deps): bump html from 0.15.6 to 0.15.7 (#300) (74e1e8da)
- build(deps): bump melos from 8.3.0 to 8.6.0 (#301) (aa695036)
- build(deps): bump flutter_widget_from_html from 0.17.2 to 0.17.3 (#302) (edfcb418)
- build(deps): bump fast-uri from 3.1.5 to 3.1.7 in /docs (#303) (25ff92ec)

### 🔧 Chores

-  add pubignore to cspell dictionary (bcb52d04)
-  bump version to 2.1.0 for next development cycle (#296) (9ab7b654)
-  merge develop into back-merge branch, keep next-dev-cycle version 2.1.0 (58a7398a)
-  back-merge main into develop (4b7f481d)

### 📝 Other Changes

- Merge pull request #297 from ryanaidilp/chore/back-merge-2.0.0 (a7dc27b7)
- Merge pull request #305 from ryanaidilp/release/2.1.0 (e4b2e366)

## [2.0.0] - 2026-08-18

### ⚠️ BREAKING CHANGES

- feat(sdk)!: migrate entities/models to Dart 3.13 primary constructors (#281) (9c9e5f3d)

### ✨ Features

- feat(docs): fill content gaps and improve test coverage to 83% (edfaa368)
- feat(list): implement glosarium (glossary) feature (7f99fe9a)
- feat(list): implement SDGs (Sustainable Development Goals) feature (#234) (a1fe1bfb)

### 🐛 Bug Fixes

- fix(docs): revert premature 1.2.0 snapshot, restore 1.1.0 as latest (56e1d81a)
- fix(docs): harden transitive npm deps against known CVEs (#280) (daed09ea)
- fix(ci): pin develop to Flutter 3.44.9 to unblock CI (#283) (0bc9a499)
- fix(ci): clear slang-generated outputs before build_runner runs (#282) (073bf565)
- fix(example): use theme-aware colors for parameters panel across all features (#291) (a69078ca)

### 📚 Documentation

-  add version 1.1.0 snapshot and fix deployment workflow (f7bba019)
-  release version 1.2.0 snapshot (89e087f8)
-  update changelog for 1.2.0 (afbfe7f8)
-  copy changelog to package directories (90424a94)
-  release version 1.2.0 snapshot (#241) (ba341e58)
-  release version 1.2.0 snapshot (#241) (#242) (e15952ba)
- docs(skill): rewrite stadata skill to reflect CI/CD automation and docs requirement (#260) (096322f4)
-  fix inaccurate and outdated documentation across README/docs/CLAUDE.md (#284) (89fb2284)
- docs(changelog): update for version 2.0.0 (#294) (16955b60)

### 🏗️ Build

- build(deps): bump injectable_generator from 3.0.2 to 3.1.0 (#235) (91546323)
- build(deps): bump build_runner from 2.13.1 to 2.15.0 (#236) (4591b25f)
- build(deps): bump melos from 7.5.1 to 7.8.2 (#238) (a52654b2)
- build(deps): bump auto_route_generator from 10.5.0 to 10.6.0 (#239) (6d574ca9)
- build(deps): bump actions/checkout from 6 to 7 (#243) (63036341)
- build(deps): bump very_good_analysis from 10.2.0 to 10.3.0 (#244) (5e64b1dd)
- build(deps): bump http-proxy-middleware from 2.0.9 to 2.0.10 in /docs (#245) (e856e988)
- build(deps): bump webpack-dev-server from 5.2.4 to 5.2.5 in /docs (#246) (d8bbaa18)
- build(deps): bump actions/cache from 5 to 6 (#247) (04d9631b)
- build(deps): bump envied_generator from 1.3.5 to 1.3.6 (#248) (692b891f)
- build(deps): bump melos from 7.8.2 to 8.0.0 (#249) (a37f6319)
- build(deps): bump envied from 1.3.5 to 1.3.6 (#250) (ebaa7b3b)
- build(deps): bump envied_generator from 1.3.6 to 1.3.7 (#251) (d9958122)
- build(deps): bump envied from 1.3.6 to 1.3.7 (#252) (af197027)
- build(deps): bump slang_build_runner from 4.16.0 to 4.17.0 (#253) (460a158c)
- build(deps): bump slang from 4.16.0 to 4.17.0 (#254) (c912ac62)
- build(deps): bump slang_flutter from 4.14.0 to 4.17.0 (#256) (729c3e14)
- build(deps): upgrade root workspace dependencies to latest versions (#259) (df4c2ddb)
- build(deps): upgrade example app dependencies to latest versions (#261) (087eab99)
- build(deps): bump nanoid from 3.3.12 to 3.3.18 in /docs (#279) (aa2daabf)
- build(deps): bump brace-expansion from 1.1.15 to 1.1.18 in /docs (#278) (4e1c7095)
- build(deps): bump fast-uri from 3.1.2 to 3.1.5 in /docs (#277) (895fd013)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#276) (1384e8e3)
- build(deps): bump body-parser from 1.20.4 to 1.20.6 in /docs (#274) (7f3eba55)
- build(deps): bump webpack-dev-server from 5.2.5 to 5.2.6 in /docs (#273) (1a773762)
- build(deps): bump svgo from 3.3.3 to 3.3.4 in /docs (#270) (7a40e691)
- build(deps): bump actions/setup-python from 6 to 7 (#269) (b8ad8fec)
- build(deps): bump websocket-driver from 0.7.4 to 0.7.5 in /docs (#268) (31418c6a)
- build(deps): bump actions/setup-node from 6 to 7 (#267) (54256805)
- build(deps): bump envied from 1.3.7 to 1.3.8 (#266) (ebb32324)
- build(deps): bump melos from 8.0.0 to 8.2.0 (#265) (0581aa46)
- build(deps): bump envied_generator from 1.3.7 to 1.3.8 (#264) (bab03cd8)
- build(deps): bump slang from 4.17.0 to 4.18.0 (#263) (c171d44c)
- build(deps): bump postcss from 8.5.15 to 8.5.26 in /docs (#275) (d3a098f8)
- build(deps): bump slang_flutter from 4.18.0 to 4.19.0 (#262) (b74738a2)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#285) (496ac772)
- build(deps): bump easy_stepper from 1.1.0 to 1.2.0 (#286) (4e960bd4)
- build(deps): bump extended_image from 10.0.1 to 10.1.0 (#287) (12461757)
- build(deps): bump injectable_generator from 3.1.0 to 3.1.3 (#289) (d1d29013)
- build(deps): bump webview_flutter from 4.14.0 to 4.14.1 (#290) (f10b3313)
- build(deps): bump equatable from 2.0.8 to 2.1.0 (#288) (f946e50c)
- build(deps): bump melos from 8.2.0 to 8.3.0 (#292) (4382edc6)
- build(deps): bump build_runner from 2.15.0 to 2.16.0 (#293) (0e9d535a)

### 🔧 Chores

-  bump version to 1.2.0 for next development cycle (618c59bf)
-  back-merge 1.1.0 to develop (05b6a6ed)
-  bump version to 1.2.0 (b38c839b)
-  back-merge main into develop (58068c97)
-  back-merge main into develop (611c785d)
- chore(release): update changelog for 1.2.0 (d208d778)
-  back-merge 1.2.0 to develop (e9527c4e)
-  back-merge main into develop (#257) (47bf7745)
-  add stadata repo skill and pubignore for SDK package (#258) (ba3eacc6)
-  back-merge main into develop (b3c62e60)
-  regenerate injectable config after dependency back-merge (8afee999)
-  back-merge main into develop (9cf3fc0c)
-  back-merge main into develop (5d5fa901)
-  bump version to 2.0.0 (2f3d6922)
-  add pubignore to cspell dictionary (7af1c6dd)

### 📝 Other Changes

- Merge pull request #230 from ryanaidilp/feat/docs-and-coverage-improvements (fffd1f5d)
- Merge pull request #231 from ryanaidilp/docs/release-1.2.0 (fc546579)
- Merge pull request #232 from ryanaidilp/fix/docs-versioning-revert-1.2.0 (84a944e1)
- Merge pull request #233 from ryanaidilp/feat/glossary-feature (f4a8ec19)
- Merge pull request #240 from ryanaidilp/release/1.2.0 (750ffd04)
- Merge pull request #295 from ryanaidilp/release/2.0.0 (711450a1)

## [1.2.0] - 2026-06-17

### ✨ Features

- feat(docs): fill content gaps and improve test coverage to 83% (edfaa368)
- feat(list): implement glosarium (glossary) feature (7f99fe9a)
- feat(list): implement SDGs (Sustainable Development Goals) feature (#234) (a1fe1bfb)

### 🐛 Bug Fixes

- fix(docs): revert premature 1.2.0 snapshot, restore 1.1.0 as latest (56e1d81a)

### 📚 Documentation

-  add version 1.1.0 snapshot and fix deployment workflow (f7bba019)
-  release version 1.2.0 snapshot (89e087f8)

### 🏗️ Build

- build(deps): bump injectable_generator from 3.0.2 to 3.1.0 (#235) (91546323)
- build(deps): bump build_runner from 2.13.1 to 2.15.0 (#236) (4591b25f)
- build(deps): bump melos from 7.5.1 to 7.8.2 (#238) (a52654b2)
- build(deps): bump auto_route_generator from 10.5.0 to 10.6.0 (#239) (6d574ca9)

### 🔧 Chores

-  bump version to 1.2.0 for next development cycle (618c59bf)
-  back-merge 1.1.0 to develop (05b6a6ed)
-  bump version to 1.2.0 (b38c839b)
-  back-merge main into develop (58068c97)
-  back-merge main into develop (611c785d)
- chore(release): update changelog for 1.2.0 (d208d778)

### 📝 Other Changes

- Merge pull request #230 from ryanaidilp/feat/docs-and-coverage-improvements (fffd1f5d)
- Merge pull request #231 from ryanaidilp/docs/release-1.2.0 (fc546579)
- Merge pull request #232 from ryanaidilp/fix/docs-versioning-revert-1.2.0 (84a944e1)
- Merge pull request #233 from ryanaidilp/feat/glossary-feature (f4a8ec19)
- Merge pull request #240 from ryanaidilp/release/1.2.0 (750ffd04)

## [docs-version-1.1.0] - 2026-06-16

### 📚 Documentation

-  update version snapshot to 1.1.0 (ba22cdb4)

### 🏗️ Build

- build(deps): bump actions/upload-artifact from 6 to 7 (#214) (7806a5d9)
- build(deps): bump actions/download-artifact from 6 to 8 (#215) (8c1a88a6)
- build(deps): bump dependabot/fetch-metadata from 2 to 3 (#216) (e2a9893a)
- build(deps): bump injectable and injectable_generator (#217) (e8c2dd95)
- build(deps): bump slang from 4.14.0 to 4.16.0 (#218) (1d0662fc)
- build(deps): bump envied_generator from 1.3.4 to 1.3.5 (#219) (3cd4ebe0)
- build(deps): bump webview_flutter from 4.13.1 to 4.14.0 (#220) (d4b40616)
- build(deps): bump easy_stepper from 1.0.1 to 1.1.0 (#221) (02f97bba)

## [1.1.0] - 2026-06-16

### ✨ Features

- feat(constant): create query param constant & injector constant (b5d8e283)
- feat([ANDROID] example): update example app android to kotlin dsl (ddc9a1ee)
- feat(CENSUS): integrating census data endpoint (#96) (4eb7746e)
- feat(publications): implement complete publications feature with List and View API (a041ad76)
- feat(core): update dependency injection and routing for publications (7f3e4e95)
- feat(home): add publications feature to main navigation (791151bf)
- feat(i18n): add bilingual support for publications feature (d2d6ef3f)
- feat(example): implement complete press releases showcase (083a41de)
- feat(example): implement press release detail page with HTML rendering (43671d38)
- feat(example): implement subjects and subject categories showcase page (8447853c)
- feat(example): implement subject categories showcase page (65baeb76)
- feat(strategic-indicators): add complete showcase implementation (1f6f7ce1)
- feat(statistical-classifications): add complete KBLI showcase implementation (c1b08dc1)
- feat(statistical-classifications): add number paginator for better pagination UX (b1873465)
-  implement NumberPaginator across all showcase pages (24ee2944)
- feat(domain): add global domain validator and default value (3add398f)
- feat(census-events): add census events showcase with proper pluralization (be870ef3)
- feat(home): sort showcase items alphabetically by translated title (77142322)
- feat(census-topics): add census topics showcase with dynamic event selection (597caa9a)
- feat(census-datasets): add census datasets showcase with cascading dropdowns (4f5bc861)
- feat(census-data): add census data showcase with 4-level cascading dropdowns (8888e290)
- feat(census-areas): add census areas showcase with cascading dropdown (7220d0c5)
- feat(variables): implement variables showcase with pagination (08f36571)
- feat(variables): add variables entry point to home page (9fd2b98d)
- feat(variables): add optional parameters with subject dropdown (318e6ec9)
- feat(variables): implement paginated subject dropdown and fix parameter passing (245c3ff7)
- feat(vertical-variables): add vertical variables showcase page (d0193920)
- feat(units): add units showcase page with variable dropdown (b3f5c366)
- feat(static-tables): add static tables showcase with HTML rendering (dc51d17c)
- feat(static-tables): add landscape fullscreen mode for table viewing (638a0a1c)
- feat(static-tables): add sticky table header for better navigation (d1a1409e)
- feat(static-tables): apply all_stats CSS styling to table display (1d755cdd)
- feat(example): enable Alice HTTP inspector in release builds (76aefc21)
- feat(ci): add comprehensive APK size analysis with SDK contribution tracking (7bd41d80)
- feat(ci): enhance CI workflow with smart change detection and reporting (89742dd7)
- feat(ci): adjust APK size threshold to 50KB and auto-create labels (c8f80218)
- feat(ci): add develop APK caching for faster PR size comparisons (57ff95b0)
- feat(ci): add file-level SDK size change tracking (1f0abb91)
- feat(ci): restore codecov workflow with cleaned coverage upload (881ef24f)
- feat(ci): add coverage report generator for PRs (440cc322)
- feat(ci): add APK size analysis report to PR comments (8e469946)
- feat(ci): auto-cleanup PR artifacts after merge (e05a226e)
- feat(example): implement dynamic height webview for static tables (f10fcdf9)
- feat(publications): add support for related publications (fe4ca75f)
- feat(example): add UI to display related publications (e2cb28ec)
- feat(publications): add support for related publications (#143) (3828ef29)
- feat(periods): implement Period feature with complete clean architecture (09147516)
-  add periods, derived periods, and derived variables features (e2c31040)
-  integrate periods and derived data features into public API (9fde87c1)
- feat(example): add showcase implementations for periods and derived data (c5db4b06)
- feat(example): add navigation and localization for new features (8b122ce8)
- feat(example): add statistical classification detail page (1a7383e3)
- feat(ci): add smart test execution and detailed size analysis (9270dfcd)
- feat(example): enhance KBLI/KBKI detail page with rich metadata display (d06c7af4)
- feat(example): add expandable description and filter duplicate in derived classifications (c3b1fd92)
- feat(example): improve derived classifications UX (ad96696c)
-  implement periods and derived data features for dynamic tables (#144) (ddb784af)
- feat(dynamic-tables): implement dynamic tables feature (#160) (3288865e)
- feat(ci): add release automation and housekeeping workflows (#168) (a13fc6de)
- feat(sdk): add KBLI 2025 support, Trade feature, and dependency updates (#211) (50e86d37)
- feat(view): add detail endpoints for 11 missing StadataView methods (5be2d09f)

### 🐛 Bug Fixes

- fix(comments): fix switched comment between detail and get method (3e5e5857)
- fix(errors): proper error handling for api call (b6b60e2e)
- fix(melos): upgrade to latest melos and update the configuration (#126) (946a738a)
- fix(example): add missing dependencies and press releases entry point (cbc1789e)
- fix(example): correct builder names in build.yaml (5c22051f)
- fix(example): explicitly disable problematic envied_generator:envied_generator builder (11e7b81b)
- fix(example): update injectable_generator include filter to scan all files (c47a1940)
- fix(strategic-indicators): resolve pagination issue with last page detection (bf82fcee)
- fix(network): handle empty response body with proper exception (57e17ea7)
- fix(statistical-classifications): sync NumberPaginator with current page state (badf2768)
- fix(census-topics): prevent horizontal overflow in census event dropdown (f32f4fbb)
- fix(census-topics): ensure dropdown is always visible during initial state (5ae2751c)
- fix(navigation): add missing census areas page imports to router (e89e421a)
- fix(variables): resolve subject loading and validation display issues (32e0fab4)
- fix(variables): add domain maxLength and subject loading debug (4a7d66e3)
-  remove immediate validation errors and set variables default domain (3d2dd354)
- fix(variables): display all optional parameters in results page (bd3dedf3)
- fix(variables): fix Show Existing Variables switch not rebuilding (554ada65)
- fix(static-tables): remove excess whitespace in table webview (30460cc8)
- fix(static-tables): optimize table display with smaller initial scale (a796ad1b)
- fix(core): change log.console from async to sync to fix analyzer issues (a1d7fd3f)
- fix(android): add required network permissions to AndroidManifest (f507df9b)
- fix(android): add Play Core dependency and ProGuard rules for R8 (d4b34db0)
- fix(ci): correct size analysis JSON location and add artifact upload (a36398b2)
- fix(ci): improve SDK size extraction from JSON with debug logging (9e89a43d)
- fix(ci): correctly parse Flutter size analysis JSON structure (bbf5824f)
- fix(ci): resolve Flutter size analysis snapshot.arm64-v8a.json error (704042f0)
- fix(ci): use proper Flutter --analyze-size according to docs (a45545c1)
- fix(ci): locate size analysis JSON in .flutter-devtools directory (d95fcffb)
- fix(ci): find latest size analysis JSON with any number (51ae0a5e)
- fix(ci): correct path to find_size_analysis_json.sh script (08995c61)
- fix(ci): preserve CI scripts when switching to base branch (97b2aa40)
- fix(example): add missing router imports to parameter pages (a317aa30)
- fix(periods): handle year field as string from API (3bcb80c9)
- fix(derived-variables): change groupID from String to int (2ba994d3)
- fix(derived-variables): handle nullable groupID and groupName (4b9ee2bb)
- fix(example): regenerate translation files with new feature keys (2a07c95f)
- fix(tests): fix test isolation issues to pass CI/CD pipeline (6e83f304)
- fix(example): integrate slang_build_runner with build_runner for CI/CD (cecc59a1)
- fix(ci): ensure clean working directory before base branch checkout (d745d043)
- fix(ci): clean generated files before branch checkout in base build (edaeda26)
- fix(ci): improve SDK size extraction with better debugging and fallback patterns (5b4b02ec)
- fix(ci): improve feature size extraction with fallback patterns and graceful error handling (678432f9)
- fix(ci): correct APK and size analysis artifact paths (b6e31141)
- fix(ci): generate size analysis report in root directory and add APK path debugging (65c2d461)
- fix(ci): enhance debugging and always show size comparison tables (d93d2d61)
- fix(ci): simplify artifact upload workflow (7c47870b)
- fix(ci): handle absolute paths for size analysis JSON (39fd53b4)
- fix(ci): correct feature extraction from JSON tree structure (4da46b7d)
- fix(ci): use consistent SDK size calculation for both metrics (d8e139e2)
-  reuse coverage artifact and add dependabot auto-merge (#187) (622de07b)
- fix(example): handle KBLIType.y2025 in exhaustive switch expressions (8777deb7)

### ⚡ Performance

- perf(census-data): optimize census area dropdown with searchable paginated dropdown (90b2d32b)
- perf(android): optimize APK size with code shrinking and ABI splits (3759e92d)

### ♻️ Refactoring

- refactor(di): use injector constant (c81680bb)
- refactor(api_endpoint): update api endpoint implementation (b25df200)
- refactor(color): use withValues (25447879)
- refactor(workflow): update discord notification workflow (#101) (dbc77b82)
-  update core app configuration for clean architecture (9345db21)
- refactor(example): remove dynamic tables and update dependencies (a4d6f96e)
- refactor(example): integrate Alice HTTP inspector and remove custom request panels (01629d90)
- refactor(example): update bundle identifiers and clean up code (76e632bd)
- refactor(example): extract hardcoded strings to localization files (a280fd96)
- refactor(strategic-indicators): replace variable ID text field with dropdown (c00bbafb)
- refactor(strategic-indicators): add searchable dropdown with pagination for variables (bda12dc9)
- refactor(strategic-indicators): use searchable_paginated_dropdown package (d7c38080)
- refactor(statistical-classifications): remove unused StadataFlutter dependency from parameters cubit (78f2dc8d)
- refactor(statistical-classifications): support both KBLI and KBKI in unified showcase (93567869)
- refactor(census-topics): align parameters panel design with other showcases (21f572d0)
- refactor(census-topics): remove unsupported language parameter and improve UX (e9205aa3)
- refactor(census-data): make census area parameter optional (11d26ed2)
-  fix page structure and auto-loading behavior (256c1e53)
- refactor(variables): replace pagination controls with NumberPaginator (28eee909)
- refactor(variables): extract parameters form into separate page (ed955bc5)
- refactor(vertical-variables): replace variable ID input with searchable dropdown (d03b7110)
- refactor(static-tables): preserve inline CSS styles in HTML table rendering (50b0d7d0)
- refactor(static-tables): replace HtmlWidget with WebView for better HTML rendering (cec79a03)
- refactor(static-tables): remove app bar in fullscreen for maximum space (c13544c5)
- refactor(ci): remove duplicate code coverage workflow (d164191b)
- refactor(ci): separate coverage workflows to avoid duplicate test runs (8b9a1746)
- refactor(ci): extract long inline scripts to separate files (acf4bb29)
- refactor(ci): extract GitHub Actions scripts to reusable files (f8367fad)
- refactor(ci): extract complete build logic to reusable scripts (990eb863)

### 📚 Documentation

- docs(README): update package readme (0d1a5c59)
-  update feature status with gap analysis findings (25f48522)

### 🧪 Tests

- test(data_source): fix test failed with variable data source (c58a84cf)
- test(publications): add comprehensive tests for related publications (54552a4a)

### 🏗️ Build

- build(deps): bump codecov/codecov-action from 4 to 5 (#82) (f932a180)
- build(deps): bump codecov/codecov-action from 4 to 5 (#84) (2ef909e3)
- build(deps): bump actions/checkout from 4 to 6 (#163) (6fd5ae01)
- build(deps): bump actions/download-artifact from 4 to 7 (#164) (935ce8fa)
- build(deps): bump actions/github-script from 7 to 8 (#165) (927f57d2)
- build(deps): bump actions/upload-artifact from 4 to 6 (#166) (f3126b35)
- build(deps): bump actions/cache from 4 to 5 (#167) (74cf1619)
- build(deps): bump slang_flutter from 4.12.0 to 4.12.1 (#177) (45c37692)
- build(deps): bump very_good_analysis from 10.0.0 to 10.1.0 (#178) (52552b94)
- build(deps): bump slang_build_runner from 4.12.0 to 4.12.1 (#179) (bbf03075)
- build(deps): bump slang from 4.12.0 to 4.12.1 (#180) (a7432482)
- build(deps): bump build_runner from 2.10.5 to 2.11.0 (#181) (78fe05f2)
- build(deps): bump qs from 6.14.1 to 6.14.2 in /docs (#182) (68ceee43)
- build(deps): bump actions/upload-artifact from 6 to 7 (#183) (0b65347e)
- build(deps): bump actions/download-artifact from 7 to 8 (#184) (8ae05c4d)
- build(deps): bump svgo from 3.3.2 to 3.3.3 in /docs (#185) (4dca2cb9)
- build(deps): bump mocktail from 1.0.4 to 1.0.5 (#197) (a828b261)
- build(deps): bump shared_preferences from 2.5.4 to 2.5.5 (#191) (bafd05e3)
- build(deps): bump melos from 7.5.0 to 7.5.1 (#193) (961c274a)
- build(deps): bump flutter_widget_from_html from 0.17.1 to 0.17.2 (#194) (b1b9cbb4)
- build(deps): bump lodash from 4.17.23 to 4.18.1 in /docs (#195) (924ba707)
- build(deps): bump actions/github-script from 8 to 9 (#196) (70b7e858)
- build(deps): bump softprops/action-gh-release from 2 to 3 (#198) (df7ba5b8)
- build(deps): bump follow-redirects from 1.15.11 to 1.16.0 in /docs (#199) (6b1af212)
- build(deps): bump animate_do from 4.2.0 to 5.1.0 (#200) (fdfbcc6f)
- build(deps): bump fast-uri from 3.1.0 to 3.1.2 in /docs (#201) (4a393ee2)
- build(deps): bump @babel/plugin-transform-modules-systemjs in /docs (#202) (57b2f382)
- build(deps): bump webpack-dev-server from 5.2.3 to 5.2.4 in /docs (#203) (876e72d9)
- build(deps): bump codecov/codecov-action from 5 to 7 (#204) (74a7693e)
- build(deps): bump shell-quote from 1.8.3 to 1.8.4 in /docs (#205) (46a88c5e)
- build(deps): bump joi from 17.13.3 to 17.13.4 in /docs (#206) (529cbea1)
- build(deps): bump brace-expansion from 1.1.12 to 1.1.15 in /docs (#208) (182317a4)
- build(deps): bump @babel/core from 7.29.0 to 7.29.7 in /docs (#209) (d07f4529)
- build(deps): bump postcss from 8.5.8 to 8.5.15 in /docs (#210) (5d00c619)
- build(deps): bump launch-editor from 2.13.2 to 2.14.1 in /docs (#207) (1508aba3)

### 👷 CI

-  add build_runner and .env setup to APK build workflows (dc4e1f82)
-  optimize GitHub Actions with comprehensive caching strategy (8693c844)

### 🔧 Chores

- chore(dependencies): upgrade dependencies (eecb543d)
- chore(doc): upgrade docs dependency constraint (398485be)
- chore(dependencies): run melos upgrade (bd010a6e)
- chore(pubs): add topics (d33640f2)
- chore(deps): update dependency constraints (1fe60d36)
- chore(deps): upgrade to sdk 3.7 (ae4c39db)
- chore(deps): update dependency (822a68f9)
-  back merge main to develop (26b5364e)
- chore(pub): run flutter pub get (9a0032a5)
- chore(pub): run pub upgrade (0c959a80)
- chore(pub): run melos upgrade (78f5fe7e)
- chore(example): update build.yaml to match current project structure (f62314f4)
- chore(example): update build config and dependencies (46f9a3cf)
-  update lockfiles after dependency changes (f313af2c)
-  regenerate translation files after adding statistical classifications (9ae7458b)
-  update injectable config (d1514e1b)
-  format code and update dependencies (0fac1a14)
-  back-merge 1.0.0 to develop (#172) (ad05d692)
-  bump version to 1.1.0 for next development cycle (#171) (71813f6c)
-  upgrade flutter dependencies (#188) (76ce7213)
- chore(deps): update docusaurus dependencies (#189) (5b8080ff)
- chore(release): prepare changelog for 1.1.0 (16cafbe5)
- chore(release): 1.1.0 (f16cee5b)

### 📝 Other Changes

- Merge branch 'main' into develop (4827b1fa)
- Merge branch 'main' into develop (bf51d03f)
- Merge branch 'main' into develop (f998b454)
- Merge branch 'main' into develop (38e53b7e)
- Merge branch 'main' into develop (7cd33982)
- Merge branch 'main' into develop (114b8f7a)
- debug(variables): add comprehensive logging for subject loading issue (0f9e833a)
- debug(variables): add logging to diagnose switch toggle issue (3d9561c4)
- Revert "refactor(static-tables): preserve inline CSS styles in HTML table rendering" (6809d12e)
- Revert "feat(static-tables): add sticky table header for better navigation" (6317c027)
- Merge pull request #139 from ryanaidilp/refactor/example-app (732650da)
- Merge remote-tracking branch 'origin/HEAD' into develop (e869efaa)
- Merge pull request #140 from ryanaidilp/feature/workflow-improvement (c2501f61)
- Merge branch 'main' into develop (04ded3e7)
- Merge pull request #142 from ryanaidilp/feature/table-webview-improvement (b1942c51)
- Merge remote-tracking branch 'origin/main' into develop (799c55e2)
- Merge pull request #190 from ryanaidilp/main (540e2d20)
- Merge remote-tracking branch 'origin/main' into release/1.1.0 (64c23635)

## [1.0.0] - 2026-02-08

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 📚 Documentation

-  update changelog for 1.0.0 (1969c940)
-  update changelog for 1.0.0 (9d111bcd)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)
- release: 1.0.0 (#174) (fbca6d0d)
- release: 1.0.0 (#176) (d4e055ed)

## [1.0.0] - 2026-02-08

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 📚 Documentation

-  update changelog for 1.0.0 (1969c940)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)
- release: 1.0.0 (#174) (fbca6d0d)

## [1.0.0] - 2026-02-06

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)


All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.6.3+15

> 2023-10-01

### Fixed

- **Fixed** crash causing by `Infographic` not handling null description case.

## 0.6.2+14

> 2023-10-01

### What's new?

- **Updated** documentation
- **Updated** minor ui changes in example app

### Fixed

- **Fixed** minor issue in `ListResult` class

## 0.6.1+13

> 2023-09-26

### What's new?

- **Fixed** `PressRelease` abstract property is nullable

## 0.6.0+12

> 2023-09-26

### What's New?

- **Added** subject category entity.
- **Added** subject category repository contract.
- **Added** use case to get all subject categories.
- **Added** subject category model.
- **Added** subject category remote data source.
- **Added** subject category repository implementation.
- **Added** subject category feature export.
- **Added** subject entity.
- **Added** subject repository contract.
- **Added** use case to get all subjects.
- **Added** subject model.
- **Added** subject remote data source.
- **Added** subject repository implementation.
- **Added** subject feature export.
- **Added** press release entity.
- **Added** press release repository.
- **Added** use cases to get list and detail of press releases.
- **Added** press release model.
- **Added** press release remote data source.
- **Added** press release repository implementation.
- **Added** press release feature export.
- **Added** example pages for subject, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
  ect, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
  k/commit/55dcc195ab2bc1eff61f8ec59e83aa923db17820))
- **DOCS**(changelog): update changelog. ([a1dd6fed](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/a1dd6fed31011c93aa7ab933de64ab3be9c34727))
- **DOCS**(readme): add coverage badge. ([7ef51eda](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7ef51eda73b2f6c79170b545f1d1e05eb13ea49c))
- **DOCS**(README): update readme. ([0610d39c](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0610d39c96758a4ad17e6d2e7e848497fbe745bc))
- **DOCS**(README): update readme. ([7414a11a](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/7414a11acf6a3c327eda7ccb749fc122cf8c9de1))
- **DOCS**(CONTRIBUTING): update contribution guide. ([14663972](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/1466397227ee4201778918929dc62e5001eed637))
- **DOCS**(changelog): update changelog. ([50d096f9](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/50d096f9dec574620511653f8ebd2766d6eea34e))
- **DOCS**(README): update documentation. ([d0e8de07](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d0e8de07ca938fbf32ba8c7bc28372cb50b77ad7))
- **DOCS**(README): fix typo on some words. ([d8acb05d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/d8acb05d168c70021fbac221a226377af5e73099))
- **DOCS**(readme): update documentation to refer to the official docs. ([5c72c358](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/5c72c358bc98b2162ad2c1e661278bae16a4256e))
- **DOCS**(changelog): update changelog. ([0844906b](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/0844906b52432f7f5f6074f5feeeba46489675cc))
- **DOCS**(README): update documentation. ([f5ae957d](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/f5ae957d4f094390d8858a5b45fdc72c3f44ad39))
- **DOCS**(changelog): add new changelog. ([c4a6fdcf](https://github.com/ryanaidilp/stadata_flutter_sdk/commit/c4a6fdcfaf7c8b322572e5b4bd9a865dbe3c76c4))

# Changelog
## [2.1.0] - 2026-09-05

### 📚 Documentation

- docs(skill): capture verified release automation behavior and new rough edges (da888363)
- docs(changelog): update for version 2.1.0 (#304) (9620d562)

### 🏗️ Build

- build(deps): bump actions/setup-java from 5 to 6 (#298) (c25c7f14)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#299) (64e4951c)
- build(deps): bump html from 0.15.6 to 0.15.7 (#300) (74e1e8da)
- build(deps): bump melos from 8.3.0 to 8.6.0 (#301) (aa695036)
- build(deps): bump flutter_widget_from_html from 0.17.2 to 0.17.3 (#302) (edfcb418)
- build(deps): bump fast-uri from 3.1.5 to 3.1.7 in /docs (#303) (25ff92ec)

### 🔧 Chores

-  add pubignore to cspell dictionary (bcb52d04)
-  bump version to 2.1.0 for next development cycle (#296) (9ab7b654)
-  merge develop into back-merge branch, keep next-dev-cycle version 2.1.0 (58a7398a)
-  back-merge main into develop (4b7f481d)

### 📝 Other Changes

- Merge pull request #297 from ryanaidilp/chore/back-merge-2.0.0 (a7dc27b7)
- Merge pull request #305 from ryanaidilp/release/2.1.0 (e4b2e366)

## [2.0.0] - 2026-08-18

### ⚠️ BREAKING CHANGES

- feat(sdk)!: migrate entities/models to Dart 3.13 primary constructors (#281) (9c9e5f3d)

### ✨ Features

- feat(docs): fill content gaps and improve test coverage to 83% (edfaa368)
- feat(list): implement glosarium (glossary) feature (7f99fe9a)
- feat(list): implement SDGs (Sustainable Development Goals) feature (#234) (a1fe1bfb)

### 🐛 Bug Fixes

- fix(docs): revert premature 1.2.0 snapshot, restore 1.1.0 as latest (56e1d81a)
- fix(docs): harden transitive npm deps against known CVEs (#280) (daed09ea)
- fix(ci): pin develop to Flutter 3.44.9 to unblock CI (#283) (0bc9a499)
- fix(ci): clear slang-generated outputs before build_runner runs (#282) (073bf565)
- fix(example): use theme-aware colors for parameters panel across all features (#291) (a69078ca)

### 📚 Documentation

-  add version 1.1.0 snapshot and fix deployment workflow (f7bba019)
-  release version 1.2.0 snapshot (89e087f8)
-  update changelog for 1.2.0 (afbfe7f8)
-  copy changelog to package directories (90424a94)
-  release version 1.2.0 snapshot (#241) (ba341e58)
-  release version 1.2.0 snapshot (#241) (#242) (e15952ba)
- docs(skill): rewrite stadata skill to reflect CI/CD automation and docs requirement (#260) (096322f4)
-  fix inaccurate and outdated documentation across README/docs/CLAUDE.md (#284) (89fb2284)
- docs(changelog): update for version 2.0.0 (#294) (16955b60)

### 🏗️ Build

- build(deps): bump injectable_generator from 3.0.2 to 3.1.0 (#235) (91546323)
- build(deps): bump build_runner from 2.13.1 to 2.15.0 (#236) (4591b25f)
- build(deps): bump melos from 7.5.1 to 7.8.2 (#238) (a52654b2)
- build(deps): bump auto_route_generator from 10.5.0 to 10.6.0 (#239) (6d574ca9)
- build(deps): bump actions/checkout from 6 to 7 (#243) (63036341)
- build(deps): bump very_good_analysis from 10.2.0 to 10.3.0 (#244) (5e64b1dd)
- build(deps): bump http-proxy-middleware from 2.0.9 to 2.0.10 in /docs (#245) (e856e988)
- build(deps): bump webpack-dev-server from 5.2.4 to 5.2.5 in /docs (#246) (d8bbaa18)
- build(deps): bump actions/cache from 5 to 6 (#247) (04d9631b)
- build(deps): bump envied_generator from 1.3.5 to 1.3.6 (#248) (692b891f)
- build(deps): bump melos from 7.8.2 to 8.0.0 (#249) (a37f6319)
- build(deps): bump envied from 1.3.5 to 1.3.6 (#250) (ebaa7b3b)
- build(deps): bump envied_generator from 1.3.6 to 1.3.7 (#251) (d9958122)
- build(deps): bump envied from 1.3.6 to 1.3.7 (#252) (af197027)
- build(deps): bump slang_build_runner from 4.16.0 to 4.17.0 (#253) (460a158c)
- build(deps): bump slang from 4.16.0 to 4.17.0 (#254) (c912ac62)
- build(deps): bump slang_flutter from 4.14.0 to 4.17.0 (#256) (729c3e14)
- build(deps): upgrade root workspace dependencies to latest versions (#259) (df4c2ddb)
- build(deps): upgrade example app dependencies to latest versions (#261) (087eab99)
- build(deps): bump nanoid from 3.3.12 to 3.3.18 in /docs (#279) (aa2daabf)
- build(deps): bump brace-expansion from 1.1.15 to 1.1.18 in /docs (#278) (4e1c7095)
- build(deps): bump fast-uri from 3.1.2 to 3.1.5 in /docs (#277) (895fd013)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#276) (1384e8e3)
- build(deps): bump body-parser from 1.20.4 to 1.20.6 in /docs (#274) (7f3eba55)
- build(deps): bump webpack-dev-server from 5.2.5 to 5.2.6 in /docs (#273) (1a773762)
- build(deps): bump svgo from 3.3.3 to 3.3.4 in /docs (#270) (7a40e691)
- build(deps): bump actions/setup-python from 6 to 7 (#269) (b8ad8fec)
- build(deps): bump websocket-driver from 0.7.4 to 0.7.5 in /docs (#268) (31418c6a)
- build(deps): bump actions/setup-node from 6 to 7 (#267) (54256805)
- build(deps): bump envied from 1.3.7 to 1.3.8 (#266) (ebb32324)
- build(deps): bump melos from 8.0.0 to 8.2.0 (#265) (0581aa46)
- build(deps): bump envied_generator from 1.3.7 to 1.3.8 (#264) (bab03cd8)
- build(deps): bump slang from 4.17.0 to 4.18.0 (#263) (c171d44c)
- build(deps): bump postcss from 8.5.15 to 8.5.26 in /docs (#275) (d3a098f8)
- build(deps): bump slang_flutter from 4.18.0 to 4.19.0 (#262) (b74738a2)
- build(deps): bump dart-lang/setup-dart/.github/workflows/publish.yml (#285) (496ac772)
- build(deps): bump easy_stepper from 1.1.0 to 1.2.0 (#286) (4e960bd4)
- build(deps): bump extended_image from 10.0.1 to 10.1.0 (#287) (12461757)
- build(deps): bump injectable_generator from 3.1.0 to 3.1.3 (#289) (d1d29013)
- build(deps): bump webview_flutter from 4.14.0 to 4.14.1 (#290) (f10b3313)
- build(deps): bump equatable from 2.0.8 to 2.1.0 (#288) (f946e50c)
- build(deps): bump melos from 8.2.0 to 8.3.0 (#292) (4382edc6)
- build(deps): bump build_runner from 2.15.0 to 2.16.0 (#293) (0e9d535a)

### 🔧 Chores

-  bump version to 1.2.0 for next development cycle (618c59bf)
-  back-merge 1.1.0 to develop (05b6a6ed)
-  bump version to 1.2.0 (b38c839b)
-  back-merge main into develop (58068c97)
-  back-merge main into develop (611c785d)
- chore(release): update changelog for 1.2.0 (d208d778)
-  back-merge 1.2.0 to develop (e9527c4e)
-  back-merge main into develop (#257) (47bf7745)
-  add stadata repo skill and pubignore for SDK package (#258) (ba3eacc6)
-  back-merge main into develop (b3c62e60)
-  regenerate injectable config after dependency back-merge (8afee999)
-  back-merge main into develop (9cf3fc0c)
-  back-merge main into develop (5d5fa901)
-  bump version to 2.0.0 (2f3d6922)
-  add pubignore to cspell dictionary (7af1c6dd)

### 📝 Other Changes

- Merge pull request #230 from ryanaidilp/feat/docs-and-coverage-improvements (fffd1f5d)
- Merge pull request #231 from ryanaidilp/docs/release-1.2.0 (fc546579)
- Merge pull request #232 from ryanaidilp/fix/docs-versioning-revert-1.2.0 (84a944e1)
- Merge pull request #233 from ryanaidilp/feat/glossary-feature (f4a8ec19)
- Merge pull request #240 from ryanaidilp/release/1.2.0 (750ffd04)
- Merge pull request #295 from ryanaidilp/release/2.0.0 (711450a1)

## [1.2.0] - 2026-06-17

### ✨ Features

- feat(docs): fill content gaps and improve test coverage to 83% (edfaa368)
- feat(list): implement glosarium (glossary) feature (7f99fe9a)
- feat(list): implement SDGs (Sustainable Development Goals) feature (#234) (a1fe1bfb)

### 🐛 Bug Fixes

- fix(docs): revert premature 1.2.0 snapshot, restore 1.1.0 as latest (56e1d81a)

### 📚 Documentation

-  add version 1.1.0 snapshot and fix deployment workflow (f7bba019)
-  release version 1.2.0 snapshot (89e087f8)

### 🏗️ Build

- build(deps): bump injectable_generator from 3.0.2 to 3.1.0 (#235) (91546323)
- build(deps): bump build_runner from 2.13.1 to 2.15.0 (#236) (4591b25f)
- build(deps): bump melos from 7.5.1 to 7.8.2 (#238) (a52654b2)
- build(deps): bump auto_route_generator from 10.5.0 to 10.6.0 (#239) (6d574ca9)

### 🔧 Chores

-  bump version to 1.2.0 for next development cycle (618c59bf)
-  back-merge 1.1.0 to develop (05b6a6ed)
-  bump version to 1.2.0 (b38c839b)
-  back-merge main into develop (58068c97)
-  back-merge main into develop (611c785d)
- chore(release): update changelog for 1.2.0 (d208d778)

### 📝 Other Changes

- Merge pull request #230 from ryanaidilp/feat/docs-and-coverage-improvements (fffd1f5d)
- Merge pull request #231 from ryanaidilp/docs/release-1.2.0 (fc546579)
- Merge pull request #232 from ryanaidilp/fix/docs-versioning-revert-1.2.0 (84a944e1)
- Merge pull request #233 from ryanaidilp/feat/glossary-feature (f4a8ec19)
- Merge pull request #240 from ryanaidilp/release/1.2.0 (750ffd04)

## [docs-version-1.1.0] - 2026-06-16

### 📚 Documentation

-  update version snapshot to 1.1.0 (ba22cdb4)

### 🏗️ Build

- build(deps): bump actions/upload-artifact from 6 to 7 (#214) (7806a5d9)
- build(deps): bump actions/download-artifact from 6 to 8 (#215) (8c1a88a6)
- build(deps): bump dependabot/fetch-metadata from 2 to 3 (#216) (e2a9893a)
- build(deps): bump injectable and injectable_generator (#217) (e8c2dd95)
- build(deps): bump slang from 4.14.0 to 4.16.0 (#218) (1d0662fc)
- build(deps): bump envied_generator from 1.3.4 to 1.3.5 (#219) (3cd4ebe0)
- build(deps): bump webview_flutter from 4.13.1 to 4.14.0 (#220) (d4b40616)
- build(deps): bump easy_stepper from 1.0.1 to 1.1.0 (#221) (02f97bba)

## [1.1.0] - 2026-06-16

### ✨ Features

- feat(constant): create query param constant & injector constant (b5d8e283)
- feat([ANDROID] example): update example app android to kotlin dsl (ddc9a1ee)
- feat(CENSUS): integrating census data endpoint (#96) (4eb7746e)
- feat(publications): implement complete publications feature with List and View API (a041ad76)
- feat(core): update dependency injection and routing for publications (7f3e4e95)
- feat(home): add publications feature to main navigation (791151bf)
- feat(i18n): add bilingual support for publications feature (d2d6ef3f)
- feat(example): implement complete press releases showcase (083a41de)
- feat(example): implement press release detail page with HTML rendering (43671d38)
- feat(example): implement subjects and subject categories showcase page (8447853c)
- feat(example): implement subject categories showcase page (65baeb76)
- feat(strategic-indicators): add complete showcase implementation (1f6f7ce1)
- feat(statistical-classifications): add complete KBLI showcase implementation (c1b08dc1)
- feat(statistical-classifications): add number paginator for better pagination UX (b1873465)
-  implement NumberPaginator across all showcase pages (24ee2944)
- feat(domain): add global domain validator and default value (3add398f)
- feat(census-events): add census events showcase with proper pluralization (be870ef3)
- feat(home): sort showcase items alphabetically by translated title (77142322)
- feat(census-topics): add census topics showcase with dynamic event selection (597caa9a)
- feat(census-datasets): add census datasets showcase with cascading dropdowns (4f5bc861)
- feat(census-data): add census data showcase with 4-level cascading dropdowns (8888e290)
- feat(census-areas): add census areas showcase with cascading dropdown (7220d0c5)
- feat(variables): implement variables showcase with pagination (08f36571)
- feat(variables): add variables entry point to home page (9fd2b98d)
- feat(variables): add optional parameters with subject dropdown (318e6ec9)
- feat(variables): implement paginated subject dropdown and fix parameter passing (245c3ff7)
- feat(vertical-variables): add vertical variables showcase page (d0193920)
- feat(units): add units showcase page with variable dropdown (b3f5c366)
- feat(static-tables): add static tables showcase with HTML rendering (dc51d17c)
- feat(static-tables): add landscape fullscreen mode for table viewing (638a0a1c)
- feat(static-tables): add sticky table header for better navigation (d1a1409e)
- feat(static-tables): apply all_stats CSS styling to table display (1d755cdd)
- feat(example): enable Alice HTTP inspector in release builds (76aefc21)
- feat(ci): add comprehensive APK size analysis with SDK contribution tracking (7bd41d80)
- feat(ci): enhance CI workflow with smart change detection and reporting (89742dd7)
- feat(ci): adjust APK size threshold to 50KB and auto-create labels (c8f80218)
- feat(ci): add develop APK caching for faster PR size comparisons (57ff95b0)
- feat(ci): add file-level SDK size change tracking (1f0abb91)
- feat(ci): restore codecov workflow with cleaned coverage upload (881ef24f)
- feat(ci): add coverage report generator for PRs (440cc322)
- feat(ci): add APK size analysis report to PR comments (8e469946)
- feat(ci): auto-cleanup PR artifacts after merge (e05a226e)
- feat(example): implement dynamic height webview for static tables (f10fcdf9)
- feat(publications): add support for related publications (fe4ca75f)
- feat(example): add UI to display related publications (e2cb28ec)
- feat(publications): add support for related publications (#143) (3828ef29)
- feat(periods): implement Period feature with complete clean architecture (09147516)
-  add periods, derived periods, and derived variables features (e2c31040)
-  integrate periods and derived data features into public API (9fde87c1)
- feat(example): add showcase implementations for periods and derived data (c5db4b06)
- feat(example): add navigation and localization for new features (8b122ce8)
- feat(example): add statistical classification detail page (1a7383e3)
- feat(ci): add smart test execution and detailed size analysis (9270dfcd)
- feat(example): enhance KBLI/KBKI detail page with rich metadata display (d06c7af4)
- feat(example): add expandable description and filter duplicate in derived classifications (c3b1fd92)
- feat(example): improve derived classifications UX (ad96696c)
-  implement periods and derived data features for dynamic tables (#144) (ddb784af)
- feat(dynamic-tables): implement dynamic tables feature (#160) (3288865e)
- feat(ci): add release automation and housekeeping workflows (#168) (a13fc6de)
- feat(sdk): add KBLI 2025 support, Trade feature, and dependency updates (#211) (50e86d37)
- feat(view): add detail endpoints for 11 missing StadataView methods (5be2d09f)

### 🐛 Bug Fixes

- fix(comments): fix switched comment between detail and get method (3e5e5857)
- fix(errors): proper error handling for api call (b6b60e2e)
- fix(melos): upgrade to latest melos and update the configuration (#126) (946a738a)
- fix(example): add missing dependencies and press releases entry point (cbc1789e)
- fix(example): correct builder names in build.yaml (5c22051f)
- fix(example): explicitly disable problematic envied_generator:envied_generator builder (11e7b81b)
- fix(example): update injectable_generator include filter to scan all files (c47a1940)
- fix(strategic-indicators): resolve pagination issue with last page detection (bf82fcee)
- fix(network): handle empty response body with proper exception (57e17ea7)
- fix(statistical-classifications): sync NumberPaginator with current page state (badf2768)
- fix(census-topics): prevent horizontal overflow in census event dropdown (f32f4fbb)
- fix(census-topics): ensure dropdown is always visible during initial state (5ae2751c)
- fix(navigation): add missing census areas page imports to router (e89e421a)
- fix(variables): resolve subject loading and validation display issues (32e0fab4)
- fix(variables): add domain maxLength and subject loading debug (4a7d66e3)
-  remove immediate validation errors and set variables default domain (3d2dd354)
- fix(variables): display all optional parameters in results page (bd3dedf3)
- fix(variables): fix Show Existing Variables switch not rebuilding (554ada65)
- fix(static-tables): remove excess whitespace in table webview (30460cc8)
- fix(static-tables): optimize table display with smaller initial scale (a796ad1b)
- fix(core): change log.console from async to sync to fix analyzer issues (a1d7fd3f)
- fix(android): add required network permissions to AndroidManifest (f507df9b)
- fix(android): add Play Core dependency and ProGuard rules for R8 (d4b34db0)
- fix(ci): correct size analysis JSON location and add artifact upload (a36398b2)
- fix(ci): improve SDK size extraction from JSON with debug logging (9e89a43d)
- fix(ci): correctly parse Flutter size analysis JSON structure (bbf5824f)
- fix(ci): resolve Flutter size analysis snapshot.arm64-v8a.json error (704042f0)
- fix(ci): use proper Flutter --analyze-size according to docs (a45545c1)
- fix(ci): locate size analysis JSON in .flutter-devtools directory (d95fcffb)
- fix(ci): find latest size analysis JSON with any number (51ae0a5e)
- fix(ci): correct path to find_size_analysis_json.sh script (08995c61)
- fix(ci): preserve CI scripts when switching to base branch (97b2aa40)
- fix(example): add missing router imports to parameter pages (a317aa30)
- fix(periods): handle year field as string from API (3bcb80c9)
- fix(derived-variables): change groupID from String to int (2ba994d3)
- fix(derived-variables): handle nullable groupID and groupName (4b9ee2bb)
- fix(example): regenerate translation files with new feature keys (2a07c95f)
- fix(tests): fix test isolation issues to pass CI/CD pipeline (6e83f304)
- fix(example): integrate slang_build_runner with build_runner for CI/CD (cecc59a1)
- fix(ci): ensure clean working directory before base branch checkout (d745d043)
- fix(ci): clean generated files before branch checkout in base build (edaeda26)
- fix(ci): improve SDK size extraction with better debugging and fallback patterns (5b4b02ec)
- fix(ci): improve feature size extraction with fallback patterns and graceful error handling (678432f9)
- fix(ci): correct APK and size analysis artifact paths (b6e31141)
- fix(ci): generate size analysis report in root directory and add APK path debugging (65c2d461)
- fix(ci): enhance debugging and always show size comparison tables (d93d2d61)
- fix(ci): simplify artifact upload workflow (7c47870b)
- fix(ci): handle absolute paths for size analysis JSON (39fd53b4)
- fix(ci): correct feature extraction from JSON tree structure (4da46b7d)
- fix(ci): use consistent SDK size calculation for both metrics (d8e139e2)
-  reuse coverage artifact and add dependabot auto-merge (#187) (622de07b)
- fix(example): handle KBLIType.y2025 in exhaustive switch expressions (8777deb7)

### ⚡ Performance

- perf(census-data): optimize census area dropdown with searchable paginated dropdown (90b2d32b)
- perf(android): optimize APK size with code shrinking and ABI splits (3759e92d)

### ♻️ Refactoring

- refactor(di): use injector constant (c81680bb)
- refactor(api_endpoint): update api endpoint implementation (b25df200)
- refactor(color): use withValues (25447879)
- refactor(workflow): update discord notification workflow (#101) (dbc77b82)
-  update core app configuration for clean architecture (9345db21)
- refactor(example): remove dynamic tables and update dependencies (a4d6f96e)
- refactor(example): integrate Alice HTTP inspector and remove custom request panels (01629d90)
- refactor(example): update bundle identifiers and clean up code (76e632bd)
- refactor(example): extract hardcoded strings to localization files (a280fd96)
- refactor(strategic-indicators): replace variable ID text field with dropdown (c00bbafb)
- refactor(strategic-indicators): add searchable dropdown with pagination for variables (bda12dc9)
- refactor(strategic-indicators): use searchable_paginated_dropdown package (d7c38080)
- refactor(statistical-classifications): remove unused StadataFlutter dependency from parameters cubit (78f2dc8d)
- refactor(statistical-classifications): support both KBLI and KBKI in unified showcase (93567869)
- refactor(census-topics): align parameters panel design with other showcases (21f572d0)
- refactor(census-topics): remove unsupported language parameter and improve UX (e9205aa3)
- refactor(census-data): make census area parameter optional (11d26ed2)
-  fix page structure and auto-loading behavior (256c1e53)
- refactor(variables): replace pagination controls with NumberPaginator (28eee909)
- refactor(variables): extract parameters form into separate page (ed955bc5)
- refactor(vertical-variables): replace variable ID input with searchable dropdown (d03b7110)
- refactor(static-tables): preserve inline CSS styles in HTML table rendering (50b0d7d0)
- refactor(static-tables): replace HtmlWidget with WebView for better HTML rendering (cec79a03)
- refactor(static-tables): remove app bar in fullscreen for maximum space (c13544c5)
- refactor(ci): remove duplicate code coverage workflow (d164191b)
- refactor(ci): separate coverage workflows to avoid duplicate test runs (8b9a1746)
- refactor(ci): extract long inline scripts to separate files (acf4bb29)
- refactor(ci): extract GitHub Actions scripts to reusable files (f8367fad)
- refactor(ci): extract complete build logic to reusable scripts (990eb863)

### 📚 Documentation

- docs(README): update package readme (0d1a5c59)
-  update feature status with gap analysis findings (25f48522)

### 🧪 Tests

- test(data_source): fix test failed with variable data source (c58a84cf)
- test(publications): add comprehensive tests for related publications (54552a4a)

### 🏗️ Build

- build(deps): bump codecov/codecov-action from 4 to 5 (#82) (f932a180)
- build(deps): bump codecov/codecov-action from 4 to 5 (#84) (2ef909e3)
- build(deps): bump actions/checkout from 4 to 6 (#163) (6fd5ae01)
- build(deps): bump actions/download-artifact from 4 to 7 (#164) (935ce8fa)
- build(deps): bump actions/github-script from 7 to 8 (#165) (927f57d2)
- build(deps): bump actions/upload-artifact from 4 to 6 (#166) (f3126b35)
- build(deps): bump actions/cache from 4 to 5 (#167) (74cf1619)
- build(deps): bump slang_flutter from 4.12.0 to 4.12.1 (#177) (45c37692)
- build(deps): bump very_good_analysis from 10.0.0 to 10.1.0 (#178) (52552b94)
- build(deps): bump slang_build_runner from 4.12.0 to 4.12.1 (#179) (bbf03075)
- build(deps): bump slang from 4.12.0 to 4.12.1 (#180) (a7432482)
- build(deps): bump build_runner from 2.10.5 to 2.11.0 (#181) (78fe05f2)
- build(deps): bump qs from 6.14.1 to 6.14.2 in /docs (#182) (68ceee43)
- build(deps): bump actions/upload-artifact from 6 to 7 (#183) (0b65347e)
- build(deps): bump actions/download-artifact from 7 to 8 (#184) (8ae05c4d)
- build(deps): bump svgo from 3.3.2 to 3.3.3 in /docs (#185) (4dca2cb9)
- build(deps): bump mocktail from 1.0.4 to 1.0.5 (#197) (a828b261)
- build(deps): bump shared_preferences from 2.5.4 to 2.5.5 (#191) (bafd05e3)
- build(deps): bump melos from 7.5.0 to 7.5.1 (#193) (961c274a)
- build(deps): bump flutter_widget_from_html from 0.17.1 to 0.17.2 (#194) (b1b9cbb4)
- build(deps): bump lodash from 4.17.23 to 4.18.1 in /docs (#195) (924ba707)
- build(deps): bump actions/github-script from 8 to 9 (#196) (70b7e858)
- build(deps): bump softprops/action-gh-release from 2 to 3 (#198) (df7ba5b8)
- build(deps): bump follow-redirects from 1.15.11 to 1.16.0 in /docs (#199) (6b1af212)
- build(deps): bump animate_do from 4.2.0 to 5.1.0 (#200) (fdfbcc6f)
- build(deps): bump fast-uri from 3.1.0 to 3.1.2 in /docs (#201) (4a393ee2)
- build(deps): bump @babel/plugin-transform-modules-systemjs in /docs (#202) (57b2f382)
- build(deps): bump webpack-dev-server from 5.2.3 to 5.2.4 in /docs (#203) (876e72d9)
- build(deps): bump codecov/codecov-action from 5 to 7 (#204) (74a7693e)
- build(deps): bump shell-quote from 1.8.3 to 1.8.4 in /docs (#205) (46a88c5e)
- build(deps): bump joi from 17.13.3 to 17.13.4 in /docs (#206) (529cbea1)
- build(deps): bump brace-expansion from 1.1.12 to 1.1.15 in /docs (#208) (182317a4)
- build(deps): bump @babel/core from 7.29.0 to 7.29.7 in /docs (#209) (d07f4529)
- build(deps): bump postcss from 8.5.8 to 8.5.15 in /docs (#210) (5d00c619)
- build(deps): bump launch-editor from 2.13.2 to 2.14.1 in /docs (#207) (1508aba3)

### 👷 CI

-  add build_runner and .env setup to APK build workflows (dc4e1f82)
-  optimize GitHub Actions with comprehensive caching strategy (8693c844)

### 🔧 Chores

- chore(dependencies): upgrade dependencies (eecb543d)
- chore(doc): upgrade docs dependency constraint (398485be)
- chore(dependencies): run melos upgrade (bd010a6e)
- chore(pubs): add topics (d33640f2)
- chore(deps): update dependency constraints (1fe60d36)
- chore(deps): upgrade to sdk 3.7 (ae4c39db)
- chore(deps): update dependency (822a68f9)
-  back merge main to develop (26b5364e)
- chore(pub): run flutter pub get (9a0032a5)
- chore(pub): run pub upgrade (0c959a80)
- chore(pub): run melos upgrade (78f5fe7e)
- chore(example): update build.yaml to match current project structure (f62314f4)
- chore(example): update build config and dependencies (46f9a3cf)
-  update lockfiles after dependency changes (f313af2c)
-  regenerate translation files after adding statistical classifications (9ae7458b)
-  update injectable config (d1514e1b)
-  format code and update dependencies (0fac1a14)
-  back-merge 1.0.0 to develop (#172) (ad05d692)
-  bump version to 1.1.0 for next development cycle (#171) (71813f6c)
-  upgrade flutter dependencies (#188) (76ce7213)
- chore(deps): update docusaurus dependencies (#189) (5b8080ff)
- chore(release): prepare changelog for 1.1.0 (16cafbe5)
- chore(release): 1.1.0 (f16cee5b)

### 📝 Other Changes

- Merge branch 'main' into develop (4827b1fa)
- Merge branch 'main' into develop (bf51d03f)
- Merge branch 'main' into develop (f998b454)
- Merge branch 'main' into develop (38e53b7e)
- Merge branch 'main' into develop (7cd33982)
- Merge branch 'main' into develop (114b8f7a)
- debug(variables): add comprehensive logging for subject loading issue (0f9e833a)
- debug(variables): add logging to diagnose switch toggle issue (3d9561c4)
- Revert "refactor(static-tables): preserve inline CSS styles in HTML table rendering" (6809d12e)
- Revert "feat(static-tables): add sticky table header for better navigation" (6317c027)
- Merge pull request #139 from ryanaidilp/refactor/example-app (732650da)
- Merge remote-tracking branch 'origin/HEAD' into develop (e869efaa)
- Merge pull request #140 from ryanaidilp/feature/workflow-improvement (c2501f61)
- Merge branch 'main' into develop (04ded3e7)
- Merge pull request #142 from ryanaidilp/feature/table-webview-improvement (b1942c51)
- Merge remote-tracking branch 'origin/main' into develop (799c55e2)
- Merge pull request #190 from ryanaidilp/main (540e2d20)
- Merge remote-tracking branch 'origin/main' into release/1.1.0 (64c23635)

## [1.0.0] - 2026-02-08

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 📚 Documentation

-  update changelog for 1.0.0 (1969c940)
-  update changelog for 1.0.0 (9d111bcd)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)
- release: 1.0.0 (#174) (fbca6d0d)
- release: 1.0.0 (#176) (d4e055ed)

## [1.0.0] - 2026-02-08

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 📚 Documentation

-  update changelog for 1.0.0 (1969c940)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)
- release: 1.0.0 (#174) (fbca6d0d)

## [1.0.0] - 2026-02-06

### ✨ Features

- feat(workflows): enhance changelog and notification workflows (dd43b991)
- feat(release): prepare release 1.0.0 (#161) (a306afa2)

### ♻️ Refactoring

- refactor(script): include apk link in the git release notification (371212a6)

### 🏗️ Build

- build(deps): bump peter-evans/create-pull-request from 5 to 7 (#107) (efb3ee7f)
- build(deps): bump softprops/action-gh-release from 1 to 2 (#106) (e907083e)
- build(deps): bump logger from 2.6.0 to 2.6.1 (#111) (9c197ead)
- build(deps): bump number_paginator from 1.1.0 to 1.1.1 (#110) (e7e97d2f)
- build(deps): bump flutter_widget_from_html from 0.16.0 to 0.17.0 (#109) (8e6276a0)
- build(deps): bump actions/checkout from 4 to 5 (#115) (b37a5802)
- build(deps): bump build_runner from 2.5.4 to 2.7.0 (#117) (690bfa29)
- build(deps): bump melos from 6.3.3 to 7.0.0 (#116) (338604b8)
- build(deps): bump envied from 1.1.1 to 1.2.0 (#113) (4c18ac10)
- build(deps): bump melos from 7.0.0 to 7.1.0 (#119) (67a136c2)
- build(deps): bump actions/setup-java from 4 to 5 (#118) (f19388bf)
- build(deps): bump actions/setup-node from 4 to 5 (#125) (c4b9d599)
- build(deps): bump actions/setup-python from 5 to 6 (#124) (19c00710)
- build(deps): bump build_runner from 2.7.0 to 2.7.1 (#123) (9cc98f9a)
- build(deps): bump envied_generator from 1.2.0 to 1.2.1 (#122) (c2927c33)
- build(deps): bump envied from 1.2.0 to 1.2.1 (#121) (d1a28787)
- build(deps): bump flutter_widget_from_html from 0.17.0 to 0.17.1 (#120) (2f7f89f1)
- build(deps): bump melos from 7.1.0 to 7.1.1 (#127) (631ede91)
- build(deps): bump actions/setup-node from 5 to 6 (#136) (50e1ff1e)
- build(deps): bump envied from 1.2.1 to 1.3.1 (#135) (e1bdfb8c)
- build(deps): bump envied_generator from 1.2.1 to 1.3.1 (#134) (f60e9990)
- build(deps): bump logger from 2.6.1 to 2.6.2 (#133) (82fad603)
- build(deps): bump build_runner from 2.7.1 to 2.9.0 (#132) (631f69cc)
- build(deps): bump very_good_analysis from 9.0.0 to 10.0.0 (#131) (a6af5a24)
- build(deps): bump build_runner from 2.9.0 to 2.10.0 (52d3b148)
- build(deps): bump melos from 7.1.1 to 7.2.0 (#137) (81ee56a1)
- build(deps): bump melos from 7.2.0 to 7.3.0 (ed90c645)
- build(deps): bump actions/upload-artifact from 4 to 6 (#158) (3efaf3e4)
- build(deps): bump actions/checkout from 5 to 6 (#151) (18286602)
- build(deps): bump mdast-util-to-hast from 13.2.0 to 13.2.1 in /docs (#156) (170cf91c)
- build(deps): bump peter-evans/create-pull-request from 7 to 8 (#157) (00f3d1dc)
- build(deps): bump lodash from 4.17.21 to 4.17.23 in /docs (#159) (947f285e)
- build(deps): bump node-forge from 1.3.1 to 1.3.2 in /docs (#153) (ae10ee96)

### 👷 CI

- ci(fix): update variable name (29f87d56)
- ci(workflow): add create release with apk action (85d77b1a)
- ci(cspell): add words to cspell (#108) (9e626869)

### 🔧 Chores

-  prepare release 1.0.0 (#170) (69192d92)

### 📝 Other Changes

- Merge pull request #138 from ryanaidilp/dependabot/pub/build_runner-2.10.0 (990355ab)
- Merge pull request #141 from ryanaidilp/dependabot/pub/melos-7.3.0 (cd532047)


All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## 0.6.3+15

> 2023-10-01

### Fixed

- **Fixed** crash causing by `Infographic` not handling null description case.

## 0.6.2+14

> 2023-10-01

### What's new?

- **Updated** documentation
- **Updated** minor ui changes in example app

### Fixed

- **Fixed** minor issue in `ListResult` class

## 0.6.1+13

> 2023-09-26

### What's new?

- **Fixed** `PressRelease` abstract property is nullable

## 0.6.0+12

> 2023-09-26

### What's New?

- **Added** subject category entity.
- **Added** subject category repository contract.
- **Added** use case to get all subject categories.
- **Added** subject category model.
- **Added** subject category remote data source.
- **Added** subject category repository implementation.
- **Added** subject category feature export.
- **Added** subject entity.
- **Added** subject repository contract.
- **Added** use case to get all subjects.
- **Added** subject model.
- **Added** subject remote data source.
- **Added** subject repository implementation.
- **Added** subject feature export.
- **Added** press release entity.
- **Added** press release repository.
- **Added** use cases to get list and detail of press releases.
- **Added** press release model.
- **Added** press release remote data source.
- **Added** press release repository implementation.
- **Added** press release feature export.
- **Added** example pages for subject, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
  ect, subject category, and press release.
- **Added** routes for subject, subject category, and press release.
- **Added** press release card in the example.
- **Added** fixtures for subject category, subject list, and press release.
- **Added** unit tests for subject category use case.
- **Added** unit tests for subject use case.
- **Added** unit tests for press release use case.
- **Added** unit tests for API endpoints.
- **Added** unit tests for data layer of subject category.
- **Added** unit tests for subject remote data source.
- **Added** unit tests for subject repository implementation.
- **Added** unit tests for press release data source.
- **Added** unit tests for press release repository implementation.
- **Refactored** exception classes.
- **Removed** dead code from the repository.
- **Updated** test names and added missing tests for domain and publication models.
- **Renamed** infographic endpoint and added a new endpoint.
- **Added** tests for the static table endpoint.
- **Created** the `StaticTable` entity, repository contract, use case, and model.
- **Optimized** code import and file export.
- **Added** exceptions and failures for the static table feature.
- **Created** a table serializer.
- **Added** tests for the static table model, remote data source, and repository implementation.
- **Integrated** the static table feature into list and view.
- **Updated** static table property documentation.
- **Added** fixtures and tests for static tables.
- **Implemented** unit tests for the static table use case and repository.
- **Added** teardown steps to all unit tests.
- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/32)

## 0.5.0+11

> 2023-09-16

### What's New?

- **Added** exceptions and failure handling for news.
- **Added** a news entity to represent news data.
- **Added** a news repository contract.
- **Added** use cases for retrieving all news and news details.
- **Added** a news model to represent news data.
- **Added** fixtures for news and news details.
- **Added** fixture enums.
- **Added** unit tests for news use cases.
- **Added** an endpoint for news.
- **Added** a news remote data source.
- **Added** an example page for news.
- **Added** a news category entity.
- **Added** exceptions and failure handling for news categories.
- **Added** a news category repository contract.
- **Added** a use case for getting all news categories.
- **Added** a news category model.
- **Added** fixtures for news categories.
- **Added** unit tests for news category use cases.

### Fixed

- **Fixed** analyzer issues.
- **Fixed** unused page in the example app.
- **Fixed** the UI of the publication example.
- **Fixed** the STADATA exception class to be a normal class.
- **Fixed** exception handling in the HTTP module.

[View Pull Request](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/19)

## 0.4.0+10

> 2023-09-15

### What's New?

#### Fetch Static Table Data from BPS API (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Added support for fetching static table data from the BPS (Bureau of Public Statistics) API.
- Introduced a new `StaticTable` class to model static table data.
- Implemented API requests and data parsing logic for retrieving static tables.
- Documented the usage of the new feature in the SDK's documentation.

#### Documentation Updates

- Updated README to reflect the new Static Table feature (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17)).

### Refactor

#### Codebase Improvements (PR [#17](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/17))

- Refactored exception classes.
- Removed dead code from the repository.
- Updated test names and added missing tests for domain and publication models (PR #128).
- Renamed infographic endpoint and added a new endpoint.
- Added tests for the static table endpoint.
- Created the `StaticTable` entity, repository contract, use case, and model.
- Optimized code import and file export.
- Added exceptions and failures for the static table feature (PR #138).
- Created a table serializer.
- Added tests for the static table model, remote data source, and repository implementation.
- Integrated the static table feature into list and view.
- Added an example preview for the static table feature.
- Updated static table property documentation.
- Added fixtures and tests for static tables.
- Implemented unit tests for the static table use case and repository.
- Added teardown steps to all unit tests.

### Chore

#### Dependency Updates

- Updated project dependencies to the latest versions.

## 0.3.5+9

> 2023-09-15

### Fixed

- revert broken changes that makes the SDK unusable from version 0.3.0 [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add test for `PaginationModel` [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)
- add config to run example app on ios [#16](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/16)

## 0.3.4+8

> 2023-09-15

### Fixed

- revert broken changes [#15](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/15)

## 0.3.3+7

> 2023-09-15

### Fixed

- issue with auto publish [#14](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/14)

## 0.3.2+6

> 2023-09-15

### Fixed

- add `homepage` & `repository` to `pubspec.yaml` [#13](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/13)

## 0.3.1+5

> 2023-09-15

### Fixed

- add list of `platforms` to `pubspec.yaml` [#12](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/12)

## 0.3.0+4

> 2023-09-14

### Added

- Fetch Infographic Data from BPS API by @ryanaidilp in [#9](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/9)
- Fetch Infographic Data from BPS API & Improve Documentation by @ryanaidilp in [#10](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/10)

### Changed

- Chore: Add test coverage by @ryanaidilp in [#8](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/8)

## 0.2.1+3

> 2023-09-13

### Fixed

- Enable multidex by @ryanaidilp in [#7](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/7)

## 0.2.0+2

> 2023-09-13

### Added

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)

- Publications API by @ryanaidilp in [#5](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/5)
- Release version 0.2.0 by @ryanaidilp in [#6](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/6)

### Changed

- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)
- Chore(deps): Bump mocktail from 0.3.0 to 1.0.0 by @dependabot in [#4](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/4)

### New Contributors

- @dependabot made their first contribution in [#1](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/1)

## 0.1.0+1

> 2023-09-13

- Initial Release of Stadata Flutter SDK

### Added

- Core Modules by @ryanaidilp in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
- Initial SDK Release by @ryanaidilp in [#3](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/3)

### New Contributors

- @ryanaidilp made their first contribution in [#2](https://github.com/ryanaidilp/stadata_flutter_sdk/pull/2)
