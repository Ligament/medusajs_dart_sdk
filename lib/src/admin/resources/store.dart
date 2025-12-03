import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin store management resource
class AdminStoreResource extends AdminResource {
  const AdminStoreResource(super.client);

  String get resourcePath => '$basePath/store';

  /// Retrieve store details
  Future<Map<String, dynamic>?> retrieve({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      query: query,
      headers: headers,
    );

    return response['store'] as Map<String, dynamic>?;
  }

  /// Update store details
  Future<Map<String, dynamic>?> update(
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

    return response['store'] as Map<String, dynamic>?;
  }

  /// Get store currencies
  Future<PaginatedResponse<Currency>> getCurrencies({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Currency>(
      endpoint: '$resourcePath/currencies',
      dataKey: 'currencies',
      fromJson: Currency.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Add currencies to store
  Future<Map<String, dynamic>> addCurrencies(
    List<String> currencyCodes, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/currencies',
      method: 'POST',
      body: {'currency_codes': currencyCodes},
      headers: headers,
    );
  }

  /// Remove currencies from store
  Future<Map<String, dynamic>> removeCurrencies(
    List<String> currencyCodes, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/currencies',
      method: 'DELETE',
      body: {'currency_codes': currencyCodes},
      headers: headers,
    );
  }

  /// Get store payment providers
  Future<PaginatedResponse<Map<String, dynamic>>> getPaymentProviders({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/payment-providers',
      query: query,
      headers: headers,
    );

    final items =
        (response['payment_providers'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: items,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Get store tax providers
  Future<PaginatedResponse<Map<String, dynamic>>> getTaxProviders({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/tax-providers',
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

  /// Update store payment providers
  Future<Map<String, dynamic>> updatePaymentProviders(
    List<String> providerIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/payment-providers',
      method: 'POST',
      body: {'payment_providers': providerIds},
      headers: headers,
    );
  }

  /// Update store tax providers
  Future<Map<String, dynamic>> updateTaxProviders(
    List<String> providerIds, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/tax-providers',
      method: 'POST',
      body: {'tax_providers': providerIds},
      headers: headers,
    );
  }
}
