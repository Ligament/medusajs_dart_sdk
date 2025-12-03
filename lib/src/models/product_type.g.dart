// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductType _$ProductTypeFromJson(Map<String, dynamic> json) => ProductType(
  id: json['id'] as String,
  value: json['value'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ProductTypeToJson(ProductType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CreateProductTypeRequest _$CreateProductTypeRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductTypeRequest(
  value: json['value'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateProductTypeRequestToJson(
  CreateProductTypeRequest instance,
) => <String, dynamic>{'value': instance.value, 'metadata': instance.metadata};

UpdateProductTypeRequest _$UpdateProductTypeRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductTypeRequest(
  value: json['value'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateProductTypeRequestToJson(
  UpdateProductTypeRequest instance,
) => <String, dynamic>{'value': instance.value, 'metadata': instance.metadata};
