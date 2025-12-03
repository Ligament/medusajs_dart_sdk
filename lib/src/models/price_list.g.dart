// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoneyAmount _$MoneyAmountFromJson(Map<String, dynamic> json) => MoneyAmount(
  id: json['id'] as String,
  currencyCode: json['currency_code'] as String,
  amount: (json['amount'] as num).toInt(),
  minQuantity: (json['min_quantity'] as num?)?.toInt(),
  maxQuantity: (json['max_quantity'] as num?)?.toInt(),
  priceListId: json['price_list_id'] as String?,
  variantId: json['variant_id'] as String?,
  regionId: json['region_id'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$MoneyAmountToJson(MoneyAmount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'currency_code': instance.currencyCode,
      'amount': instance.amount,
      'min_quantity': instance.minQuantity,
      'max_quantity': instance.maxQuantity,
      'price_list_id': instance.priceListId,
      'variant_id': instance.variantId,
      'region_id': instance.regionId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

CustomerGroup _$CustomerGroupFromJson(Map<String, dynamic> json) =>
    CustomerGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$CustomerGroupToJson(CustomerGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

PriceList _$PriceListFromJson(Map<String, dynamic> json) => PriceList(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  type: $enumDecode(_$PriceListTypeEnumMap, json['type']),
  status: $enumDecode(_$PriceListStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  prices: (json['prices'] as List<dynamic>?)
      ?.map((e) => MoneyAmount.fromJson(e as Map<String, dynamic>))
      .toList(),
  customerGroups: (json['customer_groups'] as List<dynamic>?)
      ?.map((e) => CustomerGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$PriceListToJson(PriceList instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'type': _$PriceListTypeEnumMap[instance.type]!,
  'status': _$PriceListStatusEnumMap[instance.status]!,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'prices': instance.prices,
  'customer_groups': instance.customerGroups,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$PriceListTypeEnumMap = {
  PriceListType.sale: 'sale',
  PriceListType.override: 'override',
};

const _$PriceListStatusEnumMap = {
  PriceListStatus.active: 'active',
  PriceListStatus.draft: 'draft',
};

CreatePriceListRequest _$CreatePriceListRequestFromJson(
  Map<String, dynamic> json,
) => CreatePriceListRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  type: $enumDecode(_$PriceListTypeEnumMap, json['type']),
  status: $enumDecodeNullable(_$PriceListStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  customerGroupIds: (json['customer_group_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreatePriceListRequestToJson(
  CreatePriceListRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'type': _$PriceListTypeEnumMap[instance.type]!,
  'status': _$PriceListStatusEnumMap[instance.status],
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'customer_group_ids': instance.customerGroupIds,
  'metadata': instance.metadata,
};

UpdatePriceListRequest _$UpdatePriceListRequestFromJson(
  Map<String, dynamic> json,
) => UpdatePriceListRequest(
  name: json['name'] as String?,
  description: json['description'] as String?,
  status: $enumDecodeNullable(_$PriceListStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  customerGroupIds: (json['customer_group_ids'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdatePriceListRequestToJson(
  UpdatePriceListRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'status': _$PriceListStatusEnumMap[instance.status],
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'customer_group_ids': instance.customerGroupIds,
  'metadata': instance.metadata,
};

PriceListResponse _$PriceListResponseFromJson(Map<String, dynamic> json) =>
    PriceListResponse(
      priceList: PriceList.fromJson(json['price_list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PriceListResponseToJson(PriceListResponse instance) =>
    <String, dynamic>{'price_list': instance.priceList};

PriceListsResponse _$PriceListsResponseFromJson(Map<String, dynamic> json) =>
    PriceListsResponse(
      priceLists: (json['price_lists'] as List<dynamic>)
          .map((e) => PriceList.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PriceListsResponseToJson(PriceListsResponse instance) =>
    <String, dynamic>{
      'price_lists': instance.priceLists,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
