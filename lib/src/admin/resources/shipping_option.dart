import '../../resources/base_resource.dart';
import '../../models/models.dart' hide ShippingOption;
import '../../types/types.dart';
import '../../models/fulfillment.dart' show ShippingOption;

/// Admin shipping option management resource
class AdminShippingOptionResource extends AdminResource {
  const AdminShippingOptionResource(super.client);

  String get resourcePath => '$basePath/shipping-options';

  /// List shipping options
  Future<PaginatedResponse<ShippingOption>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<ShippingOption>(
      endpoint: resourcePath,
      dataKey: 'shipping_options',
      fromJson: ShippingOption.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a shipping option by ID
  Future<ShippingOption?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<ShippingOption>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'shipping_option',
      fromJson: ShippingOption.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new shipping option
  Future<ShippingOption?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<ShippingOption>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'shipping_option',
      fromJson: ShippingOption.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a shipping option
  Future<ShippingOption?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<ShippingOption>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'shipping_option',
      fromJson: ShippingOption.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a shipping option
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

  /// Get shipping options by region
  Future<PaginatedResponse<ShippingOption>> byRegion(
    String regionId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['region_id'] = regionId;

    return list(query: query, headers: headers);
  }

  /// Get shipping options by fulfillment provider
  Future<PaginatedResponse<ShippingOption>> byProvider(
    String providerId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['provider_id'] = providerId;

    return list(query: query, headers: headers);
  }

  /// Get shipping options by shipping profile
  Future<PaginatedResponse<ShippingOption>> byProfile(
    String profileId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['shipping_profile_id'] = profileId;

    return list(query: query, headers: headers);
  }
}
