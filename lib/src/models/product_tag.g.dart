// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductTag _$ProductTagFromJson(Map<String, dynamic> json) => ProductTag(
  id: json['id'] as String,
  value: json['value'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ProductTagToJson(ProductTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CreateProductTagRequest _$CreateProductTagRequestFromJson(
  Map<String, dynamic> json,
) => CreateProductTagRequest(
  value: json['value'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateProductTagRequestToJson(
  CreateProductTagRequest instance,
) => <String, dynamic>{'value': instance.value, 'metadata': instance.metadata};

UpdateProductTagRequest _$UpdateProductTagRequestFromJson(
  Map<String, dynamic> json,
) => UpdateProductTagRequest(
  value: json['value'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateProductTagRequestToJson(
  UpdateProductTagRequest instance,
) => <String, dynamic>{'value': instance.value, 'metadata': instance.metadata};
