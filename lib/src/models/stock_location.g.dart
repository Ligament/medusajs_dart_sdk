// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockLocation _$StockLocationFromJson(Map<String, dynamic> json) =>
    StockLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$StockLocationToJson(StockLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CreateStockLocationRequest _$CreateStockLocationRequestFromJson(
  Map<String, dynamic> json,
) => CreateStockLocationRequest(
  name: json['name'] as String,
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateStockLocationRequestToJson(
  CreateStockLocationRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'metadata': instance.metadata,
};

UpdateStockLocationRequest _$UpdateStockLocationRequestFromJson(
  Map<String, dynamic> json,
) => UpdateStockLocationRequest(
  name: json['name'] as String?,
  address: json['address'] == null
      ? null
      : Address.fromJson(json['address'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateStockLocationRequestToJson(
  UpdateStockLocationRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'address': instance.address,
  'metadata': instance.metadata,
};
