import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin product type management resource
class AdminProductTypeResource extends AdminResource {
  const AdminProductTypeResource(super.client);

  String get resourcePath => '$basePath/product-types';

  /// List product types
  Future<PaginatedResponse<ProductType>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ProductType>(
      endpoint: resourcePath,
      dataKey: 'product_types',
      fromJson: ProductType.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a product type by ID
  Future<ProductType?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ProductType>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_type',
      fromJson: ProductType.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new product type
  Future<ProductType?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ProductType>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'product_type',
      fromJson: ProductType.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a product type
  Future<ProductType?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ProductType>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_type',
      fromJson: ProductType.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a product type
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

  /// Search product types by value
  Future<PaginatedResponse<ProductType>> search(
    String searchTerm, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['q'] = searchTerm;

    return list(query: query, headers: headers);
  }

  /// Get product types by value filter
  Future<PaginatedResponse<ProductType>> byValue(
    String value, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['value'] = value;

    return list(query: query, headers: headers);
  }
}
