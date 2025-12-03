import 'package:test/test.dart';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  group('MedusaJS Dart SDK', () {
    late Medusa medusa;

    setUp(() {
      medusa = Medusa(
        MedusaConfig(
          baseUrl: 'https://test-medusa-backend.com',
          publishableKey: 'pk_test_123',
        ),
      );
    });

    tearDown(() {
      medusa.dispose();
    });

    test('should create Medusa instance with config', () {
      expect(medusa, isNotNull);
      expect(
        medusa.configuration.baseUrl,
        equals('https://test-medusa-backend.com'),
      );
      expect(medusa.configuration.publishableKey, equals('pk_test_123'));
    });

    test('should have store module', () {
      expect(medusa.store, isNotNull);
      expect(medusa.store, isA<MedusaStore>());
    });

    test('should have admin module', () {
      expect(medusa.admin, isNotNull);
      expect(medusa.admin, isA<MedusaAdmin>());
    });

    test('should have auth module', () {
      expect(medusa.auth, isNotNull);
      expect(medusa.auth, isA<MedusaAuth>());
    });

    test('should have webhooks module', () {
      expect(medusa.webhooks, isNotNull);
      expect(medusa.webhooks, isA<MedusaWebhooks>());
    });

    test('should have realtime module', () {
      expect(medusa.realtime, isNotNull);
      expect(medusa.realtime, isA<RealtimeManager>());
    });

    test('should have client', () {
      expect(medusa.client, isNotNull);
      expect(medusa.client, isA<MedusaClient>());
    });
  });

  group('MedusaConfig', () {
    test('should create config with required parameters', () {
      final config = MedusaConfig(
        baseUrl: 'https://api.medusa.com',
        publishableKey: 'pk_test_456',
      );

      expect(config.baseUrl, equals('https://api.medusa.com'));
      expect(config.publishableKey, equals('pk_test_456'));
    });

    test('should create config with optional parameters', () {
      final config = MedusaConfig(
        baseUrl: 'https://api.medusa.com',
        publishableKey: 'pk_test_456',
        maxRetries: 5,
        timeout: Duration(seconds: 30),
      );

      expect(config.maxRetries, equals(5));
      expect(config.timeout, equals(Duration(seconds: 30)));
    });
  });
}
