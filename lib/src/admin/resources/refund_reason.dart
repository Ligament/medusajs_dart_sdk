import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin refund reason management resource
class AdminRefundReasonResource extends AdminResource {
  const AdminRefundReasonResource(super.client);

  String get resourcePath => '$basePath/refund-reasons';

  /// List refund reasons
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
        (response['refund_reasons'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve a refund reason by ID
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

    return response['refund_reason'] as Map<String, dynamic>?;
  }

  /// Create a new refund reason
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

    return response['refund_reason'] as Map<String, dynamic>?;
  }

  /// Update a refund reason
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

    return response['refund_reason'] as Map<String, dynamic>?;
  }

  /// Delete a refund reason
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

  /// Search refund reasons by label
  Future<PaginatedResponse<Map<String, dynamic>>> search(
    String searchTerm, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['q'] = searchTerm;

    return list(query: query, headers: headers);
  }

  /// Get refund reasons by label
  Future<PaginatedResponse<Map<String, dynamic>>> byLabel(
    String label, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['label'] = label;

    return list(query: query, headers: headers);
  }

  /// Get refund reasons by value
  Future<PaginatedResponse<Map<String, dynamic>>> byValue(
    String value, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['value'] = value;

    return list(query: query, headers: headers);
  }
}
