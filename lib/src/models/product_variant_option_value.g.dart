// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_option_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVariantOptionValue _$ProductVariantOptionValueFromJson(
  Map<String, dynamic> json,
) => ProductVariantOptionValue(
  id: json['id'] as String,
  value: json['value'] as String,
  optionId: json['option_id'] as String,
  option: json['option'] == null
      ? null
      : ProductOption.fromJson(json['option'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ProductVariantOptionValueToJson(
  ProductVariantOptionValue instance,
) => <String, dynamic>{
  'id': instance.id,
  'value': instance.value,
  'option_id': instance.optionId,
  'option': instance.option,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};
