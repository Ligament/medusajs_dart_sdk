import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin price preference resource for managing price preferences
class AdminPricePreferenceResource extends AdminResource {
  const AdminPricePreferenceResource(super.client);

  String get resourcePath => '$basePath/price-preferences';

  /// List price preferences
  Future<PaginatedResponse<Map<String, dynamic>>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      query: query,
      headers: headers,
    );

    final preferences =
        (response['price_preferences'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: preferences,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve a price preference by ID
  Future<Map<String, dynamic>?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id',
      query: query,
      headers: headers,
    );

    return response['price_preference'] as Map<String, dynamic>?;
  }

  /// Create a price preference
  Future<Map<String, dynamic>?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      method: 'POST',
      body: body,
      query: query,
      headers: headers,
    );

    return response['price_preference'] as Map<String, dynamic>?;
  }

  /// Update a price preference
  Future<Map<String, dynamic>?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id',
      method: 'POST',
      body: body,
      query: query,
      headers: headers,
    );

    return response['price_preference'] as Map<String, dynamic>?;
  }

  /// Delete a price preference
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
}
