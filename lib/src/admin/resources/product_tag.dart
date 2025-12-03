import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin product tag management resource
class AdminProductTagResource extends AdminResource {
  const AdminProductTagResource(super.client);

  String get resourcePath => '$basePath/product-tags';

  /// List product tags
  Future<PaginatedResponse<ProductTag>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ProductTag>(
      endpoint: resourcePath,
      dataKey: 'product_tags',
      fromJson: ProductTag.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a product tag by ID
  Future<ProductTag?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ProductTag>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_tag',
      fromJson: ProductTag.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new product tag
  Future<ProductTag?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ProductTag>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'product_tag',
      fromJson: ProductTag.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a product tag
  Future<ProductTag?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ProductTag>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'product_tag',
      fromJson: ProductTag.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a product tag
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

  /// Search product tags by value
  Future<PaginatedResponse<ProductTag>> search(
    String searchTerm, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['q'] = searchTerm;

    return list(query: query, headers: headers);
  }

  /// Get product tags by value filter
  Future<PaginatedResponse<ProductTag>> byValue(
    String value, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['value'] = value;

    return list(query: query, headers: headers);
  }
}
