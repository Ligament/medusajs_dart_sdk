// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationProvider _$NotificationProviderFromJson(
  Map<String, dynamic> json,
) => NotificationProvider(
  id: json['id'] as String,
  isInstalled: json['is_installed'] as bool,
);

Map<String, dynamic> _$NotificationProviderToJson(
  NotificationProvider instance,
) => <String, dynamic>{'id': instance.id, 'is_installed': instance.isInstalled};

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
  id: json['id'] as String,
  to: json['to'] as String?,
  channel: json['channel'] as String?,
  template: json['template'] as String?,
  providerId: json['provider_id'] as String?,
  provider: json['provider'] == null
      ? null
      : NotificationProvider.fromJson(json['provider'] as Map<String, dynamic>),
  data: json['data'] as Map<String, dynamic>?,
  parentId: json['parent_id'] as String?,
  parentNotificationId: json['parent_notification_id'] as String?,
  status: $enumDecode(_$NotificationStatusEnumMap, json['status']),
  resourceType: json['resource_type'] as String?,
  resourceId: json['resource_id'] as String?,
  customerId: json['customer_id'] as String?,
  eventName: json['event_name'] as String?,
  attempts: (json['attempts'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  nextRetry: json['next_retry'] == null
      ? null
      : DateTime.parse(json['next_retry'] as String),
  externalId: json['external_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'to': instance.to,
      'channel': instance.channel,
      'template': instance.template,
      'provider_id': instance.providerId,
      'provider': instance.provider,
      'data': instance.data,
      'parent_id': instance.parentId,
      'parent_notification_id': instance.parentNotificationId,
      'status': _$NotificationStatusEnumMap[instance.status]!,
      'resource_type': instance.resourceType,
      'resource_id': instance.resourceId,
      'customer_id': instance.customerId,
      'event_name': instance.eventName,
      'attempts': instance.attempts,
      'next_retry': instance.nextRetry?.toIso8601String(),
      'external_id': instance.externalId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$NotificationStatusEnumMap = {
  NotificationStatus.pending: 'pending',
  NotificationStatus.sent: 'sent',
  NotificationStatus.failed: 'failed',
};

SendNotificationRequest _$SendNotificationRequestFromJson(
  Map<String, dynamic> json,
) => SendNotificationRequest(
  to: json['to'] as String,
  channel: json['channel'] as String,
  template: json['template'] as String,
  providerId: json['provider_id'] as String?,
  data: json['data'] as Map<String, dynamic>?,
  resourceType: json['resource_type'] as String?,
  resourceId: json['resource_id'] as String?,
  customerId: json['customer_id'] as String?,
  eventName: json['event_name'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SendNotificationRequestToJson(
  SendNotificationRequest instance,
) => <String, dynamic>{
  'to': instance.to,
  'channel': instance.channel,
  'template': instance.template,
  'provider_id': instance.providerId,
  'data': instance.data,
  'resource_type': instance.resourceType,
  'resource_id': instance.resourceId,
  'customer_id': instance.customerId,
  'event_name': instance.eventName,
  'metadata': instance.metadata,
};

ResendNotificationRequest _$ResendNotificationRequestFromJson(
  Map<String, dynamic> json,
) => ResendNotificationRequest(
  to: json['to'] as String?,
  data: json['data'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ResendNotificationRequestToJson(
  ResendNotificationRequest instance,
) => <String, dynamic>{'to': instance.to, 'data': instance.data};

NotificationResponse _$NotificationResponseFromJson(
  Map<String, dynamic> json,
) => NotificationResponse(
  notification: Notification.fromJson(
    json['notification'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$NotificationResponseToJson(
  NotificationResponse instance,
) => <String, dynamic>{'notification': instance.notification};

NotificationsResponse _$NotificationsResponseFromJson(
  Map<String, dynamic> json,
) => NotificationsResponse(
  notifications: (json['notifications'] as List<dynamic>)
      .map((e) => Notification.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$NotificationsResponseToJson(
  NotificationsResponse instance,
) => <String, dynamic>{
  'notifications': instance.notifications,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};

NotificationProvidersResponse _$NotificationProvidersResponseFromJson(
  Map<String, dynamic> json,
) => NotificationProvidersResponse(
  notificationProviders: (json['notification_providers'] as List<dynamic>)
      .map((e) => NotificationProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NotificationProvidersResponseToJson(
  NotificationProvidersResponse instance,
) => <String, dynamic>{
  'notification_providers': instance.notificationProviders,
};
