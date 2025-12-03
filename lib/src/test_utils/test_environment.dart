import 'dart:io';

/// Simple environment configuration helper for tests
/// Reads from system environment variables and .env file
class TestEnvironment {
  static final Map<String, String> _envVars = {};
  static bool _initialized = false;

  /// Initialize environment by loading .env file if it exists
  static Future<void> initialize() async {
    if (_initialized) return;

    // Load from .env file if it exists
    await _loadEnvFile();
    _initialized = true;
  }

  /// Load environment variables from .env file
  static Future<void> _loadEnvFile() async {
    try {
      final envFile = File('.env');
      if (await envFile.exists()) {
        final content = await envFile.readAsString();
        final lines = content.split('\n');

        for (final line in lines) {
          final trimmed = line.trim();

          // Skip comments and empty lines
          if (trimmed.isEmpty || trimmed.startsWith('#')) continue;

          // Parse key=value pairs
          final parts = trimmed.split('=');
          if (parts.length >= 2) {
            final key = parts[0].trim();
            final value = parts.sublist(1).join('=').trim();

            // Remove quotes if present
            var cleanValue = value;
            if (cleanValue.startsWith('"') && cleanValue.endsWith('"')) {
              cleanValue = cleanValue.substring(1, cleanValue.length - 1);
            } else if (cleanValue.startsWith("'") && cleanValue.endsWith("'")) {
              cleanValue = cleanValue.substring(1, cleanValue.length - 1);
            }
            _envVars[key] = cleanValue;
          }
        }
        print('✅ Loaded ${_envVars.length} environment variables from .env');
      } else {
        print(
          'ℹ️  No .env file found, using system environment variables only',
        );
      }
    } catch (e) {
      print('⚠️  Error loading .env file: $e');
    }
  }

  /// Get environment variable value
  /// First checks .env file, then system environment
  static String? get(String key) {
    // First check loaded .env variables
    if (_envVars.containsKey(key)) {
      return _envVars[key];
    }

    // Then check system environment
    return Platform.environment[key];
  }

  /// Get environment variable with default value
  static String getOrDefault(String key, String defaultValue) {
    return get(key) ?? defaultValue;
  }

  /// Get boolean environment variable
  static bool getBool(String key, {bool defaultValue = false}) {
    final value = get(key)?.toLowerCase();
    if (value == null) return defaultValue;
    return value == 'true' || value == '1' || value == 'yes';
  }

  /// Get integer environment variable
  static int getInt(String key, {int defaultValue = 0}) {
    final value = get(key);
    if (value == null) return defaultValue;
    return int.tryParse(value) ?? defaultValue;
  }

  /// Get Duration from seconds environment variable
  static Duration getDuration(
    String key, {
    Duration defaultValue = const Duration(seconds: 30),
  }) {
    final seconds = getInt(key, defaultValue: defaultValue.inSeconds);
    return Duration(seconds: seconds);
  }

  // =============================================================================
  // MEDUSA CONFIGURATION HELPERS
  // =============================================================================

  /// Get Medusa backend URL
  static String get backendUrl =>
      getOrDefault('MEDUSA_BACKEND_URL', 'http://localhost:9000');

  /// Get demo backend URL
  static String get demoUrl =>
      getOrDefault('MEDUSA_DEMO_URL', 'https://demo.medusajs.com');

  /// Get publishable key for store operations
  static String get publishableKey =>
      getOrDefault('MEDUSA_PUBLISHABLE_KEY', 'pk_test_123');

  /// Get admin API key
  static String get adminApiKey =>
      getOrDefault('MEDUSA_ADMIN_API_KEY', 'api_test_123');

  /// Get admin JWT token
  static String? get adminJwtToken => get('MEDUSA_ADMIN_JWT_TOKEN');

  // =============================================================================
  // TEST CONFIGURATION HELPERS
  // =============================================================================

  /// Should skip integration tests
  static bool get skipIntegrationTests =>
      getBool('SKIP_INTEGRATION_TESTS', defaultValue: true);

  /// Should skip backend dependent tests
  static bool get skipBackendTests =>
      getBool('SKIP_BACKEND_DEPENDENT_TESTS', defaultValue: true);

  /// Test timeout duration
  static Duration get testTimeout => getDuration('TEST_TIMEOUT_SECONDS');

  /// Test debug mode
  static bool get testDebugMode =>
      getBool('TEST_DEBUG_MODE', defaultValue: true);

  /// Test max retries
  static int get testMaxRetries => getInt('TEST_MAX_RETRIES', defaultValue: 3);

  // =============================================================================
  // SDK CONFIGURATION HELPERS
  // =============================================================================

  /// SDK timeout duration
  static Duration get sdkTimeout => getDuration('SDK_TIMEOUT_SECONDS');

  /// SDK max retries
  static int get sdkMaxRetries => getInt('SDK_MAX_RETRIES', defaultValue: 3);

  /// SDK debug mode
  static bool get sdkDebug => getBool('SDK_DEBUG', defaultValue: true);

  /// SDK verbose HTTP logging
  static bool get sdkVerboseHttp => getBool('SDK_VERBOSE_HTTP');

  // =============================================================================
  // TEST DATA HELPERS
  // =============================================================================

  /// Test region ID
  static String get testRegionId =>
      getOrDefault('TEST_REGION_ID', 'reg_test_123');

  /// Test currency code
  static String get testCurrencyCode =>
      getOrDefault('TEST_CURRENCY_CODE', 'usd');

  /// Test product ID
  static String get testProductId =>
      getOrDefault('TEST_PRODUCT_ID', 'prod_test_123');

  /// Test collection ID
  static String get testCollectionId =>
      getOrDefault('TEST_COLLECTION_ID', 'pcol_test_123');

  /// Test category ID
  static String get testCategoryId =>
      getOrDefault('TEST_CATEGORY_ID', 'pcat_test_123');

  /// Test customer ID
  static String get testCustomerId =>
      getOrDefault('TEST_CUSTOMER_ID', 'cus_test_123');

  /// Test order ID
  static String get testOrderId =>
      getOrDefault('TEST_ORDER_ID', 'order_test_123');

  /// Test payment ID
  static String get testPaymentId =>
      getOrDefault('TEST_PAYMENT_ID', 'pay_test_123');

  /// Test cart ID
  static String get testCartId => getOrDefault('TEST_CART_ID', 'cart_test_123');

  /// Test promotion code
  static String get testPromotionCode =>
      getOrDefault('TEST_PROMOTION_CODE', 'TESTCODE');

  /// Use demo server for integration tests
  static bool get useDemoServer => getBool('USE_DEMO_SERVER_FOR_INTEGRATION');

  /// Use mock data instead of live API
  static bool get useMockData => getBool('USE_MOCK_DATA');

  /// Enable test logging
  static bool get enableTestLogging =>
      getBool('ENABLE_TEST_LOGGING', defaultValue: true);

  // =============================================================================
  // CONFIGURATION SUMMARY
  // =============================================================================

  /// Print current configuration summary
  static void printSummary() {
    print('🔧 Test Environment Configuration:');
    print('  Backend URL: $backendUrl');
    print('  Publishable Key: ${publishableKey.substring(0, 8)}...');
    print('  Admin API Key: ${adminApiKey.substring(0, 8)}...');
    print('  Skip Integration Tests: $skipIntegrationTests');
    print('  Skip Backend Tests: $skipBackendTests');
    print('  Test Timeout: ${testTimeout.inSeconds}s');
    print('  SDK Debug: $sdkDebug');
    print('  Use Demo Server: $useDemoServer');
    print('  Use Mock Data: $useMockData');
    print('');
  }
}
