import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';
import 'package:test/test.dart';

/// Example test demonstrating environment configuration usage
void main() {
  group('Environment Configuration Tests', () {
    setUpAll(() async {
      // Initialize environment configuration
      await TestEnvironment.initialize();
      TestEnvironment.printSummary();
    });

    test('should load environment variables correctly', () {
      expect(TestEnvironment.backendUrl, isNotEmpty);
      expect(TestEnvironment.publishableKey, isNotEmpty);
      expect(TestEnvironment.adminApiKey, isNotEmpty);

      print('✅ Backend URL: ${TestEnvironment.backendUrl}');
      print('✅ Publishable Key: ${TestEnvironment.publishableKey}');
      print('✅ Admin API Key: ${TestEnvironment.adminApiKey}');
    });

    test('should create Medusa client with environment config', () {
      final config = MedusaConfig(
        baseUrl: TestEnvironment.backendUrl,
        publishableKey: TestEnvironment.publishableKey,
        debug: TestEnvironment.sdkDebug,
        timeout: TestEnvironment.sdkTimeout,
        maxRetries: TestEnvironment.sdkMaxRetries,
      );

      final medusa = Medusa(config);

      expect(medusa, isNotNull);
      expect(medusa.config.baseUrl, equals(TestEnvironment.backendUrl));
      expect(
        medusa.config.publishableKey,
        equals(TestEnvironment.publishableKey),
      );

      print('✅ Medusa client created successfully');
      print('   Base URL: ${medusa.config.baseUrl}');
      print('   Debug Mode: ${medusa.config.debug}');
      print('   Timeout: ${medusa.config.timeout?.inSeconds}s');
    });

    test('should create admin client with environment config', () {
      final config = MedusaConfig(
        baseUrl: TestEnvironment.backendUrl,
        apiKey: TestEnvironment.adminApiKey,
        debug: TestEnvironment.sdkDebug,
        timeout: TestEnvironment.sdkTimeout,
        maxRetries: TestEnvironment.sdkMaxRetries,
      );

      final medusa = Medusa(config);

      expect(medusa, isNotNull);
      expect(medusa.config.baseUrl, equals(TestEnvironment.backendUrl));
      expect(medusa.config.apiKey, equals(TestEnvironment.adminApiKey));

      print('✅ Admin client created successfully');
      print('   Base URL: ${medusa.config.baseUrl}');
      print('   API Key: ${medusa.config.apiKey}');
    });

    test('should handle test configuration flags', () {
      print('Test Configuration Flags:');
      print(
        '  Skip Integration Tests: ${TestEnvironment.skipIntegrationTests}',
      );
      print('  Skip Backend Tests: ${TestEnvironment.skipBackendTests}');
      print('  Use Demo Server: ${TestEnvironment.useDemoServer}');
      print('  Use Mock Data: ${TestEnvironment.useMockData}');
      print('  Test Debug Mode: ${TestEnvironment.testDebugMode}');
      print('  Test Timeout: ${TestEnvironment.testTimeout.inSeconds}s');
      print('  Test Max Retries: ${TestEnvironment.testMaxRetries}');
    });

    test('should provide test data IDs', () {
      print('Test Data IDs:');
      print('  Region ID: ${TestEnvironment.testRegionId}');
      print('  Currency Code: ${TestEnvironment.testCurrencyCode}');
      print('  Product ID: ${TestEnvironment.testProductId}');
      print('  Collection ID: ${TestEnvironment.testCollectionId}');
      print('  Category ID: ${TestEnvironment.testCategoryId}');
      print('  Customer ID: ${TestEnvironment.testCustomerId}');
      print('  Order ID: ${TestEnvironment.testOrderId}');
      print('  Payment ID: ${TestEnvironment.testPaymentId}');
      print('  Cart ID: ${TestEnvironment.testCartId}');
      print('  Promotion Code: ${TestEnvironment.testPromotionCode}');

      // Basic validation
      expect(TestEnvironment.testRegionId, isNotEmpty);
      expect(TestEnvironment.testCurrencyCode, isNotEmpty);
      expect(TestEnvironment.testProductId, isNotEmpty);
    });

    group('Integration Tests (conditionally skipped)', () {
      test('should connect to backend', () async {
        if (TestEnvironment.skipIntegrationTests ||
            TestEnvironment.skipBackendTests) {
          print('⏭️  Skipping integration test (disabled in config)');
          return;
        }

        final config = MedusaConfig(
          baseUrl:
              TestEnvironment.useDemoServer
                  ? TestEnvironment.demoUrl
                  : TestEnvironment.backendUrl,
          publishableKey: TestEnvironment.publishableKey,
          debug: TestEnvironment.testDebugMode,
          timeout: TestEnvironment.testTimeout,
        );

        final medusa = Medusa(config);

        try {
          // Try to fetch regions as a connectivity test
          final regions = await medusa.store.region.list();
          expect(regions, isNotNull);
          expect(regions.data, isA<List>());

          print('✅ Successfully connected to backend');
          print('   Found ${regions.data.length} regions');

          if (regions.data.isNotEmpty) {
            final region = regions.data.first;
            print('   First region: ${region.id} (${region.name})');
          }
        } catch (e) {
          if (TestEnvironment.testDebugMode) {
            print('❌ Backend connection failed: $e');
          }

          // Don't fail the test if using mock data
          if (TestEnvironment.useMockData) {
            print('ℹ️  Using mock data, backend connection failure expected');
          } else {
            rethrow;
          }
        }
      }, timeout: Timeout(TestEnvironment.testTimeout));
    });
  });
}
