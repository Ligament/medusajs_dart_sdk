// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reservation _$ReservationFromJson(Map<String, dynamic> json) => Reservation(
  id: json['id'] as String,
  inventoryItemId: json['inventory_item_id'] as String,
  locationId: json['location_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  orderId: json['order_id'] as String?,
  lineItemId: json['line_item_id'] as String?,
  description: json['description'] as String?,
  type: $enumDecodeNullable(_$ReservationTypeEnumMap, json['type']),
  externalId: json['external_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ReservationToJson(Reservation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inventory_item_id': instance.inventoryItemId,
      'location_id': instance.locationId,
      'quantity': instance.quantity,
      'order_id': instance.orderId,
      'line_item_id': instance.lineItemId,
      'description': instance.description,
      'type': _$ReservationTypeEnumMap[instance.type],
      'external_id': instance.externalId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$ReservationTypeEnumMap = {
  ReservationType.order: 'order',
  ReservationType.exchange: 'exchange',
  ReservationType.returnType: 'return',
  ReservationType.draftOrder: 'draft_order',
  ReservationType.other: 'other',
};

CreateReservationRequest _$CreateReservationRequestFromJson(
  Map<String, dynamic> json,
) => CreateReservationRequest(
  inventoryItemId: json['inventory_item_id'] as String,
  locationId: json['location_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  orderId: json['order_id'] as String?,
  lineItemId: json['line_item_id'] as String?,
  description: json['description'] as String?,
  type: $enumDecodeNullable(_$ReservationTypeEnumMap, json['type']),
  externalId: json['external_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateReservationRequestToJson(
  CreateReservationRequest instance,
) => <String, dynamic>{
  'inventory_item_id': instance.inventoryItemId,
  'location_id': instance.locationId,
  'quantity': instance.quantity,
  'order_id': instance.orderId,
  'line_item_id': instance.lineItemId,
  'description': instance.description,
  'type': _$ReservationTypeEnumMap[instance.type],
  'external_id': instance.externalId,
  'metadata': instance.metadata,
};

UpdateReservationRequest _$UpdateReservationRequestFromJson(
  Map<String, dynamic> json,
) => UpdateReservationRequest(
  locationId: json['location_id'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  description: json['description'] as String?,
  externalId: json['external_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateReservationRequestToJson(
  UpdateReservationRequest instance,
) => <String, dynamic>{
  'location_id': instance.locationId,
  'quantity': instance.quantity,
  'description': instance.description,
  'external_id': instance.externalId,
  'metadata': instance.metadata,
};

ReservationResponse _$ReservationResponseFromJson(Map<String, dynamic> json) =>
    ReservationResponse(
      reservation: Reservation.fromJson(
        json['reservation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ReservationResponseToJson(
  ReservationResponse instance,
) => <String, dynamic>{'reservation': instance.reservation};

ReservationsResponse _$ReservationsResponseFromJson(
  Map<String, dynamic> json,
) => ReservationsResponse(
  reservations: (json['reservations'] as List<dynamic>)
      .map((e) => Reservation.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$ReservationsResponseToJson(
  ReservationsResponse instance,
) => <String, dynamic>{
  'reservations': instance.reservations,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};
