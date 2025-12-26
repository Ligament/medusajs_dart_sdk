# How to Check CI/CD Run Status

This guide explains how to check the status of automated builds and tests for the Medusa.js Dart SDK.

## Quick Answer

**The fastest way to check CI/CD status:**
1. Visit the [GitHub Actions page](https://github.com/Ligament/medusajs_dart_sdk/actions)
2. Check the badges on the [README](../README.md)
3. View checks on your pull request (scroll to bottom of PR page)

## Detailed Guide

### 1. Checking Overall Repository Status

**Using Badges:**
- The CI badge at the top of the README shows the status of the latest commit on the main branch
- 🟢 Green badge = All checks passing
- 🔴 Red badge = Some checks failing
- 🟡 Yellow badge = Checks in progress

**Using GitHub Actions Tab:**
1. Go to https://github.com/Ligament/medusajs_dart_sdk/actions
2. You'll see a list of all workflow runs
3. Filter by:
   - Workflow (CI, PR Checks, etc.)
   - Branch
   - Status (success, failure, in progress)
   - Actor (who triggered it)

### 2. Checking Your Pull Request

When you create a pull request, automated checks run automatically.

**To view PR check status:**
1. Open your pull request on GitHub
2. Scroll to the bottom of the page
3. You'll see a section called "All checks have passed" or "Some checks were not successful"
4. Click "Details" next to any check to see:
   - Full console output
   - Error messages
   - Test results
   - Line-by-line analysis issues

**PR Check Results:**
- ✅ All checks passed = PR is ready for review
- ❌ Some checks failed = Fix the issues before requesting review
- 🟡 Checks running = Wait for completion

### 3. Checking a Specific Commit

**From the Commits Page:**
1. Go to the repository and click "Commits"
2. Look for the ✓ (success) or ✗ (failure) icon next to each commit
3. Click the icon to see which checks passed/failed
4. Click the check name to see detailed logs

**From a Commit's Page:**
1. Open any commit by clicking its hash
2. Scroll down to see the list of checks
3. Click each check to view its details

### 4. Understanding the Checks

Our CI/CD pipeline runs these checks:

#### Main CI Workflow (`ci.yml`)
Runs on: Push to main/master/develop, Pull requests, Manual trigger

**Jobs:**
- **Test**: Runs tests on multiple Dart versions (3.8.0 and stable)
  - Installs dependencies
  - Generates code with build_runner
  - Checks code formatting
  - Runs static analysis
  - Executes all tests
  - Generates coverage report (main branch only)

- **Build Check**: Validates package build
  - Ensures generated code is up to date
  - Runs dry-run publish check

#### PR Checks Workflow (`pr-check.yml`)
Runs on: Pull request events (opened, synchronized, reopened)

**Jobs:**
- **Quick Check**: Fast validation for PRs
  - Code formatting
  - Quick analysis
  - Test execution
  - PR size metrics

### 5. Troubleshooting Failed Checks

#### Format Check Failed
```bash
# Fix locally:
dart format .

# Commit the changes:
git add .
git commit -m "fix: format code"
git push
```

#### Analysis Failed
```bash
# Check issues locally:
dart analyze

# Fix the reported issues, then:
git add .
git commit -m "fix: address analysis issues"
git push
```

#### Tests Failed
```bash
# Run tests locally:
dart test

# Run specific test file:
dart test test/specific_test.dart

# Run with verbose output:
dart test --reporter=expanded
```

#### Build Check Failed
```bash
# Regenerate code:
dart run build_runner build --delete-conflicting-outputs

# Commit generated files:
git add .
git commit -m "build: regenerate code"
git push
```

### 6. Running Checks Locally

Before pushing code, run these commands to catch issues early:

```bash
# Complete local check sequence:
dart pub get                                              # Install dependencies
dart run build_runner build --delete-conflicting-outputs  # Generate code
dart format .                                             # Format code
dart analyze --fatal-infos                                # Static analysis
dart test                                                 # Run tests
dart pub publish --dry-run                                # Check package validity
```

**Tip:** Create a script to run all checks:

```bash
#!/bin/bash
# save as check.sh

set -e  # Exit on first error

echo "🔄 Installing dependencies..."
dart pub get

echo "🏗️ Generating code..."
dart run build_runner build --delete-conflicting-outputs

echo "✨ Formatting code..."
dart format .

echo "🔍 Analyzing code..."
dart analyze --fatal-infos

echo "🧪 Running tests..."
dart test

echo "📦 Checking package..."
dart pub publish --dry-run

echo "✅ All checks passed!"
```

### 7. CI/CD Workflow Triggers

**Automatic Triggers:**
- Pushing commits to main, master, or develop branches
- Opening a pull request
- Pushing new commits to an existing pull request
- Synchronizing a pull request

**Manual Triggers:**
1. Go to Actions tab
2. Select the workflow (e.g., "CI")
3. Click "Run workflow"
4. Choose the branch
5. Click "Run workflow" button

### 8. Getting Help with CI/CD Issues

If CI checks are failing and you can't figure out why:

1. **Check the logs**: Click "Details" on the failed check to see full output
2. **Compare with passing runs**: Look at successful runs to see what changed
3. **Ask for help**: 
   - Comment on your PR describing the issue
   - Include relevant error messages
   - Mention what you've tried
4. **Search issues**: Check if others have encountered similar problems

### 9. Best Practices

**Before Submitting a PR:**
- ✅ Run all checks locally
- ✅ Ensure all tests pass
- ✅ Fix any linting or formatting issues
- ✅ Update documentation if needed

**During PR Review:**
- ✅ Address CI failures promptly
- ✅ Don't merge with failing checks
- ✅ Keep PR size reasonable (< 50 files, < 1000 lines)
- ✅ Respond to automated warnings about PR size

**After Merging:**
- ✅ Verify the main branch CI still passes
- ✅ Watch for any issues in deployed environments

## Quick Reference

| Task | Command |
|------|---------|
| View all workflow runs | Visit [Actions tab](https://github.com/Ligament/medusajs_dart_sdk/actions) |
| Check PR status | Scroll to bottom of your PR page |
| View commit status | Click ✓/✗ icon next to commit |
| Run checks locally | `dart test && dart analyze && dart format .` |
| Fix formatting | `dart format .` |
| Fix analysis issues | `dart analyze` (then fix issues) |
| Regenerate code | `dart run build_runner build --delete-conflicting-outputs` |
| View workflow file | `.github/workflows/ci.yml` |

## Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Dart CI/CD Guide](https://dart.dev/tools/continuous-integration)
- [Contributing Guide](../CONTRIBUTING.md)
- [README](../README.md)

---

**Still have questions?** Open an issue or ask in the pull request comments!
