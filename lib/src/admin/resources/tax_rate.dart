import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin tax rate management resource
class AdminTaxRateResource extends AdminResource {
  const AdminTaxRateResource(super.client);

  String get resourcePath => '$basePath/tax-rates';

  /// List tax rates
  Future<PaginatedResponse<TaxRate>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<TaxRate>(
      endpoint: resourcePath,
      dataKey: 'tax_rates',
      fromJson: TaxRate.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a tax rate by ID
  Future<TaxRate?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<TaxRate>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'tax_rate',
      fromJson: TaxRate.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new tax rate
  Future<TaxRate?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<TaxRate>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'tax_rate',
      fromJson: TaxRate.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a tax rate
  Future<TaxRate?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<TaxRate>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'tax_rate',
      fromJson: TaxRate.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a tax rate
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

  /// Get tax rates by region
  Future<PaginatedResponse<TaxRate>> byRegion(
    String regionId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['region_id'] = regionId;

    return list(query: query, headers: headers);
  }

  /// Get tax rates by tax provider
  Future<PaginatedResponse<TaxRate>> byProvider(
    String providerId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['tax_provider_id'] = providerId;

    return list(query: query, headers: headers);
  }

  /// Get tax rates by product type
  Future<PaginatedResponse<TaxRate>> byProductType(
    String productTypeId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['product_type_id'] = productTypeId;

    return list(query: query, headers: headers);
  }

  /// Get tax rates by shipping option
  Future<PaginatedResponse<TaxRate>> byShippingOption(
    String shippingOptionId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['shipping_option_id'] = shippingOptionId;

    return list(query: query, headers: headers);
  }

  /// Add products to a tax rate
  Future<Map<String, dynamic>> addProducts(
    String id,
    List<String> productIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/products/batch',
      method: 'POST',
      body: {'add': productIds},
      headers: headers,
    );
  }

  /// Remove products from a tax rate
  Future<Map<String, dynamic>> removeProducts(
    String id,
    List<String> productIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/products/batch',
      method: 'POST',
      body: {'remove': productIds},
      headers: headers,
    );
  }

  /// Add product types to a tax rate
  Future<Map<String, dynamic>> addProductTypes(
    String id,
    List<String> productTypeIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/product-types/batch',
      method: 'POST',
      body: {'add': productTypeIds},
      headers: headers,
    );
  }

  /// Remove product types from a tax rate
  Future<Map<String, dynamic>> removeProductTypes(
    String id,
    List<String> productTypeIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/product-types/batch',
      method: 'POST',
      body: {'remove': productTypeIds},
      headers: headers,
    );
  }
}
