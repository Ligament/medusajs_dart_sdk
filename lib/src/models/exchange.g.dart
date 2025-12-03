// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeItem _$ExchangeItemFromJson(Map<String, dynamic> json) => ExchangeItem(
  id: json['id'] as String,
  exchangeId: json['exchange_id'] as String,
  orderItemId: json['order_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  note: json['note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ExchangeItemToJson(ExchangeItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exchange_id': instance.exchangeId,
      'order_item_id': instance.orderItemId,
      'quantity': instance.quantity,
      'note': instance.note,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

AdditionalExchangeItem _$AdditionalExchangeItemFromJson(
  Map<String, dynamic> json,
) => AdditionalExchangeItem(
  id: json['id'] as String,
  exchangeId: json['exchange_id'] as String,
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AdditionalExchangeItemToJson(
  AdditionalExchangeItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'exchange_id': instance.exchangeId,
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

Exchange _$ExchangeFromJson(Map<String, dynamic> json) => Exchange(
  id: json['id'] as String,
  status: $enumDecode(_$ExchangeStatusEnumMap, json['status']),
  paymentStatus: $enumDecode(
    _$ExchangePaymentStatusEnumMap,
    json['payment_status'],
  ),
  fulfillmentStatus: $enumDecode(
    _$ExchangeFulfillmentStatusEnumMap,
    json['fulfillment_status'],
  ),
  orderId: json['order_id'] as String,
  exchangeItems: (json['exchange_items'] as List<dynamic>?)
      ?.map((e) => ExchangeItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  additionalItems: (json['additional_items'] as List<dynamic>?)
      ?.map((e) => AdditionalExchangeItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  returnId: json['return_id'] as String?,
  cartId: json['cart_id'] as String?,
  differenceDue: (json['difference_due'] as num?)?.toInt(),
  shippingAddressId: json['shipping_address_id'] as String?,
  allowBackorder: json['allow_backorder'] as bool?,
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  canceledAt: json['canceled_at'] == null
      ? null
      : DateTime.parse(json['canceled_at'] as String),
  note: json['note'] as String?,
  noNotification: json['no_notification'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ExchangeToJson(Exchange instance) => <String, dynamic>{
  'id': instance.id,
  'status': _$ExchangeStatusEnumMap[instance.status]!,
  'payment_status': _$ExchangePaymentStatusEnumMap[instance.paymentStatus]!,
  'fulfillment_status':
      _$ExchangeFulfillmentStatusEnumMap[instance.fulfillmentStatus]!,
  'order_id': instance.orderId,
  'exchange_items': instance.exchangeItems,
  'additional_items': instance.additionalItems,
  'return_id': instance.returnId,
  'cart_id': instance.cartId,
  'difference_due': instance.differenceDue,
  'shipping_address_id': instance.shippingAddressId,
  'allow_backorder': instance.allowBackorder,
  'completed_at': instance.completedAt?.toIso8601String(),
  'canceled_at': instance.canceledAt?.toIso8601String(),
  'note': instance.note,
  'no_notification': instance.noNotification,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$ExchangeStatusEnumMap = {
  ExchangeStatus.draft: 'draft',
  ExchangeStatus.requested: 'requested',
  ExchangeStatus.received: 'received',
  ExchangeStatus.completed: 'completed',
  ExchangeStatus.canceled: 'canceled',
};

const _$ExchangePaymentStatusEnumMap = {
  ExchangePaymentStatus.notPaid: 'not_paid',
  ExchangePaymentStatus.paid: 'paid',
  ExchangePaymentStatus.refunded: 'refunded',
  ExchangePaymentStatus.partiallyRefunded: 'partially_refunded',
};

const _$ExchangeFulfillmentStatusEnumMap = {
  ExchangeFulfillmentStatus.notFulfilled: 'not_fulfilled',
  ExchangeFulfillmentStatus.fulfilled: 'fulfilled',
  ExchangeFulfillmentStatus.shipped: 'shipped',
  ExchangeFulfillmentStatus.partiallyShipped: 'partially_shipped',
  ExchangeFulfillmentStatus.canceled: 'canceled',
  ExchangeFulfillmentStatus.requiresAction: 'requires_action',
};

CreateExchangeRequest _$CreateExchangeRequestFromJson(
  Map<String, dynamic> json,
) => CreateExchangeRequest(
  orderId: json['order_id'] as String,
  exchangeItems: (json['exchange_items'] as List<dynamic>)
      .map((e) => CreateExchangeItemRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  additionalItems: (json['additional_items'] as List<dynamic>?)
      ?.map(
        (e) => CreateAdditionalExchangeItemRequest.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  shippingAddressId: json['shipping_address_id'] as String?,
  allowBackorder: json['allow_backorder'] as bool?,
  noNotification: json['no_notification'] as bool?,
  note: json['note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateExchangeRequestToJson(
  CreateExchangeRequest instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'exchange_items': instance.exchangeItems,
  'additional_items': instance.additionalItems,
  'shipping_address_id': instance.shippingAddressId,
  'allow_backorder': instance.allowBackorder,
  'no_notification': instance.noNotification,
  'note': instance.note,
  'metadata': instance.metadata,
};

CreateExchangeItemRequest _$CreateExchangeItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateExchangeItemRequest(
  orderItemId: json['order_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  note: json['note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateExchangeItemRequestToJson(
  CreateExchangeItemRequest instance,
) => <String, dynamic>{
  'order_item_id': instance.orderItemId,
  'quantity': instance.quantity,
  'note': instance.note,
  'metadata': instance.metadata,
};

CreateAdditionalExchangeItemRequest
_$CreateAdditionalExchangeItemRequestFromJson(Map<String, dynamic> json) =>
    CreateAdditionalExchangeItemRequest(
      variantId: json['variant_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateAdditionalExchangeItemRequestToJson(
  CreateAdditionalExchangeItemRequest instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};

UpdateExchangeRequest _$UpdateExchangeRequestFromJson(
  Map<String, dynamic> json,
) => UpdateExchangeRequest(
  note: json['note'] as String?,
  noNotification: json['no_notification'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateExchangeRequestToJson(
  UpdateExchangeRequest instance,
) => <String, dynamic>{
  'note': instance.note,
  'no_notification': instance.noNotification,
  'metadata': instance.metadata,
};

CancelExchangeRequest _$CancelExchangeRequestFromJson(
  Map<String, dynamic> json,
) => CancelExchangeRequest(noNotification: json['no_notification'] as bool?);

Map<String, dynamic> _$CancelExchangeRequestToJson(
  CancelExchangeRequest instance,
) => <String, dynamic>{'no_notification': instance.noNotification};

ProcessExchangePaymentRequest _$ProcessExchangePaymentRequestFromJson(
  Map<String, dynamic> json,
) => ProcessExchangePaymentRequest(amount: (json['amount'] as num).toInt());

Map<String, dynamic> _$ProcessExchangePaymentRequestToJson(
  ProcessExchangePaymentRequest instance,
) => <String, dynamic>{'amount': instance.amount};

ExchangeResponse _$ExchangeResponseFromJson(Map<String, dynamic> json) =>
    ExchangeResponse(
      exchange: Exchange.fromJson(json['exchange'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExchangeResponseToJson(ExchangeResponse instance) =>
    <String, dynamic>{'exchange': instance.exchange};

ExchangesResponse _$ExchangesResponseFromJson(Map<String, dynamic> json) =>
    ExchangesResponse(
      exchanges: (json['exchanges'] as List<dynamic>)
          .map((e) => Exchange.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ExchangesResponseToJson(ExchangesResponse instance) =>
    <String, dynamic>{
      'exchanges': instance.exchanges,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
