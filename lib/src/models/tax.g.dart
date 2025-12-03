// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxProvider _$TaxProviderFromJson(Map<String, dynamic> json) => TaxProvider(
  id: json['id'] as String,
  isInstalled: json['is_installed'] as bool,
);

Map<String, dynamic> _$TaxProviderToJson(TaxProvider instance) =>
    <String, dynamic>{'id': instance.id, 'is_installed': instance.isInstalled};

TaxRegion _$TaxRegionFromJson(Map<String, dynamic> json) => TaxRegion(
  id: json['id'] as String,
  countryCode: json['country_code'] as String?,
  provinceCode: json['province_code'] as String?,
  parentId: json['parent_id'] as String?,
  provider: json['provider'] == null
      ? null
      : TaxProvider.fromJson(json['provider'] as Map<String, dynamic>),
  providerId: json['provider_id'] as String?,
  defaultTaxRate: (json['default_tax_rate'] as num?)?.toDouble(),
  taxCalculationType: $enumDecodeNullable(
    _$TaxCalculationTypeEnumMap,
    json['tax_calculation_type'],
  ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$TaxRegionToJson(TaxRegion instance) => <String, dynamic>{
  'id': instance.id,
  'country_code': instance.countryCode,
  'province_code': instance.provinceCode,
  'parent_id': instance.parentId,
  'provider': instance.provider,
  'provider_id': instance.providerId,
  'default_tax_rate': instance.defaultTaxRate,
  'tax_calculation_type':
      _$TaxCalculationTypeEnumMap[instance.taxCalculationType],
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$TaxCalculationTypeEnumMap = {
  TaxCalculationType.inclusive: 'inclusive',
  TaxCalculationType.exclusive: 'exclusive',
};

TaxRate _$TaxRateFromJson(Map<String, dynamic> json) => TaxRate(
  id: json['id'] as String,
  rate: (json['rate'] as num?)?.toDouble(),
  code: json['code'] as String?,
  name: json['name'] as String,
  regionId: json['region_id'] as String?,
  region: json['region'] == null
      ? null
      : TaxRegion.fromJson(json['region'] as Map<String, dynamic>),
  isDefault: json['is_default'] as bool,
  isCombinable: json['is_combinable'] as bool,
  type: $enumDecode(_$TaxRateTypeEnumMap, json['type']),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$TaxRateToJson(TaxRate instance) => <String, dynamic>{
  'id': instance.id,
  'rate': instance.rate,
  'code': instance.code,
  'name': instance.name,
  'region_id': instance.regionId,
  'region': instance.region,
  'is_default': instance.isDefault,
  'is_combinable': instance.isCombinable,
  'type': _$TaxRateTypeEnumMap[instance.type]!,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$TaxRateTypeEnumMap = {
  TaxRateType.rate: 'rate',
  TaxRateType.flat: 'flat',
};

TaxLine _$TaxLineFromJson(Map<String, dynamic> json) => TaxLine(
  id: json['id'] as String,
  rate: (json['rate'] as num).toDouble(),
  name: json['name'] as String,
  code: json['code'] as String?,
  itemId: json['item_id'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TaxLineToJson(TaxLine instance) => <String, dynamic>{
  'id': instance.id,
  'rate': instance.rate,
  'name': instance.name,
  'code': instance.code,
  'item_id': instance.itemId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

CreateTaxRegionRequest _$CreateTaxRegionRequestFromJson(
  Map<String, dynamic> json,
) => CreateTaxRegionRequest(
  countryCode: json['country_code'] as String?,
  provinceCode: json['province_code'] as String?,
  parentId: json['parent_id'] as String?,
  providerId: json['provider_id'] as String?,
  defaultTaxRate: (json['default_tax_rate'] as num?)?.toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateTaxRegionRequestToJson(
  CreateTaxRegionRequest instance,
) => <String, dynamic>{
  'country_code': instance.countryCode,
  'province_code': instance.provinceCode,
  'parent_id': instance.parentId,
  'provider_id': instance.providerId,
  'default_tax_rate': instance.defaultTaxRate,
  'metadata': instance.metadata,
};

UpdateTaxRegionRequest _$UpdateTaxRegionRequestFromJson(
  Map<String, dynamic> json,
) => UpdateTaxRegionRequest(
  providerId: json['provider_id'] as String?,
  defaultTaxRate: (json['default_tax_rate'] as num?)?.toDouble(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateTaxRegionRequestToJson(
  UpdateTaxRegionRequest instance,
) => <String, dynamic>{
  'provider_id': instance.providerId,
  'default_tax_rate': instance.defaultTaxRate,
  'metadata': instance.metadata,
};

CreateTaxRateRequest _$CreateTaxRateRequestFromJson(
  Map<String, dynamic> json,
) => CreateTaxRateRequest(
  rate: (json['rate'] as num?)?.toDouble(),
  code: json['code'] as String?,
  name: json['name'] as String,
  regionId: json['region_id'] as String?,
  isDefault: json['is_default'] as bool?,
  isCombinable: json['is_combinable'] as bool?,
  type: $enumDecode(_$TaxRateTypeEnumMap, json['type']),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateTaxRateRequestToJson(
  CreateTaxRateRequest instance,
) => <String, dynamic>{
  'rate': instance.rate,
  'code': instance.code,
  'name': instance.name,
  'region_id': instance.regionId,
  'is_default': instance.isDefault,
  'is_combinable': instance.isCombinable,
  'type': _$TaxRateTypeEnumMap[instance.type]!,
  'metadata': instance.metadata,
};

UpdateTaxRateRequest _$UpdateTaxRateRequestFromJson(
  Map<String, dynamic> json,
) => UpdateTaxRateRequest(
  rate: (json['rate'] as num?)?.toDouble(),
  code: json['code'] as String?,
  name: json['name'] as String?,
  isDefault: json['is_default'] as bool?,
  isCombinable: json['is_combinable'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateTaxRateRequestToJson(
  UpdateTaxRateRequest instance,
) => <String, dynamic>{
  'rate': instance.rate,
  'code': instance.code,
  'name': instance.name,
  'is_default': instance.isDefault,
  'is_combinable': instance.isCombinable,
  'metadata': instance.metadata,
};

TaxRegionResponse _$TaxRegionResponseFromJson(Map<String, dynamic> json) =>
    TaxRegionResponse(
      taxRegion: TaxRegion.fromJson(json['tax_region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaxRegionResponseToJson(TaxRegionResponse instance) =>
    <String, dynamic>{'tax_region': instance.taxRegion};

TaxRegionsResponse _$TaxRegionsResponseFromJson(Map<String, dynamic> json) =>
    TaxRegionsResponse(
      taxRegions: (json['tax_regions'] as List<dynamic>)
          .map((e) => TaxRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$TaxRegionsResponseToJson(TaxRegionsResponse instance) =>
    <String, dynamic>{
      'tax_regions': instance.taxRegions,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };

TaxRateResponse _$TaxRateResponseFromJson(Map<String, dynamic> json) =>
    TaxRateResponse(
      taxRate: TaxRate.fromJson(json['tax_rate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaxRateResponseToJson(TaxRateResponse instance) =>
    <String, dynamic>{'tax_rate': instance.taxRate};

TaxRatesResponse _$TaxRatesResponseFromJson(Map<String, dynamic> json) =>
    TaxRatesResponse(
      taxRates: (json['tax_rates'] as List<dynamic>)
          .map((e) => TaxRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$TaxRatesResponseToJson(TaxRatesResponse instance) =>
    <String, dynamic>{
      'tax_rates': instance.taxRates,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };

TaxProvidersResponse _$TaxProvidersResponseFromJson(
  Map<String, dynamic> json,
) => TaxProvidersResponse(
  taxProviders: (json['tax_providers'] as List<dynamic>)
      .map((e) => TaxProvider.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TaxProvidersResponseToJson(
  TaxProvidersResponse instance,
) => <String, dynamic>{'tax_providers': instance.taxProviders};
