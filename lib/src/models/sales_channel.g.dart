// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesChannel _$SalesChannelFromJson(Map<String, dynamic> json) => SalesChannel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  isDisabled: json['is_disabled'] as bool? ?? false,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$SalesChannelToJson(SalesChannel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'is_disabled': instance.isDisabled,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CreateSalesChannelRequest _$CreateSalesChannelRequestFromJson(
  Map<String, dynamic> json,
) => CreateSalesChannelRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  isDisabled: json['is_disabled'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateSalesChannelRequestToJson(
  CreateSalesChannelRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'metadata': instance.metadata,
};

UpdateSalesChannelRequest _$UpdateSalesChannelRequestFromJson(
  Map<String, dynamic> json,
) => UpdateSalesChannelRequest(
  name: json['name'] as String?,
  description: json['description'] as String?,
  isDisabled: json['is_disabled'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateSalesChannelRequestToJson(
  UpdateSalesChannelRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'is_disabled': instance.isDisabled,
  'metadata': instance.metadata,
};
