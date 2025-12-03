import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin inventory management resource
class AdminInventoryResource extends AdminResource {
  const AdminInventoryResource(super.client);

  String get resourcePath => '$basePath/inventory-items';

  /// List inventory items
  Future<PaginatedResponse<InventoryItem>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<InventoryItem>(
      endpoint: resourcePath,
      dataKey: 'inventory_items',
      fromJson: InventoryItem.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve an inventory item by ID
  Future<InventoryItem?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<InventoryItem>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'inventory_item',
      fromJson: InventoryItem.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new inventory item
  Future<InventoryItem?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<InventoryItem>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'inventory_item',
      fromJson: InventoryItem.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update an inventory item
  Future<InventoryItem?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<InventoryItem>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'inventory_item',
      fromJson: InventoryItem.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete an inventory item
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

  /// Get inventory levels for an item
  Future<PaginatedResponse<Map<String, dynamic>>> getLevels(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/location-levels',
      query: query,
      headers: headers,
    );

    return PaginatedResponse(
      data: List<Map<String, dynamic>>.from(response['inventory_levels'] ?? []),
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Update inventory level at location
  Future<InventoryItem?> updateLevel(
    String id,
    String locationId,
    Map<String, dynamic> body, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/location-levels/$locationId',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final itemData = response['inventory_item'];
    return itemData != null
        ? InventoryItem.fromJson(itemData as Map<String, dynamic>)
        : null;
  }

  /// Create inventory level at location
  Future<InventoryItem?> createLevel(
    String id,
    Map<String, dynamic> body, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/location-levels',
      method: 'POST',
      body: body,
      headers: headers,
    );

    final itemData = response['inventory_item'];
    return itemData != null
        ? InventoryItem.fromJson(itemData as Map<String, dynamic>)
        : null;
  }

  /// Delete inventory level at location
  Future<InventoryItem?> deleteLevel(
    String id,
    String locationId, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/location-levels/$locationId',
      method: 'DELETE',
      headers: headers,
    );

    final itemData = response['inventory_item'];
    return itemData != null
        ? InventoryItem.fromJson(itemData as Map<String, dynamic>)
        : null;
  }

  /// Create reservation
  Future<Map<String, dynamic>> createReservation(
    String id,
    Map<String, dynamic> body, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/reservations',
      method: 'POST',
      body: body,
      headers: headers,
    );
  }

  /// Update reservation
  Future<Map<String, dynamic>> updateReservation(
    String id,
    String reservationId,
    Map<String, dynamic> body, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/reservations/$reservationId',
      method: 'POST',
      body: body,
      headers: headers,
    );
  }

  /// Delete reservation
  Future<Map<String, dynamic>> deleteReservation(
    String id,
    String reservationId, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/reservations/$reservationId',
      method: 'DELETE',
      headers: headers,
    );
  }
}
