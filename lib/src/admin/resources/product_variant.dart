import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin product variant management resource
class AdminProductVariantResource extends AdminResource {
  const AdminProductVariantResource(super.client);

  String get resourcePath => '$basePath/product-variants';

  /// List product variants
  Future<PaginatedResponse<ProductVariant>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ProductVariant>(
      endpoint: resourcePath,
      dataKey: 'product_variants',
      fromJson: ProductVariant.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a product variant by ID
  Future<ProductVariant?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ProductVariant>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_variant',
      fromJson: ProductVariant.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new product variant
  Future<ProductVariant?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ProductVariant>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'product_variant',
      fromJson: ProductVariant.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a product variant
  Future<ProductVariant?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ProductVariant>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_variant',
      fromJson: ProductVariant.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a product variant
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

  /// Get variants by product ID
  Future<PaginatedResponse<ProductVariant>> byProduct(
    String productId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['product_id'] = productId;

    return list(query: query, headers: headers);
  }

  /// Get variants by SKU
  Future<PaginatedResponse<ProductVariant>> bySku(
    String sku, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['sku'] = sku;

    return list(query: query, headers: headers);
  }

  /// Update variant inventory quantity
  Future<ProductVariant?> updateInventory(
    String id,
    int quantity, {
    String? locationId,
    ClientHeaders? headers,
  }) async {
    final body = <String, dynamic>{'quantity': quantity};

    if (locationId != null) {
      body['location_id'] = locationId;
    }

    return await client
        .fetch<Map<String, dynamic>>(
          '$resourcePath/$id/inventory',
          method: 'POST',
          body: body,
          headers: headers,
        )
        .then((response) {
          final data = response['product_variant'];
          return data != null
              ? ProductVariant.fromJson(data as Map<String, dynamic>)
              : null;
        });
  }

  /// Get variant inventory levels
  Future<Map<String, dynamic>> getInventory(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/inventory',
      headers: headers,
    );
  }
}
