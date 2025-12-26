# Contributing to Medusa.js Dart SDK

Thank you for your interest in contributing to the Medusa.js Dart SDK! This document provides guidelines and information for contributors.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Project Structure](#project-structure)
- [Contributing Guidelines](#contributing-guidelines)
- [Pull Request Process](#pull-request-process)
- [Code Style](#code-style)
- [Testing](#testing)
- [Documentation](#documentation)
- [Reporting Issues](#reporting-issues)

## Code of Conduct

We are committed to fostering a welcoming and inclusive community. Please read and follow our Code of Conduct to ensure a positive experience for all contributors.

## Getting Started

### Prerequisites

- **Dart SDK**: Version 3.7.2 or higher
- **Git**: For version control
- **IDE**: VS Code, IntelliJ IDEA, or any Dart-compatible editor

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone https://github.com/Ligament/medusajs-dart-sdk.git
   cd medusajs-dart-sdk
   ```

## Development Setup

1. **Install dependencies**:
   ```bash
   dart pub get
   ```

2. **Generate code** (for model serialization):
   ```bash
   dart run build_runner build
   ```

3. **Run tests**:
   ```bash
   dart test
   ```

4. **Run linting**:
   ```bash
   dart analyze
   ```

## Project Structure

```
lib/
├── medusajs_dart_sdk.dart          # Main export file
└── src/
    ├── admin/                      # Admin API implementations
    ├── auth/                       # Authentication management
    ├── batch/                      # Batch operations
    ├── cache/                      # Caching functionality
    ├── client/                     # HTTP client wrapper
    ├── exceptions/                 # Custom exceptions
    ├── models/                     # Data models with JSON serialization
    ├── pagination/                 # Pagination utilities
    ├── query/                      # Query builder
    ├── realtime/                   # WebSocket/real-time functionality
    ├── store/                      # Store API implementations
    ├── types/                      # Type definitions
    ├── webhooks/                   # Webhook utilities
    └── medusa_client.dart          # Main SDK client

test/                               # Test files
├── admin_test.dart
├── auth_test.dart
├── integration_test.dart
├── models_test.dart
└── store_test.dart
```

## Contributing Guidelines

### Types of Contributions

We welcome several types of contributions:

- **Bug fixes**: Fix existing issues in the codebase
- **New features**: Add new functionality that aligns with Medusa.js capabilities
- **Documentation**: Improve or add documentation
- **Tests**: Add or improve test coverage
- **Performance improvements**: Optimize existing code

### Before You Start

1. **Check existing issues**: Look for existing issues or discussions about your intended contribution
2. **Create an issue**: For new features or significant changes, create an issue first to discuss the approach
3. **Small changes**: For minor bug fixes or documentation improvements, you can directly create a pull request

## Pull Request Process

### 1. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/issue-description
```

### 2. Make Your Changes

- Follow the [code style guidelines](#code-style)
- Add tests for new functionality
- Update documentation as needed
- Ensure all tests pass

### 3. Commit Your Changes

Use clear, descriptive commit messages:

```bash
git commit -m "feat: add support for product variants API"
git commit -m "fix: handle null values in cart serialization"
git commit -m "docs: update authentication examples"
```

### 4. Update Documentation

- Update the README.md if you've added new features
- Add inline documentation for new public APIs
- Update relevant code examples

### 5. Run Quality Checks

Before submitting your pull request:

```bash
# Run tests
dart test

# Run static analysis
dart analyze

# Generate code (if you've modified models)
dart run build_runner build --delete-conflicting-outputs

# Format code
dart format .
```

### 6. Submit Pull Request

1. Push your branch to your fork
2. Create a pull request from your branch to the main repository
3. Fill out the pull request template
4. Link any related issues

### 7. Continuous Integration Checks

Once you submit your pull request, automated CI/CD checks will run via GitHub Actions:

**Automated Checks:**
- **Formatting**: Ensures code follows Dart formatting standards
- **Analysis**: Runs static code analysis to catch potential issues
- **Code Generation**: Verifies generated code is up to date
- **Tests**: Runs the complete test suite
- **Build Validation**: Ensures the package can be published

**Checking CI Status:**
- View the status checks at the bottom of your pull request
- Click "Details" next to any check to see logs and error messages
- All checks must pass before the PR can be merged
- If checks fail, review the error messages and push fixes to your branch

**Common CI Failures and Fixes:**
- **Format check fails**: Run `dart format .` locally and commit
- **Analysis fails**: Run `dart analyze` and fix reported issues
- **Tests fail**: Run `dart test` locally to debug failing tests
- **Generated code outdated**: Run `dart run build_runner build --delete-conflicting-outputs`

## Code Style

### Dart Conventions

Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style):

- Use `lowerCamelCase` for variables, functions, and parameters
- Use `UpperCamelCase` for classes, enums, and typedefs
- Use `lowercase_with_underscores` for libraries and file names
- Keep lines under 80 characters when possible

### Specific Guidelines

1. **Imports**: Group imports in the following order:
   ```dart
   // Dart core libraries
   import 'dart:core';
   
   // Third-party packages
   import 'package:http/http.dart';
   
   // Local imports
   import '../models/product.dart';
   ```

2. **Documentation**: Use documentation comments for all public APIs:
   ```dart
   /// Retrieves a product by its ID.
   ///
   /// Returns a [Product] object if found, otherwise throws a [MedusaException].
   /// 
   /// Example:
   /// ```dart
   /// final product = await client.store.product.retrieve('prod_123');
   /// ```
   Future<Product> retrieve(String id) async {
     // Implementation
   }
   ```

3. **Error Handling**: Use specific exception types:
   ```dart
   if (response.statusCode == 404) {
     throw MedusaNotFoundException('Product not found: $id');
   }
   ```

4. **Null Safety**: Leverage Dart's null safety features:
   ```dart
   String? optionalField;
   String requiredField = '';
   late String lateInitField;
   ```

## Testing

### Test Structure

- **Unit tests**: Test individual functions and classes
- **Integration tests**: Test complete workflows
- **Model tests**: Test JSON serialization/deserialization

### Writing Tests

```dart
import 'package:test/test.dart';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  group('Product API', () {
    late MedusaClient client;
    
    setUp(() {
      client = MedusaClient(MedusaConfig(baseUrl: 'http://localhost:9000'));
    });
    
    test('should retrieve product by ID', () async {
      // Test implementation
    });
  });
}
```

### Test Coverage

- Aim for >80% test coverage
- Test both success and error scenarios
- Include edge cases and boundary conditions

## Documentation

### API Documentation

- Use clear, descriptive method names
- Include comprehensive doc comments
- Provide code examples in documentation
- Document all parameters and return values

### Code Examples

When adding new features, include examples in:
- Method documentation
- README.md (if it's a major feature)
- Integration tests

## Reporting Issues

### Bug Reports

When reporting bugs, please include:

1. **Description**: Clear description of the issue
2. **Steps to reproduce**: Detailed steps to reproduce the bug
3. **Expected behavior**: What you expected to happen
4. **Actual behavior**: What actually happened
5. **Environment**: Dart version, OS, etc.
6. **Code sample**: Minimal code that reproduces the issue

### Feature Requests

For feature requests, please include:

1. **Use case**: Why you need this feature
2. **Proposed solution**: How you envision it working
3. **Alternatives**: Other solutions you've considered
4. **Additional context**: Any other relevant information

## Release Process

### Versioning

We follow [Semantic Versioning](https://semver.org/):

- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Changelog

All notable changes are documented in CHANGELOG.md following the [Keep a Changelog](https://keepachangelog.com/) format.

## Getting Help

If you need help with contributing:

- Check existing [issues](https://github.com/Ligament/medusajs-dart-sdk/issues)
- Join the [Medusa.js Discord community](https://discord.gg/medusajs)
- Create a discussion on GitHub

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project (MIT License).

## Recognition

Contributors will be recognized in:
- GitHub contributors list
- CHANGELOG.md for significant contributions
- Project documentation when applicable

Thank you for contributing to the Medusa.js Dart SDK! 🚀