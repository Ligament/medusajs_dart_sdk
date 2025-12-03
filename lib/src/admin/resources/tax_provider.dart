import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin tax provider management resource
class AdminTaxProviderResource extends AdminResource {
  const AdminTaxProviderResource(super.client);

  String get resourcePath => '$basePath/tax-providers';

  /// List tax providers
  Future<PaginatedResponse<Map<String, dynamic>>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      query: query,
      headers: headers,
    );

    final items =
        (response['tax_providers'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve a tax provider by ID
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

    return response['tax_provider'] as Map<String, dynamic>?;
  }

  /// Create a new tax provider
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

    return response['tax_provider'] as Map<String, dynamic>?;
  }

  /// Update a tax provider
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

    return response['tax_provider'] as Map<String, dynamic>?;
  }

  /// Delete a tax provider
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

  /// Get tax provider configuration
  Future<Map<String, dynamic>?> getConfiguration(
    String id, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/configuration',
      headers: headers,
    );

    return response['configuration'] as Map<String, dynamic>?;
  }

  /// Update tax provider configuration
  Future<Map<String, dynamic>?> updateConfiguration(
    String id,
    Map<String, dynamic> configuration, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/configuration',
      method: 'POST',
      body: {'configuration': configuration},
      headers: headers,
    );

    return response['configuration'] as Map<String, dynamic>?;
  }

  /// Get tax lines for a provider
  Future<PaginatedResponse<Map<String, dynamic>>> getTaxLines(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/tax-lines',
      query: query,
      headers: headers,
    );

    final items =
        (response['tax_lines'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Calculate taxes for items
  Future<Map<String, dynamic>> calculateTaxes(
    String id,
    Map<String, dynamic> calculationContext, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/calculate',
      method: 'POST',
      body: calculationContext,
      headers: headers,
    );
  }
}
