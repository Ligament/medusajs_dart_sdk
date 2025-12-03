// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
  id: json['id'] as String,
  code: json['code'] as String,
  isDynamic: json['is_dynamic'] as bool? ?? false,
  ruleId: json['rule_id'] as String?,
  isDisabled: json['is_disabled'] as bool? ?? false,
  parentDiscountId: json['parent_discount_id'] as String?,
  usageLimit: (json['usage_limit'] as num?)?.toInt(),
  usageCount: (json['usage_count'] as num?)?.toInt() ?? 0,
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
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

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'is_dynamic': instance.isDynamic,
  'rule_id': instance.ruleId,
  'is_disabled': instance.isDisabled,
  'parent_discount_id': instance.parentDiscountId,
  'usage_limit': instance.usageLimit,
  'usage_count': instance.usageCount,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
  'metadata': instance.metadata,
};
