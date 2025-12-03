// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromotionRule _$PromotionRuleFromJson(Map<String, dynamic> json) =>
    PromotionRule(
      id: json['id'] as String,
      description: json['description'] as String?,
      attribute: $enumDecode(_$RuleAttributeEnumMap, json['attribute']),
      operator: $enumDecode(_$RuleOperatorEnumMap, json['operator']),
      values: (json['values'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      promotionId: json['promotion_id'] as String?,
      ruleType: $enumDecodeNullable(_$RuleTypeEnumMap, json['rule_type']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$PromotionRuleToJson(PromotionRule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'attribute': _$RuleAttributeEnumMap[instance.attribute]!,
      'operator': _$RuleOperatorEnumMap[instance.operator]!,
      'values': instance.values,
      'promotion_id': instance.promotionId,
      'rule_type': _$RuleTypeEnumMap[instance.ruleType],
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$RuleAttributeEnumMap = {
  RuleAttribute.customerGroupId: 'customer_group_id',
  RuleAttribute.salesChannelId: 'sales_channel_id',
  RuleAttribute.productId: 'product_id',
  RuleAttribute.productTypeId: 'product_type_id',
  RuleAttribute.productCollectionId: 'product_collection_id',
  RuleAttribute.productTagId: 'product_tag_id',
  RuleAttribute.customerId: 'customer_id',
  RuleAttribute.currencyCode: 'currency_code',
};

const _$RuleOperatorEnumMap = {
  RuleOperator.gte: 'gte',
  RuleOperator.lte: 'lte',
  RuleOperator.gt: 'gt',
  RuleOperator.lt: 'lt',
  RuleOperator.eq: 'eq',
  RuleOperator.ne: 'ne',
  RuleOperator.inOperator: 'in',
  RuleOperator.nin: 'nin',
};

const _$RuleTypeEnumMap = {
  RuleType.rules: 'rules',
  RuleType.targetRules: 'target-rules',
  RuleType.buyRules: 'buy-rules',
};

CampaignBudget _$CampaignBudgetFromJson(Map<String, dynamic> json) =>
    CampaignBudget(
      id: json['id'] as String,
      type: json['type'] as String,
      limit: (json['limit'] as num?)?.toInt(),
      used: (json['used'] as num).toInt(),
      currencyCode: json['currency_code'] as String?,
      campaignId: json['campaign_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$CampaignBudgetToJson(CampaignBudget instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'limit': instance.limit,
      'used': instance.used,
      'currency_code': instance.currencyCode,
      'campaign_id': instance.campaignId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

Promotion _$PromotionFromJson(Map<String, dynamic> json) => Promotion(
  id: json['id'] as String,
  code: json['code'] as String,
  campaignId: json['campaign_id'] as String?,
  campaign: json['campaign'] == null
      ? null
      : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
  isAutomatic: json['is_automatic'] as bool,
  isTaxInclusive: json['is_tax_inclusive'] as bool,
  type: $enumDecode(_$PromotionTypeEnumMap, json['type']),
  status: $enumDecode(_$PromotionStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  targetRules: (json['target_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  buyRules: (json['buy_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  applicationMethod: $enumDecode(
    _$ApplicationMethodEnumMap,
    json['application_method'],
  ),
  budget: json['budget'] == null
      ? null
      : CampaignBudget.fromJson(json['budget'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$PromotionToJson(Promotion instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'campaign_id': instance.campaignId,
  'campaign': instance.campaign,
  'is_automatic': instance.isAutomatic,
  'is_tax_inclusive': instance.isTaxInclusive,
  'type': _$PromotionTypeEnumMap[instance.type]!,
  'status': _$PromotionStatusEnumMap[instance.status]!,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'rules': instance.rules,
  'target_rules': instance.targetRules,
  'buy_rules': instance.buyRules,
  'application_method': _$ApplicationMethodEnumMap[instance.applicationMethod]!,
  'budget': instance.budget,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$PromotionTypeEnumMap = {
  PromotionType.standard: 'standard',
  PromotionType.buyget: 'buyget',
};

const _$PromotionStatusEnumMap = {
  PromotionStatus.draft: 'draft',
  PromotionStatus.active: 'active',
  PromotionStatus.inactive: 'inactive',
};

const _$ApplicationMethodEnumMap = {
  ApplicationMethod.automatic: 'automatic',
  ApplicationMethod.code: 'code',
};

CreatePromotionRequest _$CreatePromotionRequestFromJson(
  Map<String, dynamic> json,
) => CreatePromotionRequest(
  code: json['code'] as String,
  campaignId: json['campaign_id'] as String?,
  isAutomatic: json['is_automatic'] as bool?,
  isTaxInclusive: json['is_tax_inclusive'] as bool?,
  type: $enumDecode(_$PromotionTypeEnumMap, json['type']),
  status: $enumDecodeNullable(_$PromotionStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  applicationMethod: $enumDecode(
    _$ApplicationMethodEnumMap,
    json['application_method'],
  ),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  targetRules: (json['target_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  buyRules: (json['buy_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreatePromotionRequestToJson(
  CreatePromotionRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'campaign_id': instance.campaignId,
  'is_automatic': instance.isAutomatic,
  'is_tax_inclusive': instance.isTaxInclusive,
  'type': _$PromotionTypeEnumMap[instance.type]!,
  'status': _$PromotionStatusEnumMap[instance.status],
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'application_method': _$ApplicationMethodEnumMap[instance.applicationMethod]!,
  'rules': instance.rules,
  'target_rules': instance.targetRules,
  'buy_rules': instance.buyRules,
  'metadata': instance.metadata,
};

UpdatePromotionRequest _$UpdatePromotionRequestFromJson(
  Map<String, dynamic> json,
) => UpdatePromotionRequest(
  code: json['code'] as String?,
  isAutomatic: json['is_automatic'] as bool?,
  isTaxInclusive: json['is_tax_inclusive'] as bool?,
  status: $enumDecodeNullable(_$PromotionStatusEnumMap, json['status']),
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  rules: (json['rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  targetRules: (json['target_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  buyRules: (json['buy_rules'] as List<dynamic>?)
      ?.map((e) => PromotionRule.fromJson(e as Map<String, dynamic>))
      .toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdatePromotionRequestToJson(
  UpdatePromotionRequest instance,
) => <String, dynamic>{
  'code': instance.code,
  'is_automatic': instance.isAutomatic,
  'is_tax_inclusive': instance.isTaxInclusive,
  'status': _$PromotionStatusEnumMap[instance.status],
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'rules': instance.rules,
  'target_rules': instance.targetRules,
  'buy_rules': instance.buyRules,
  'metadata': instance.metadata,
};

PromotionResponse _$PromotionResponseFromJson(Map<String, dynamic> json) =>
    PromotionResponse(
      promotion: Promotion.fromJson(json['promotion'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PromotionResponseToJson(PromotionResponse instance) =>
    <String, dynamic>{'promotion': instance.promotion};

PromotionsResponse _$PromotionsResponseFromJson(Map<String, dynamic> json) =>
    PromotionsResponse(
      promotions: (json['promotions'] as List<dynamic>)
          .map((e) => Promotion.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$PromotionsResponseToJson(PromotionsResponse instance) =>
    <String, dynamic>{
      'promotions': instance.promotions,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
