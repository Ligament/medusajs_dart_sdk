import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin notification resource for managing notifications
class AdminNotificationResource extends AdminResource {
  const AdminNotificationResource(super.client);

  String get resourcePath => '$basePath/notifications';

  /// List notifications
  Future<PaginatedResponse<Notification>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Notification>(
      endpoint: resourcePath,
      dataKey: 'notifications',
      fromJson: Notification.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a notification by ID
  Future<Notification?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<Notification>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'notification',
      fromJson: Notification.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Resend a notification
  Future<Notification?> resend(
    String id, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/resend',
      method: 'POST',
      body: body ?? {},
      query: query,
      headers: headers,
    );

    final notificationData = response['notification'] as Map<String, dynamic>?;
    return notificationData != null
        ? Notification.fromJson(notificationData)
        : null;
  }

  /// Mark notification as read
  Future<Notification?> markAsRead(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/read',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final notificationData = response['notification'] as Map<String, dynamic>?;
    return notificationData != null
        ? Notification.fromJson(notificationData)
        : null;
  }

  /// Mark notification as unread
  Future<Notification?> markAsUnread(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/unread',
      method: 'POST',
      query: query,
      headers: headers,
    );

    final notificationData = response['notification'] as Map<String, dynamic>?;
    return notificationData != null
        ? Notification.fromJson(notificationData)
        : null;
  }

  /// Get notifications by event
  Future<PaginatedResponse<Notification>> byEvent(
    String eventName, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['event_name'] = eventName;

    return list(query: query, headers: headers);
  }

  /// Get notifications by resource type
  Future<PaginatedResponse<Notification>> byResourceType(
    String resourceType, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['resource_type'] = resourceType;

    return list(query: query, headers: headers);
  }

  /// Get notifications by resource ID
  Future<PaginatedResponse<Notification>> byResourceId(
    String resourceId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['resource_id'] = resourceId;

    return list(query: query, headers: headers);
  }

  /// Get unread notifications
  Future<PaginatedResponse<Notification>> getUnread({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['is_read'] = false;

    return list(query: query, headers: headers);
  }

  /// Get read notifications
  Future<PaginatedResponse<Notification>> getRead({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['is_read'] = true;

    return list(query: query, headers: headers);
  }

  /// Get notifications by provider
  Future<PaginatedResponse<Notification>> byProvider(
    String providerId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['provider_id'] = providerId;

    return list(query: query, headers: headers);
  }

  /// Mark all notifications as read
  Future<Map<String, dynamic>> markAllAsRead({
    Map<String, dynamic>? filters,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/mark-all-read',
      method: 'POST',
      body: filters ?? {},
      headers: headers,
    );

    return response;
  }
}
