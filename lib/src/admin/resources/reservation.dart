import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin reservation management resource
class AdminReservationResource extends AdminResource {
  const AdminReservationResource(super.client);

  String get resourcePath => '$basePath/reservations';

  /// List reservations
  Future<PaginatedResponse<Reservation>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Reservation>(
      endpoint: resourcePath,
      dataKey: 'reservations',
      fromJson: Reservation.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a reservation by ID
  Future<Reservation?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<Reservation>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'reservation',
      fromJson: Reservation.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new reservation
  Future<Reservation?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<Reservation>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'reservation',
      fromJson: Reservation.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a reservation
  Future<Reservation?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<Reservation>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'reservation',
      fromJson: Reservation.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a reservation
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

  /// Get reservations by inventory item ID
  Future<PaginatedResponse<Reservation>> byInventoryItem(
    String inventoryItemId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['inventory_item_id'] = inventoryItemId;

    return list(query: query, headers: headers);
  }

  /// Get reservations by location ID
  Future<PaginatedResponse<Reservation>> byLocation(
    String locationId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['location_id'] = locationId;

    return list(query: query, headers: headers);
  }

  /// Get reservations by line item ID
  Future<PaginatedResponse<Reservation>> byLineItem(
    String lineItemId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['line_item_id'] = lineItemId;

    return list(query: query, headers: headers);
  }

  /// Get reservations by metadata
  Future<PaginatedResponse<Reservation>> byMetadata(
    Map<String, dynamic> metadata, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['metadata'] = metadata;

    return list(query: query, headers: headers);
  }

  /// Update reservation quantity
  Future<Reservation?> updateQuantity(
    String id,
    int quantity, {
    ClientHeaders? headers,
  }) async {
    final body = <String, dynamic>{'quantity': quantity};

    return await updateGeneric<Reservation>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'reservation',
      fromJson: Reservation.fromJson,
      headers: headers,
    );
  }
}
