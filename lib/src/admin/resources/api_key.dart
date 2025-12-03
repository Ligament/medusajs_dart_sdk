import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin API key management resource
class AdminApiKeyResource extends AdminResource {
  const AdminApiKeyResource(super.client);

  String get resourcePath => '$basePath/api-keys';

  /// List API keys
  Future<PaginatedResponse<ApiKey>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ApiKey>(
      endpoint: resourcePath,
      dataKey: 'api_keys',
      fromJson: ApiKey.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve an API key by ID
  Future<ApiKey?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ApiKey>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'api_key',
      fromJson: ApiKey.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new API key
  Future<ApiKey?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ApiKey>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'api_key',
      fromJson: ApiKey.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update an API key
  Future<ApiKey?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ApiKey>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'api_key',
      fromJson: ApiKey.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete an API key
  Future<Map<String, dynamic>> delete(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await deleteGeneric(
      id: id,
      endpoint: '$resourcePath/$id',
      headers: headers,
    );
  }

  /// Revoke an API key
  Future<ApiKey?> revoke(String id, {ClientHeaders? headers}) async {
    return await updateGeneric<ApiKey>(
      id: id,
      body: {'revoked_at': DateTime.now().toIso8601String()},
      endpoint: '$resourcePath/$id/revoke',
      dataKey: 'api_key',
      fromJson: ApiKey.fromJson,
      headers: headers,
    );
  }

  /// List API keys by type
  Future<PaginatedResponse<ApiKey>> byType(
    String type, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['type'] = type;

    return list(query: query, headers: headers);
  }
}
