import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin fulfillment provider management resource
class AdminFulfillmentProviderResource extends AdminResource {
  const AdminFulfillmentProviderResource(super.client);

  String get resourcePath => '$basePath/fulfillment-providers';

  /// List fulfillment providers
  Future<PaginatedResponse<FulfillmentProvider>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<FulfillmentProvider>(
      endpoint: resourcePath,
      dataKey: 'fulfillment_providers',
      fromJson: FulfillmentProvider.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a fulfillment provider by ID
  Future<FulfillmentProvider?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<FulfillmentProvider>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'fulfillment_provider',
      fromJson: FulfillmentProvider.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a fulfillment provider
  Future<FulfillmentProvider?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentProvider>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'fulfillment_provider',
      fromJson: FulfillmentProvider.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Install a fulfillment provider
  Future<FulfillmentProvider?> install(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentProvider>(
      id: id,
      body: {'is_installed': true},
      endpoint: '$resourcePath/$id/install',
      dataKey: 'fulfillment_provider',
      fromJson: FulfillmentProvider.fromJson,
      headers: headers,
    );
  }

  /// Uninstall a fulfillment provider
  Future<FulfillmentProvider?> uninstall(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentProvider>(
      id: id,
      body: {'is_installed': false},
      endpoint: '$resourcePath/$id/uninstall',
      dataKey: 'fulfillment_provider',
      fromJson: FulfillmentProvider.fromJson,
      headers: headers,
    );
  }

  /// List only installed fulfillment providers
  Future<PaginatedResponse<FulfillmentProvider>> listInstalled({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['is_installed'] = true;

    return list(query: query, headers: headers);
  }

  /// List only uninstalled fulfillment providers
  Future<PaginatedResponse<FulfillmentProvider>> listUninstalled({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['is_installed'] = false;

    return list(query: query, headers: headers);
  }

  /// Get fulfillment provider configuration
  Future<Map<String, dynamic>> getConfiguration(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/configuration',
      headers: headers,
    );
  }

  /// Test connection to fulfillment provider
  Future<Map<String, dynamic>> testConnection(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/test',
      method: 'POST',
      headers: headers,
    );
  }
}
