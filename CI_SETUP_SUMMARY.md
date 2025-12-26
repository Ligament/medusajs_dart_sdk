# CI/CD Setup Summary

## What Was Added

This PR adds comprehensive CI/CD workflows to the Medusa.js Dart SDK repository to answer the question: **"How i check your run"**

### Files Added

1. **`.github/workflows/ci.yml`** - Main CI workflow
   - Runs on push to main/master/develop branches
   - Runs on all pull requests
   - Tests on multiple Dart versions (3.8.0 and stable)
   - Performs comprehensive checks: formatting, analysis, testing, build validation
   - Generates test coverage reports
   - Can be manually triggered

2. **`.github/workflows/pr-check.yml`** - Quick PR validation
   - Runs on PR events (opened, synchronized, reopened)
   - Provides fast feedback with formatting, analysis, and test checks
   - Shows PR statistics (files/lines changed)
   - Warns about large PRs

3. **`.github/HOW_TO_CHECK_CI_STATUS.md`** - Comprehensive guide
   - Step-by-step instructions for checking CI/CD status
   - Explains each type of check
   - Troubleshooting common failures
   - Best practices for contributors

### Files Modified

1. **`README.md`**
   - Added CI status badge
   - Added Dart version badge
   - Added "Continuous Integration" section with detailed instructions
   - Explains what checks are performed
   - Shows commands to run checks locally

2. **`CONTRIBUTING.md`**
   - Added section on CI/CD checks
   - Explains how to view check status
   - Lists common failures and how to fix them

## How to Check CI/CD Status

### Quick Methods

1. **Check badges** - Look at the top of README.md
   - ![CI Badge](https://github.com/Ligament/medusajs_dart_sdk/workflows/CI/badge.svg)

2. **GitHub Actions page** - https://github.com/Ligament/medusajs_dart_sdk/actions
   - See all workflow runs
   - Filter by branch, status, workflow

3. **Pull request page** - Scroll to bottom of any PR
   - See real-time status of all checks
   - Click "Details" for logs

### What Gets Checked

Every push and PR triggers these automated checks:

- ✅ **Code Formatting** - `dart format --set-exit-if-changed .`
- ✅ **Static Analysis** - `dart analyze --fatal-infos`
- ✅ **Code Generation** - Verifies build_runner outputs are current
- ✅ **Tests** - `dart test` on multiple Dart versions
- ✅ **Package Validation** - `dart pub publish --dry-run`

### Running Locally

Before pushing, run these commands:

```bash
dart format .                                              # Format
dart analyze                                               # Analyze
dart run build_runner build --delete-conflicting-outputs   # Generate
dart test                                                  # Test
dart pub publish --dry-run                                 # Validate
```

## Benefits

1. **Automated Quality Checks** - Every commit is automatically tested
2. **Early Bug Detection** - Catch issues before merging
3. **Consistent Standards** - Enforce formatting and coding standards
4. **Confidence in Changes** - Know your code works before review
5. **Transparent Status** - Anyone can see if builds are passing
6. **Multiple Dart Versions** - Test compatibility across versions

## For Contributors

When you create a PR:
1. Checks will automatically run
2. You'll see results at the bottom of your PR page
3. Fix any failures before requesting review
4. All checks must pass before merging

## For Maintainers

The workflows provide:
- Automated testing on every push
- PR validation before merge
- Coverage reporting (on main branch)
- Multi-version compatibility testing
- Package publishing validation

## Documentation

For detailed information, see:
- [HOW_TO_CHECK_CI_STATUS.md](.github/HOW_TO_CHECK_CI_STATUS.md) - Complete guide
- [README.md](README.md) - Quick reference in "Contributing" section
- [CONTRIBUTING.md](CONTRIBUTING.md) - CI/CD section for contributors

## Next Steps

After merging this PR:
1. Workflows will automatically run on the main branch
2. Future PRs will have automated checks
3. CI badge in README will show live status
4. Contributors can see check results immediately

---

**Question answered**: "How i check your run" → Check the GitHub Actions tab, PR checks, or README badges!
