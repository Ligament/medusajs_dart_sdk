// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClaimItem _$ClaimItemFromJson(Map<String, dynamic> json) => ClaimItem(
  id: json['id'] as String,
  itemId: json['item_id'] as String,
  variantId: json['variant_id'] as String,
  claimOrderId: json['claim_order_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  reason: json['reason'] as String?,
  note: json['note'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ClaimItemToJson(ClaimItem instance) => <String, dynamic>{
  'id': instance.id,
  'item_id': instance.itemId,
  'variant_id': instance.variantId,
  'claim_order_id': instance.claimOrderId,
  'quantity': instance.quantity,
  'reason': instance.reason,
  'note': instance.note,
  'images': instance.images,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

AdditionalClaimItem _$AdditionalClaimItemFromJson(Map<String, dynamic> json) =>
    AdditionalClaimItem(
      id: json['id'] as String,
      variantId: json['variant_id'] as String,
      claimOrderId: json['claim_order_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$AdditionalClaimItemToJson(
  AdditionalClaimItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'variant_id': instance.variantId,
  'claim_order_id': instance.claimOrderId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

ClaimOrder _$ClaimOrderFromJson(Map<String, dynamic> json) => ClaimOrder(
  id: json['id'] as String,
  paymentStatus: $enumDecode(
    _$ClaimPaymentStatusEnumMap,
    json['payment_status'],
  ),
  fulfillmentStatus: $enumDecode(
    _$ClaimFulfillmentStatusEnumMap,
    json['fulfillment_status'],
  ),
  type: $enumDecode(_$ClaimTypeEnumMap, json['type']),
  orderId: json['order_id'] as String,
  shippingAddressId: json['shipping_address_id'] as String?,
  claimItems: (json['claim_items'] as List<dynamic>?)
      ?.map((e) => ClaimItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  additionalItems: (json['additional_items'] as List<dynamic>?)
      ?.map((e) => AdditionalClaimItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  returnOrderId: json['return_order_id'] as String?,
  refundAmount: (json['refund_amount'] as num?)?.toInt(),
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

Map<String, dynamic> _$ClaimOrderToJson(ClaimOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_status': _$ClaimPaymentStatusEnumMap[instance.paymentStatus]!,
      'fulfillment_status':
          _$ClaimFulfillmentStatusEnumMap[instance.fulfillmentStatus]!,
      'type': _$ClaimTypeEnumMap[instance.type]!,
      'order_id': instance.orderId,
      'shipping_address_id': instance.shippingAddressId,
      'claim_items': instance.claimItems,
      'additional_items': instance.additionalItems,
      'return_order_id': instance.returnOrderId,
      'refund_amount': instance.refundAmount,
      'canceled_at': instance.canceledAt?.toIso8601String(),
      'note': instance.note,
      'no_notification': instance.noNotification,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$ClaimPaymentStatusEnumMap = {
  ClaimPaymentStatus.na: 'na',
  ClaimPaymentStatus.notRefunded: 'not_refunded',
  ClaimPaymentStatus.refunded: 'refunded',
};

const _$ClaimFulfillmentStatusEnumMap = {
  ClaimFulfillmentStatus.notFulfilled: 'not_fulfilled',
  ClaimFulfillmentStatus.partiallyFulfilled: 'partially_fulfilled',
  ClaimFulfillmentStatus.fulfilled: 'fulfilled',
  ClaimFulfillmentStatus.partiallyShipped: 'partially_shipped',
  ClaimFulfillmentStatus.shipped: 'shipped',
  ClaimFulfillmentStatus.partiallyReturned: 'partially_returned',
  ClaimFulfillmentStatus.returned: 'returned',
  ClaimFulfillmentStatus.canceled: 'canceled',
  ClaimFulfillmentStatus.requiresAction: 'requires_action',
};

const _$ClaimTypeEnumMap = {
  ClaimType.replace: 'replace',
  ClaimType.refund: 'refund',
};

CreateClaimRequest _$CreateClaimRequestFromJson(Map<String, dynamic> json) =>
    CreateClaimRequest(
      orderId: json['order_id'] as String,
      type: $enumDecode(_$ClaimTypeEnumMap, json['type']),
      claimItems: (json['claim_items'] as List<dynamic>)
          .map(
            (e) => CreateClaimItemRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      additionalItems: (json['additional_items'] as List<dynamic>?)
          ?.map(
            (e) => CreateAdditionalClaimItemRequest.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      shippingAddressId: json['shipping_address_id'] as String?,
      returnShipping: json['return_shipping'] as bool?,
      noNotification: json['no_notification'] as bool?,
      note: json['note'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateClaimRequestToJson(CreateClaimRequest instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'type': _$ClaimTypeEnumMap[instance.type]!,
      'claim_items': instance.claimItems,
      'additional_items': instance.additionalItems,
      'shipping_address_id': instance.shippingAddressId,
      'return_shipping': instance.returnShipping,
      'no_notification': instance.noNotification,
      'note': instance.note,
      'metadata': instance.metadata,
    };

CreateClaimItemRequest _$CreateClaimItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateClaimItemRequest(
  itemId: json['item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  reason: json['reason'] as String?,
  note: json['note'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateClaimItemRequestToJson(
  CreateClaimItemRequest instance,
) => <String, dynamic>{
  'item_id': instance.itemId,
  'quantity': instance.quantity,
  'reason': instance.reason,
  'note': instance.note,
  'images': instance.images,
  'metadata': instance.metadata,
};

CreateAdditionalClaimItemRequest _$CreateAdditionalClaimItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateAdditionalClaimItemRequest(
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateAdditionalClaimItemRequestToJson(
  CreateAdditionalClaimItemRequest instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};

UpdateClaimRequest _$UpdateClaimRequestFromJson(Map<String, dynamic> json) =>
    UpdateClaimRequest(
      note: json['note'] as String?,
      noNotification: json['no_notification'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateClaimRequestToJson(UpdateClaimRequest instance) =>
    <String, dynamic>{
      'note': instance.note,
      'no_notification': instance.noNotification,
      'metadata': instance.metadata,
    };

CancelClaimRequest _$CancelClaimRequestFromJson(Map<String, dynamic> json) =>
    CancelClaimRequest(noNotification: json['no_notification'] as bool?);

Map<String, dynamic> _$CancelClaimRequestToJson(CancelClaimRequest instance) =>
    <String, dynamic>{'no_notification': instance.noNotification};

ClaimResponse _$ClaimResponseFromJson(Map<String, dynamic> json) =>
    ClaimResponse(
      claim: ClaimOrder.fromJson(json['claim'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClaimResponseToJson(ClaimResponse instance) =>
    <String, dynamic>{'claim': instance.claim};

ClaimsResponse _$ClaimsResponseFromJson(Map<String, dynamic> json) =>
    ClaimsResponse(
      claims: (json['claims'] as List<dynamic>)
          .map((e) => ClaimOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ClaimsResponseToJson(ClaimsResponse instance) =>
    <String, dynamic>{
      'claims': instance.claims,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
