// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fulfillment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fulfillment _$FulfillmentFromJson(Map<String, dynamic> json) => Fulfillment(
  id: json['id'] as String,
  locationId: json['location_id'] as String?,
  packedAt: json['packed_at'] as bool? ?? false,
  shippedAt: json['shipped_at'] as bool? ?? false,
  deliveredAt: json['delivered_at'] as bool? ?? false,
  canceledAt: json['canceled_at'] as bool? ?? false,
  data: json['data'] as Map<String, dynamic>?,
  providerId: json['provider_id'] as String,
  shippingOptionId: json['shipping_option_id'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$FulfillmentToJson(Fulfillment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location_id': instance.locationId,
      'packed_at': instance.packedAt,
      'shipped_at': instance.shippedAt,
      'delivered_at': instance.deliveredAt,
      'canceled_at': instance.canceledAt,
      'data': instance.data,
      'provider_id': instance.providerId,
      'shipping_option_id': instance.shippingOptionId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

ShippingOption _$ShippingOptionFromJson(Map<String, dynamic> json) =>
    ShippingOption(
      id: json['id'] as String,
      name: json['name'] as String,
      priceType: json['price_type'] as String,
      serviceZoneId: json['service_zone_id'] as String?,
      shippingProfileId: json['shipping_profile_id'] as String?,
      providerId: json['provider_id'] as String?,
      typeId: json['type_id'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$ShippingOptionToJson(ShippingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price_type': instance.priceType,
      'service_zone_id': instance.serviceZoneId,
      'shipping_profile_id': instance.shippingProfileId,
      'provider_id': instance.providerId,
      'type_id': instance.typeId,
      'data': instance.data,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

ShippingProfile _$ShippingProfileFromJson(Map<String, dynamic> json) =>
    ShippingProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$ShippingProfileToJson(ShippingProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

ShippingOptionType _$ShippingOptionTypeFromJson(Map<String, dynamic> json) =>
    ShippingOptionType(
      id: json['id'] as String,
      label: json['label'] as String,
      description: json['description'] as String?,
      code: json['code'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$ShippingOptionTypeToJson(ShippingOptionType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'code': instance.code,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CreateShippingOptionTypeRequest _$CreateShippingOptionTypeRequestFromJson(
  Map<String, dynamic> json,
) => CreateShippingOptionTypeRequest(
  label: json['label'] as String,
  description: json['description'] as String?,
  code: json['code'] as String,
);

Map<String, dynamic> _$CreateShippingOptionTypeRequestToJson(
  CreateShippingOptionTypeRequest instance,
) => <String, dynamic>{
  'label': instance.label,
  'description': instance.description,
  'code': instance.code,
};

UpdateShippingOptionTypeRequest _$UpdateShippingOptionTypeRequestFromJson(
  Map<String, dynamic> json,
) => UpdateShippingOptionTypeRequest(
  label: json['label'] as String?,
  description: json['description'] as String?,
  code: json['code'] as String?,
);

Map<String, dynamic> _$UpdateShippingOptionTypeRequestToJson(
  UpdateShippingOptionTypeRequest instance,
) => <String, dynamic>{
  'label': instance.label,
  'description': instance.description,
  'code': instance.code,
};
