import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Fulfillment set model
class FulfillmentSet {
  final String id;
  final String name;
  final String type;
  final List<String> locationIds;
  final Map<String, dynamic>? metadata;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  const FulfillmentSet({
    required this.id,
    required this.name,
    required this.type,
    required this.locationIds,
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory FulfillmentSet.fromJson(Map<String, dynamic> json) {
    return FulfillmentSet(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      locationIds:
          (json['location_ids'] as List?)?.map((e) => e as String).toList() ??
          [],
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt:
          json['deleted_at'] != null
              ? DateTime.parse(json['deleted_at'] as String)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'location_ids': locationIds,
      if (metadata != null) 'metadata': metadata,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      if (deletedAt != null) 'deleted_at': deletedAt!.toIso8601String(),
    };
  }
}

/// Admin fulfillment set management resource
class AdminFulfillmentSetResource extends AdminResource {
  const AdminFulfillmentSetResource(super.client);

  String get resourcePath => '$basePath/fulfillment-sets';

  /// List fulfillment sets
  Future<PaginatedResponse<FulfillmentSet>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<FulfillmentSet>(
      endpoint: resourcePath,
      dataKey: 'fulfillment_sets',
      fromJson: FulfillmentSet.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a fulfillment set by ID
  Future<FulfillmentSet?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<FulfillmentSet>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new fulfillment set
  Future<FulfillmentSet?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<FulfillmentSet>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a fulfillment set
  Future<FulfillmentSet?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentSet>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a fulfillment set
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

  /// Add location to fulfillment set
  Future<FulfillmentSet?> addLocation(
    String id,
    String locationId, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<FulfillmentSet>(
      body: {'location_id': locationId},
      endpoint: '$resourcePath/$id/locations',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      headers: headers,
    );
  }

  /// Remove location from fulfillment set
  Future<FulfillmentSet?> removeLocation(
    String id,
    String locationId, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentSet>(
      id: locationId,
      body: {},
      endpoint: '$resourcePath/$id/locations/$locationId',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      headers: headers,
    );
  }

  /// List fulfillment sets by type
  Future<PaginatedResponse<FulfillmentSet>> byType(
    String type, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['type'] = type;

    return list(query: query, headers: headers);
  }

  /// List fulfillment sets by location
  Future<PaginatedResponse<FulfillmentSet>> byLocation(
    String locationId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['location_id'] = locationId;

    return list(query: query, headers: headers);
  }

  /// Get service zones for fulfillment set
  Future<List<Map<String, dynamic>>> getServiceZones(
    String id, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/service-zones',
      headers: headers,
    );

    return (response['service_zones'] as List?)
            ?.map((e) => e as Map<String, dynamic>)
            .toList() ??
        [];
  }

  /// Add service zone to fulfillment set
  Future<FulfillmentSet?> addServiceZone(
    String id,
    Map<String, dynamic> serviceZoneData, {
    ClientHeaders? headers,
  }) async {
    return await createGeneric<FulfillmentSet>(
      body: serviceZoneData,
      endpoint: '$resourcePath/$id/service-zones',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      headers: headers,
    );
  }

  /// Update service zone in fulfillment set
  Future<FulfillmentSet?> updateServiceZone(
    String id,
    String serviceZoneId,
    Map<String, dynamic> updates, {
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<FulfillmentSet>(
      id: serviceZoneId,
      body: updates,
      endpoint: '$resourcePath/$id/service-zones/$serviceZoneId',
      dataKey: 'fulfillment_set',
      fromJson: FulfillmentSet.fromJson,
      headers: headers,
    );
  }

  /// Remove service zone from fulfillment set
  Future<Map<String, dynamic>> removeServiceZone(
    String id,
    String serviceZoneId, {
    ClientHeaders? headers,
  }) async {
    return await deleteGeneric(
      id: serviceZoneId,
      endpoint: '$resourcePath/$id/service-zones/$serviceZoneId',
      headers: headers,
    );
  }
}
