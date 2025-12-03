import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin claim management resource
class AdminClaimResource extends AdminResource {
  const AdminClaimResource(super.client);

  String get resourcePath => '$basePath/claims';

  /// List claims
  Future<PaginatedResponse<ClaimOrder>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ClaimOrder>(
      endpoint: resourcePath,
      dataKey: 'claims',
      fromJson: ClaimOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a claim by ID
  Future<ClaimOrder?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ClaimOrder>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new claim
  Future<ClaimOrder?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ClaimOrder>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a claim
  Future<ClaimOrder?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ClaimOrder>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a claim
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

  /// Cancel a claim
  Future<ClaimOrder?> cancel(String id, {ClientHeaders? headers}) async {
    return await updateGeneric<ClaimOrder>(
      id: id,
      body: {'canceled_at': DateTime.now().toIso8601String()},
      endpoint: '$resourcePath/$id/cancel',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      headers: headers,
    );
  }

  /// Process a claim
  Future<ClaimOrder?> process(
    String id, {
    Map<String, dynamic>? processData,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ClaimOrder>(
      id: id,
      body: processData ?? {},
      endpoint: '$resourcePath/$id/process',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      headers: headers,
    );
  }

  /// List claims by order
  Future<PaginatedResponse<ClaimOrder>> byOrder(
    String orderId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['order_id'] = orderId;

    return list(query: query, headers: headers);
  }

  /// List claims by status
  Future<PaginatedResponse<ClaimOrder>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// Add fulfillment to claim
  Future<ClaimOrder?> addFulfillment(
    String id,
    Map<String, dynamic> fulfillmentData, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ClaimOrder>(
      body: fulfillmentData,
      endpoint: '$resourcePath/$id/fulfillments',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      headers: headers,
    );
  }

  /// Add shipment to claim
  Future<ClaimOrder?> addShipment(
    String id,
    Map<String, dynamic> shipmentData, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ClaimOrder>(
      body: shipmentData,
      endpoint: '$resourcePath/$id/shipments',
      dataKey: 'claim',
      fromJson: ClaimOrder.fromJson,
      headers: headers,
    );
  }
}
