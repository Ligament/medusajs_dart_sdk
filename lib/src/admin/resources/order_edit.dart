import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin order edit resource for managing order edits
class AdminOrderEditResource extends AdminResource {
  const AdminOrderEditResource(super.client);

  String get resourcePath => '$basePath/order-edits';

  /// List order edits
  Future<PaginatedResponse<OrderEdit>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<OrderEdit>(
      endpoint: resourcePath,
      dataKey: 'order_edits',
      fromJson: OrderEdit.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve an order edit by ID
  Future<OrderEdit?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<OrderEdit>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'order_edit',
      fromJson: OrderEdit.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create an order edit
  Future<OrderEdit?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<OrderEdit>(
      endpoint: resourcePath,
      body: body,
      dataKey: 'order_edit',
      fromJson: OrderEdit.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update an order edit
  Future<OrderEdit?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<OrderEdit>(
      id: id,
      endpoint: '$resourcePath/$id',
      body: body,
      dataKey: 'order_edit',
      fromJson: OrderEdit.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete an order edit
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

  /// Confirm an order edit
  Future<OrderEdit?> confirm(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/confirm',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Cancel an order edit
  Future<OrderEdit?> cancel(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/cancel',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Request confirmation for an order edit
  Future<OrderEdit?> requestConfirmation(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/request',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Add line item to order edit
  Future<OrderEdit?> addLineItem(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/items',
      method: 'POST',
      body: body,
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Update line item in order edit
  Future<OrderEdit?> updateLineItem(
    String id,
    String itemId,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/items/$itemId',
      method: 'POST',
      body: body,
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Remove line item from order edit
  Future<OrderEdit?> removeLineItem(
    String id,
    String itemId, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/items/$itemId',
      method: 'DELETE',
      query: query,
      headers: headers,
    );

    final orderEditData = response['order_edit'] as Map<String, dynamic>?;
    return orderEditData != null ? OrderEdit.fromJson(orderEditData) : null;
  }

  /// Get order edits by order ID
  Future<PaginatedResponse<OrderEdit>> byOrder(
    String orderId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['order_id'] = orderId;

    return list(query: query, headers: headers);
  }

  /// Get order edits by status
  Future<PaginatedResponse<OrderEdit>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }
}
