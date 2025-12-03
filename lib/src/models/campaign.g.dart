// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  currencyCode: json['currency_code'] as String?,
  status: $enumDecode(_$CampaignStatusEnumMap, json['status']),
  budget: json['budget'] == null
      ? null
      : CampaignBudget.fromJson(json['budget'] as Map<String, dynamic>),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'currency_code': instance.currencyCode,
  'status': _$CampaignStatusEnumMap[instance.status]!,
  'budget': instance.budget,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$CampaignStatusEnumMap = {
  CampaignStatus.active: 'active',
  CampaignStatus.inactive: 'inactive',
  CampaignStatus.draft: 'draft',
};

CampaignBudget _$CampaignBudgetFromJson(Map<String, dynamic> json) =>
    CampaignBudget(
      type: $enumDecode(_$CampaignBudgetTypeEnumMap, json['type']),
      limit: (json['limit'] as num?)?.toInt(),
      used: (json['used'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CampaignBudgetToJson(CampaignBudget instance) =>
    <String, dynamic>{
      'type': _$CampaignBudgetTypeEnumMap[instance.type]!,
      'limit': instance.limit,
      'used': instance.used,
    };

const _$CampaignBudgetTypeEnumMap = {
  CampaignBudgetType.spend: 'spend',
  CampaignBudgetType.usage: 'usage',
};

CreateCampaignRequest _$CreateCampaignRequestFromJson(
  Map<String, dynamic> json,
) => CreateCampaignRequest(
  name: json['name'] as String,
  description: json['description'] as String?,
  currencyCode: json['currency_code'] as String?,
  status: $enumDecodeNullable(_$CampaignStatusEnumMap, json['status']),
  budget: json['budget'] == null
      ? null
      : CampaignBudget.fromJson(json['budget'] as Map<String, dynamic>),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateCampaignRequestToJson(
  CreateCampaignRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'currency_code': instance.currencyCode,
  'status': _$CampaignStatusEnumMap[instance.status],
  'budget': instance.budget,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'metadata': instance.metadata,
};

UpdateCampaignRequest _$UpdateCampaignRequestFromJson(
  Map<String, dynamic> json,
) => UpdateCampaignRequest(
  name: json['name'] as String?,
  description: json['description'] as String?,
  currencyCode: json['currency_code'] as String?,
  status: $enumDecodeNullable(_$CampaignStatusEnumMap, json['status']),
  budget: json['budget'] == null
      ? null
      : CampaignBudget.fromJson(json['budget'] as Map<String, dynamic>),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateCampaignRequestToJson(
  UpdateCampaignRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'currency_code': instance.currencyCode,
  'status': _$CampaignStatusEnumMap[instance.status],
  'budget': instance.budget,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'metadata': instance.metadata,
};
