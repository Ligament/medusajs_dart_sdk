// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSession _$PaymentSessionFromJson(Map<String, dynamic> json) =>
    PaymentSession(
      id: json['id'] as String,
      paymentCollectionId: json['payment_collection_id'] as String,
      providerId: json['provider_id'] as String,
      currencyCode: json['currency_code'] as String,
      amount: (json['amount'] as num).toInt(),
      status: $enumDecode(_$PaymentSessionStatusEnumMap, json['status']),
      data: json['data'] as Map<String, dynamic>?,
      isSelected: json['is_selected'] as bool,
      isInitiated: json['is_initiated'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$PaymentSessionToJson(PaymentSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_collection_id': instance.paymentCollectionId,
      'provider_id': instance.providerId,
      'currency_code': instance.currencyCode,
      'amount': instance.amount,
      'status': _$PaymentSessionStatusEnumMap[instance.status]!,
      'data': instance.data,
      'is_selected': instance.isSelected,
      'is_initiated': instance.isInitiated,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$PaymentSessionStatusEnumMap = {
  PaymentSessionStatus.pending: 'pending',
  PaymentSessionStatus.authorized: 'authorized',
  PaymentSessionStatus.requiresMore: 'requires_more',
  PaymentSessionStatus.error: 'error',
  PaymentSessionStatus.canceled: 'canceled',
};

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  id: json['id'] as String,
  amount: (json['amount'] as num).toInt(),
  currencyCode: json['currency_code'] as String,
  providerId: json['provider_id'] as String,
  cartId: json['cart_id'] as String?,
  orderId: json['order_id'] as String?,
  orderEditId: json['order_edit_id'] as String?,
  customerId: json['customer_id'] as String?,
  data: json['data'] as Map<String, dynamic>?,
  capturedAt: json['captured_at'] == null
      ? null
      : DateTime.parse(json['captured_at'] as String),
  canceledAt: json['canceled_at'] == null
      ? null
      : DateTime.parse(json['canceled_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'id': instance.id,
  'amount': instance.amount,
  'currency_code': instance.currencyCode,
  'provider_id': instance.providerId,
  'cart_id': instance.cartId,
  'order_id': instance.orderId,
  'order_edit_id': instance.orderEditId,
  'customer_id': instance.customerId,
  'data': instance.data,
  'captured_at': instance.capturedAt?.toIso8601String(),
  'canceled_at': instance.canceledAt?.toIso8601String(),
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

PaymentCollection _$PaymentCollectionFromJson(Map<String, dynamic> json) =>
    PaymentCollection(
      id: json['id'] as String,
      type: $enumDecode(_$PaymentCollectionTypeEnumMap, json['type']),
      status: $enumDecode(_$PaymentCollectionStatusEnumMap, json['status']),
      description: json['description'] as String?,
      amount: (json['amount'] as num).toInt(),
      authorizedAmount: (json['authorized_amount'] as num).toInt(),
      regionId: json['region_id'] as String,
      currencyCode: json['currency_code'] as String,
      paymentSessions: (json['payment_sessions'] as List<dynamic>?)
          ?.map((e) => PaymentSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      payments: (json['payments'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$PaymentCollectionToJson(PaymentCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PaymentCollectionTypeEnumMap[instance.type]!,
      'status': _$PaymentCollectionStatusEnumMap[instance.status]!,
      'description': instance.description,
      'amount': instance.amount,
      'authorized_amount': instance.authorizedAmount,
      'region_id': instance.regionId,
      'currency_code': instance.currencyCode,
      'payment_sessions': instance.paymentSessions,
      'payments': instance.payments,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$PaymentCollectionTypeEnumMap = {
  PaymentCollectionType.orderEdit: 'order_edit',
  PaymentCollectionType.subscription: 'subscription',
  PaymentCollectionType.custom: 'custom',
};

const _$PaymentCollectionStatusEnumMap = {
  PaymentCollectionStatus.notPaid: 'not_paid',
  PaymentCollectionStatus.awaiting: 'awaiting',
  PaymentCollectionStatus.authorized: 'authorized',
  PaymentCollectionStatus.partiallyAuthorized: 'partially_authorized',
  PaymentCollectionStatus.canceled: 'canceled',
};

CreatePaymentCollectionRequest _$CreatePaymentCollectionRequestFromJson(
  Map<String, dynamic> json,
) => CreatePaymentCollectionRequest(
  type: $enumDecode(_$PaymentCollectionTypeEnumMap, json['type']),
  description: json['description'] as String?,
  amount: (json['amount'] as num).toInt(),
  regionId: json['region_id'] as String,
  currencyCode: json['currency_code'] as String,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreatePaymentCollectionRequestToJson(
  CreatePaymentCollectionRequest instance,
) => <String, dynamic>{
  'type': _$PaymentCollectionTypeEnumMap[instance.type]!,
  'description': instance.description,
  'amount': instance.amount,
  'region_id': instance.regionId,
  'currency_code': instance.currencyCode,
  'metadata': instance.metadata,
};

UpdatePaymentCollectionRequest _$UpdatePaymentCollectionRequestFromJson(
  Map<String, dynamic> json,
) => UpdatePaymentCollectionRequest(
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdatePaymentCollectionRequestToJson(
  UpdatePaymentCollectionRequest instance,
) => <String, dynamic>{
  'description': instance.description,
  'metadata': instance.metadata,
};

SetPaymentSessionsRequest _$SetPaymentSessionsRequestFromJson(
  Map<String, dynamic> json,
) => SetPaymentSessionsRequest(
  providerIds: (json['provider_ids'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SetPaymentSessionsRequestToJson(
  SetPaymentSessionsRequest instance,
) => <String, dynamic>{'provider_ids': instance.providerIds};

AuthorizePaymentSessionRequest _$AuthorizePaymentSessionRequestFromJson(
  Map<String, dynamic> json,
) => AuthorizePaymentSessionRequest(
  sessionId: json['session_id'] as String,
  context: json['context'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$AuthorizePaymentSessionRequestToJson(
  AuthorizePaymentSessionRequest instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'context': instance.context,
};

PaymentCollectionResponse _$PaymentCollectionResponseFromJson(
  Map<String, dynamic> json,
) => PaymentCollectionResponse(
  paymentCollection: PaymentCollection.fromJson(
    json['payment_collection'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaymentCollectionResponseToJson(
  PaymentCollectionResponse instance,
) => <String, dynamic>{'payment_collection': instance.paymentCollection};

PaymentCollectionsResponse _$PaymentCollectionsResponseFromJson(
  Map<String, dynamic> json,
) => PaymentCollectionsResponse(
  paymentCollections: (json['payment_collections'] as List<dynamic>)
      .map((e) => PaymentCollection.fromJson(e as Map<String, dynamic>))
      .toList(),
  count: (json['count'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$PaymentCollectionsResponseToJson(
  PaymentCollectionsResponse instance,
) => <String, dynamic>{
  'payment_collections': instance.paymentCollections,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};
