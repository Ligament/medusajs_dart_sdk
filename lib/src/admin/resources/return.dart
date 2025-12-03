import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin return management resource
class AdminReturnResource extends AdminResource {
  const AdminReturnResource(super.client);

  String get resourcePath => '$basePath/returns';

  /// List returns
  Future<PaginatedResponse<Return>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Return>(
      endpoint: resourcePath,
      dataKey: 'returns',
      fromJson: Return.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a return by ID
  Future<Return?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<Return>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'return',
      fromJson: Return.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new return
  Future<Return?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<Return>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'return',
      fromJson: Return.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a return
  Future<Return?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<Return>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'return',
      fromJson: Return.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a return
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

  /// Get returns by order ID
  Future<PaginatedResponse<Return>> byOrder(
    String orderId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['order_id'] = orderId;

    return list(query: query, headers: headers);
  }

  /// Get returns by status
  Future<PaginatedResponse<Return>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// Cancel a return
  Future<Return?> cancel(String id, {ClientHeaders? headers}) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/cancel',
      method: 'POST',
      headers: headers,
    );

    final data = response['return'];
    return data != null ? Return.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Receive a return
  Future<Return?> receive(
    String id,
    Map<String, dynamic> receiveData, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/receive',
      method: 'POST',
      body: receiveData,
      headers: headers,
    );

    final data = response['return'];
    return data != null ? Return.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Add items to a return
  Future<Return?> addItems(
    String id,
    List<Map<String, dynamic>> items, {
    ClientHeaders? headers,
  }) async {
    final body = <String, dynamic>{'items': items};

    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/items',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final data = response['return'];
    return data != null ? Return.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Remove items from a return
  Future<Return?> removeItems(
    String id,
    List<String> itemIds, {
    ClientHeaders? headers,
  }) async {
    final body = <String, dynamic>{'item_ids': itemIds};

    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/items',
      method: 'DELETE',
      body: body,
      headers: headers,
    );

    final data = response['return'];
    return data != null ? Return.fromJson(data as Map<String, dynamic>) : null;
  }
}
