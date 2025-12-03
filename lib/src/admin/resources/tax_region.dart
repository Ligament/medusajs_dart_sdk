import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin tax region management resource
class AdminTaxRegionResource extends AdminResource {
  const AdminTaxRegionResource(super.client);

  String get resourcePath => '$basePath/tax-regions';

  /// List tax regions
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
        (response['tax_regions'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve a tax region by ID
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

    return response['tax_region'] as Map<String, dynamic>?;
  }

  /// Create a new tax region
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

    return response['tax_region'] as Map<String, dynamic>?;
  }

  /// Update a tax region
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

    return response['tax_region'] as Map<String, dynamic>?;
  }

  /// Delete a tax region
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

  /// Get tax region by country code
  Future<PaginatedResponse<Map<String, dynamic>>> byCountry(
    String countryCode, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['country_code'] = countryCode;

    return list(query: query, headers: headers);
  }

  /// Get tax region by province code
  Future<PaginatedResponse<Map<String, dynamic>>> byProvince(
    String provinceCode, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['province_code'] = provinceCode;

    return list(query: query, headers: headers);
  }

  /// Get tax rates for a tax region
  Future<PaginatedResponse<TaxRate>> getTaxRates(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<TaxRate>(
      endpoint: '$resourcePath/$id/tax-rates',
      dataKey: 'tax_rates',
      fromJson: TaxRate.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Add tax rates to a tax region
  Future<Map<String, dynamic>> addTaxRates(
    String id,
    List<String> taxRateIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/tax-rates',
      method: 'POST',
      body: {'tax_rate_ids': taxRateIds},
      headers: headers,
    );
  }

  /// Remove tax rates from a tax region
  Future<Map<String, dynamic>> removeTaxRates(
    String id,
    List<String> taxRateIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/tax-rates',
      method: 'DELETE',
      body: {'tax_rate_ids': taxRateIds},
      headers: headers,
    );
  }

  /// Get tax providers for a tax region
  Future<PaginatedResponse<Map<String, dynamic>>> getTaxProviders(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/tax-providers',
      query: query,
      headers: headers,
    );

    final items =
        (response['tax_providers'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Update tax providers for a tax region
  Future<Map<String, dynamic>> updateTaxProviders(
    String id,
    List<String> providerIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/tax-providers',
      method: 'POST',
      body: {'tax_provider_ids': providerIds},
      headers: headers,
    );
  }
}
