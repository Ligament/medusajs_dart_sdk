import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin draft order management resource
class AdminDraftOrderResource extends AdminResource {
  const AdminDraftOrderResource(super.client);

  String get resourcePath => '$basePath/draft-orders';

  /// List draft orders
  Future<PaginatedResponse<DraftOrder>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<DraftOrder>(
      endpoint: resourcePath,
      dataKey: 'draft_orders',
      fromJson: DraftOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a draft order by ID
  Future<DraftOrder?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<DraftOrder>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new draft order
  Future<DraftOrder?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<DraftOrder>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a draft order
  Future<DraftOrder?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<DraftOrder>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a draft order
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

  /// Complete a draft order (convert to order)
  Future<Order?> complete(String id, {ClientHeaders? headers}) async {
    return await createGeneric<Order>(
      body: {},
      endpoint: '$resourcePath/$id/complete',
      dataKey: 'order',
      fromJson: Order.fromJson,
      headers: headers,
    );
  }

  /// Register payment for draft order
  Future<DraftOrder?> registerPayment(
    String id,
    Map<String, dynamic> paymentData, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<DraftOrder>(
      body: paymentData,
      endpoint: '$resourcePath/$id/pay',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      headers: headers,
    );
  }

  /// Add line item to draft order
  Future<DraftOrder?> addLineItem(
    String id,
    Map<String, dynamic> lineItemData, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<DraftOrder>(
      body: lineItemData,
      endpoint: '$resourcePath/$id/line-items',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      headers: headers,
    );
  }

  /// Update line item in draft order
  Future<DraftOrder?> updateLineItem(
    String id,
    String lineItemId,
    Map<String, dynamic> updates, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<DraftOrder>(
      id: lineItemId,
      body: updates,
      endpoint: '$resourcePath/$id/line-items/$lineItemId',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      headers: headers,
    );
  }

  /// Remove line item from draft order
  Future<DraftOrder?> removeLineItem(
    String id,
    String lineItemId, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<DraftOrder>(
      id: lineItemId,
      body: {},
      endpoint: '$resourcePath/$id/line-items/$lineItemId',
      dataKey: 'draft_order',
      fromJson: DraftOrder.fromJson,
      headers: headers,
    );
  }

  /// List draft orders by status
  Future<PaginatedResponse<DraftOrder>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// List draft orders by customer
  Future<PaginatedResponse<DraftOrder>> byCustomer(
    String customerId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['customer_id'] = customerId;

    return list(query: query, headers: headers);
  }
}
