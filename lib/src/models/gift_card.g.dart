// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GiftCard _$GiftCardFromJson(Map<String, dynamic> json) => GiftCard(
  id: json['id'] as String,
  code: json['code'] as String,
  value: (json['value'] as num).toInt(),
  balance: (json['balance'] as num).toInt(),
  regionId: json['region_id'] as String?,
  orderId: json['order_id'] as String?,
  isDisabled: json['is_disabled'] as bool? ?? false,
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$GiftCardToJson(GiftCard instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'value': instance.value,
  'balance': instance.balance,
  'region_id': instance.regionId,
  'order_id': instance.orderId,
  'is_disabled': instance.isDisabled,
  'ends_at': instance.endsAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'metadata': instance.metadata,
};
