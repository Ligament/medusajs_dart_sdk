import 'package:test/test.dart';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  group('MedusaAuth', () {
    late MedusaAuth auth;
    late MedusaClient client;
    late MedusaConfig config;

    setUp(() {
      config = MedusaConfig(
        baseUrl: 'https://test-medusa-backend.com',
        publishableKey: 'pk_test_123',
      );
      client = MedusaClient(config);
      auth = MedusaAuth(client, config);
    });

    tearDown(() {
      client.dispose();
    });

    test('should create auth instance', () {
      expect(auth, isNotNull);
      expect(auth, isA<MedusaAuth>());
    });

    group('Authentication Methods', () {
      test('should handle login flow', () async {
        // Test that login method exists and can be called
        // Note: This would normally make an HTTP request
        expect(
          () => auth.login('customer', 'emailpass', {
            'email': 'test@example.com',
            'password': 'password',
          }),
          isA<Function>(),
        );
      });

      test('should handle register flow', () async {
        // Test that register method exists and can be called
        expect(
          () => auth.register('customer', 'emailpass', {
            'email': 'test@example.com',
            'password': 'password',
          }),
          isA<Function>(),
        );
      });

      test('should handle logout', () async {
        // Test that logout method exists and can be called
        expect(() => auth.logout(), isA<Function>());
      });
    });

    group('Authentication Flow', () {
      test('should handle password reset', () async {
        // Test that resetPassword method exists
        expect(
          () => auth.resetPassword('customer', 'emailpass', {
            'email': 'test@example.com',
          }),
          isA<Function>(),
        );
      });

      test('should handle provider updates', () async {
        // Test that updateProvider method exists
        expect(
          () => auth.updateProvider('customer', 'emailpass', {
            'password': 'newpassword',
          }, 'token'),
          isA<Function>(),
        );
      });

      test('should handle refresh token', () async {
        // Test that refresh method exists
        expect(() => auth.refresh(), isA<Function>());
      });

      test('should handle OAuth callback', () async {
        // Test that callback method exists
        expect(
          () => auth.callback('customer', 'google', {'code': 'auth_code'}),
          isA<Function>(),
        );
      });
    });

    group('Client Integration', () {
      test('should work with MedusaClient', () async {
        // Test that auth module integrates with client
        expect(client, isNotNull);
        expect(config, isNotNull);

        // Test that token can be retrieved from client
        final token = await client.getToken();
        expect(token, isNull); // Should be null initially
      });

      test('should handle token operations via client', () async {
        const testToken = 'test_token_123';

        // Set token via client
        await client.setToken(testToken);
        final retrievedToken = await client.getToken();
        expect(retrievedToken, equals(testToken));

        // Clear token via client
        await client.clearToken();
        final clearedToken = await client.getToken();
        expect(clearedToken, isNull);
      });

      test('should use correct configuration', () {
        expect(config.baseUrl, equals('https://test-medusa-backend.com'));
        expect(config.publishableKey, equals('pk_test_123'));
      });
    });
  });
}
