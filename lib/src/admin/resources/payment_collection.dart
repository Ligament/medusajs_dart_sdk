import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin payment collection resource for managing payment collections
class AdminPaymentCollectionResource extends AdminResource {
  const AdminPaymentCollectionResource(super.client);

  String get resourcePath => '$basePath/payment-collections';

  /// List payment collections
  Future<PaginatedResponse<PaymentCollection>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<PaymentCollection>(
      endpoint: resourcePath,
      dataKey: 'payment_collections',
      fromJson: PaymentCollection.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a payment collection by ID
  Future<PaymentCollection?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<PaymentCollection>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'payment_collection',
      fromJson: PaymentCollection.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a payment collection
  Future<PaymentCollection?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<PaymentCollection>(
      id: id,
      endpoint: '$resourcePath/$id',
      body: body,
      dataKey: 'payment_collection',
      fromJson: PaymentCollection.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a payment collection
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

  /// Mark payment collection as authorized
  Future<PaymentCollection?> markAuthorized(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/authorize',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final collectionData =
        response['payment_collection'] as Map<String, dynamic>?;
    return collectionData != null
        ? PaymentCollection.fromJson(collectionData)
        : null;
  }
}
