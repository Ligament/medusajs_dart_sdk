import '../client/client.dart';
import '../types/types.dart';
import '../exceptions/exceptions.dart';

/// Authentication module for Medusa SDK
class MedusaAuth {
  final MedusaClient _client;
  final MedusaConfig _config;

  MedusaAuth(this._client, this._config);

  /// Register a new user/customer
  /// Returns a registration token for subsequent requests
  Future<String> register(
    String actor,
    String method,
    Map<String, dynamic> payload,
  ) async {
    final response = await _client.fetch<Map<String, dynamic>>(
      '/auth/$actor/$method/register',
      method: 'POST',
      body: payload,
    );

    final token = response['token'] as String?;
    if (token == null) {
      throw AuthenticationError('No registration token received');
    }

    await _client.setToken(token);
    return token;
  }

  /// Login user/customer
  /// Returns either a token string or a location for third-party auth
  Future<dynamic> login(
    String actor,
    String method,
    Map<String, dynamic> payload,
  ) async {
    final response = await _client.fetch<Map<String, dynamic>>(
      '/auth/$actor/$method',
      method: 'POST',
      body: payload,
    );

    // Check if third-party authentication is required
    if (response.containsKey('location')) {
      return {'location': response['location']};
    }

    final token = response['token'] as String?;
    if (token == null) {
      throw AuthenticationError('No authentication token received');
    }

    await _client.setToken(token);

    // If session auth is configured, also set the session
    if (_config.auth?.type == AuthType.session) {
      await _setSession(token);
    }

    return token;
  }

  /// Validate OAuth callback from third-party service
  Future<String> callback(
    String actor,
    String method,
    Map<String, dynamic> query,
  ) async {
    final response = await _client.fetch<Map<String, dynamic>>(
      '/auth/$actor/$method/callback',
      method: 'POST',
      query: query,
    );

    final token = response['token'] as String?;
    if (token == null) {
      throw AuthenticationError(
        'No authentication token received from callback',
      );
    }

    await _client.setToken(token);
    return token;
  }

  /// Refresh the authentication token
  Future<String> refresh({ClientHeaders? headers}) async {
    final response = await _client.fetch<Map<String, dynamic>>(
      '/auth/token/refresh',
      method: 'POST',
      headers: headers,
    );

    final token = response['token'] as String?;
    if (token == null) {
      throw AuthenticationError('No refresh token received');
    }

    await _client.setToken(token);
    return token;
  }

  /// Logout the current user
  Future<void> logout() async {
    try {
      // If session auth is configured, delete the session
      if (_config.auth?.type == AuthType.session) {
        await _client.fetch('/auth/session', method: 'DELETE');
      }
    } catch (e) {
      // Ignore errors when deleting session
      _config.logger?.warn('Failed to delete session: $e');
    }

    // Clear the stored token
    await _client.clearToken();
  }

  /// Request password reset token
  Future<void> resetPassword(
    String actor,
    String provider,
    Map<String, String> body,
  ) async {
    await _client.fetch(
      '/auth/$actor/$provider/reset-password',
      method: 'POST',
      body: body,
    );
  }

  /// Update user authentication data (e.g., password reset)
  Future<void> updateProvider(
    String actor,
    String provider,
    Map<String, dynamic> body,
    String token,
  ) async {
    await _client.fetch(
      '/auth/$actor/$provider/update',
      method: 'POST',
      body: body,
      headers: {'Authorization': 'Bearer $token'},
    );
  }

  // Private methods

  Future<void> _setSession(String token) async {
    await _client.fetch(
      '/auth/session',
      method: 'POST',
      body: {'token': token},
    );
  }
}
