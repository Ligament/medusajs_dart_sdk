# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.10.1] - 2024-12-09

## [Unreleased]

### Changed
- Refactored the repository layout to separate actively maintained code from historical artifacts.
- Added a top-level `archive/` directory containing legacy docs (`PHASE_*`, deployment guides), deprecated examples/tests, unused phase engines, and vendored JS assets.
- Trimmed `example/` down to the curated demos that match the current README while moving debug/phase demos into `example/archive/`.
- Relocated one-off root `test_*.dart` programs into `archive/tests/` so `dart test` now only executes the supported suites.
- Documented the new project structure in the README to make onboarding and maintenance easier.

### Fixed
- **Performance**: Updated to Medusa.js v2.10.1 for improved cart operations performance
- Reverted cart operation concurrency changes that caused performance regression
- Optimized cart-related HTTP requests response times

### Improved
- **Type Safety**: Replaced inappropriate `Map<String, dynamic>` usage with proper types
  - Added `AddressRequest` class for address creation/update operations
  - Added `ProductVariantOptionRequest` class for structured variant options
  - Updated `CreateDraftOrderRequest` and `UpdateDraftOrderRequest` to use `AddressRequest`
  - Updated `CreateProductVariantRequest` and `UpdateProductVariantRequest` to use proper option types
- **Cart Model**: Added helpful getters (`itemCount`, `isEmpty`, `hasItems`)
- Enhanced flexible type handling with better use of `Map<String, dynamic>` for metadata
- Improved API response compatibility for variable structures
- Better support for custom attributes and metadata fields

### Breaking Changes
- **Draft Order Requests**: `shippingAddress` and `billingAddress` now use `AddressRequest` instead of `Map<String, dynamic>`
- **Product Variant Requests**: `options` field now uses `List<ProductVariantOptionRequest>` instead of `Map<String, dynamic>`
- These changes improve type safety and IDE support while maintaining JSON serialization compatibility

### Notes
- This version fixes performance regressions introduced in v2.10.0
- Cart operations now perform at expected speeds matching previous versions
- No breaking changes from v2.10.0

## [2.10.0] - 2024-12-07

### Added
- **BREAKING**: Updated to Medusa.js v2.10.0 compatibility
- Added support for Shipping Option Types management
  - New `ShippingOptionType` model with label, description, and code
  - Admin resource `AdminShippingOptionTypeResource` for CRUD operations
  - Updated `ShippingOption` model to include optional `typeId` field
- Added `withDeleted()` method to `QueryBuilder` for querying deleted records (v2.10 feature)
- Enhanced fulfillment models with better type safety using `Map<String, dynamic>`

### Fixed
- Improved type consistency across models following Medusa v2.10 API changes
- Updated shipping option calculations to support new type-based filtering

### Notes
- This version introduces breaking changes from Medusa.js v2.10.0
- Shipping option types enable better categorization (e.g., Standard, Express)
- Query with deleted records now requires explicit `withDeleted()` flag

## [2.8.5] - 2024-12-06

### Added
- Initial release of Medusa.js Dart SDK
- Complete Store API implementation
  - Products, collections, categories
  - Shopping carts and line items
  - Orders and fulfillment
  - Customer management
  - Regions and currencies
  - Payment and shipping options
- Full Admin API support
  - Product management
  - Order administration
  - Customer administration
  - User management
  - Inventory and stock locations
  - Discounts and gift cards
- Authentication system
  - Customer and admin login
  - Token management
  - Session handling
- Real-time support
  - WebSocket connections
  - Event subscriptions
  - Live updates
- Caching functionality
  - Configurable TTL
  - Memory-based cache
  - Request optimization
- Webhook utilities
  - Signature verification
  - Event handling
- Query builder
  - Pagination support
  - Filtering and sorting
  - Field expansion
- Batch operations
  - Bulk API requests
  - Transaction support
- Type-safe models
  - JSON serialization/deserialization
  - Null safety support
  - Generated code for models
- Comprehensive error handling
  - Custom exception types
  - Network error handling
  - API error responses
- Flutter compatibility
  - SharedPreferences integration
  - Mobile-optimized HTTP client

### Technical Details
- Based on Medusa.js JavaScript SDK v2.8.3
- Dart SDK 3.7.2+ compatibility
- Full null safety support
- Code generation for JSON serialization
- HTTP client with retry logic and timeout handling

### Dependencies
- `http`: ^1.2.1 - HTTP client for API requests
- `json_annotation`: ^4.9.0 - JSON serialization annotations
- `shared_preferences`: ^2.2.3 - Local storage for tokens and cache

### Dev Dependencies
- `test`: ^1.25.2 - Testing framework
- `build_runner`: ^2.4.12 - Code generation
- `json_serializable`: ^6.8.0 - JSON serialization generator
- `lints`: ^4.0.0 - Dart linting rules
## [2.11.3] - 2025-01-05

### Added
- Admin Views API parity (columns, configuration CRUD, active view controls) with new typed models.
- CamelCase admin resource getters plus dedicated commerce grouping, stats, and resource availability helpers.
- View configuration models (`AdminViewConfiguration*`, `AdminViewsEntityColumnsResponse`) and store cart completion/delete response models.

### Changed
- Upgraded HTTP client to match `@medusajs/js-sdk@2.11.3` (debug flag, Basic API key auth, recursive query encoding, header overrides, session-aware JWT handling).
- Store cart/order flows now return typed responses (`StoreCompleteCartResponse`, `StoreLineItemDeleteResponse`) and accept typed transfer payloads.
- Admin resources fully enabled (fulfillment, payment, paymentCollection, user, views) with updated status reporting and tests.
- Version bump to align with Medusa v2.11.3 / JS SDK 2.11.3.
