// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnReason _$ReturnReasonFromJson(Map<String, dynamic> json) => ReturnReason(
  id: json['id'] as String,
  value: json['value'] as String,
  label: json['label'] as String,
  description: json['description'] as String?,
  parentReturnReasonId: json['parent_return_reason_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ReturnReasonToJson(ReturnReason instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'label': instance.label,
      'description': instance.description,
      'parent_return_reason_id': instance.parentReturnReasonId,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

ReturnItem _$ReturnItemFromJson(Map<String, dynamic> json) => ReturnItem(
  id: json['id'] as String,
  returnId: json['return_id'] as String,
  orderItemId: json['order_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  isDamaged: json['is_damaged'] as bool,
  note: json['note'] as String?,
  reasonId: json['reason_id'] as String?,
  reason: json['reason'] == null
      ? null
      : ReturnReason.fromJson(json['reason'] as Map<String, dynamic>),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ReturnItemToJson(ReturnItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'return_id': instance.returnId,
      'order_item_id': instance.orderItemId,
      'quantity': instance.quantity,
      'is_damaged': instance.isDamaged,
      'note': instance.note,
      'reason_id': instance.reasonId,
      'reason': instance.reason,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

ReturnShippingMethod _$ReturnShippingMethodFromJson(
  Map<String, dynamic> json,
) => ReturnShippingMethod(
  id: json['id'] as String,
  returnId: json['return_id'] as String,
  shippingOptionId: json['shipping_option_id'] as String?,
  price: (json['price'] as num?)?.toInt(),
  data: json['data'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ReturnShippingMethodToJson(
  ReturnShippingMethod instance,
) => <String, dynamic>{
  'id': instance.id,
  'return_id': instance.returnId,
  'shipping_option_id': instance.shippingOptionId,
  'price': instance.price,
  'data': instance.data,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

Return _$ReturnFromJson(Map<String, dynamic> json) => Return(
  id: json['id'] as String,
  status: $enumDecode(_$ReturnStatusEnumMap, json['status']),
  orderId: json['order_id'] as String?,
  exchangeId: json['exchange_id'] as String?,
  claimId: json['claim_id'] as String?,
  locationId: json['location_id'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ReturnItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingMethod: json['shipping_method'] == null
      ? null
      : ReturnShippingMethod.fromJson(
          json['shipping_method'] as Map<String, dynamic>,
        ),
  shippingData: json['shipping_data'] as Map<String, dynamic>?,
  refundAmount: (json['refund_amount'] as num?)?.toInt(),
  receivedAt: json['received_at'] == null
      ? null
      : DateTime.parse(json['received_at'] as String),
  note: json['note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$ReturnToJson(Return instance) => <String, dynamic>{
  'id': instance.id,
  'status': _$ReturnStatusEnumMap[instance.status]!,
  'order_id': instance.orderId,
  'exchange_id': instance.exchangeId,
  'claim_id': instance.claimId,
  'location_id': instance.locationId,
  'items': instance.items,
  'shipping_method': instance.shippingMethod,
  'shipping_data': instance.shippingData,
  'refund_amount': instance.refundAmount,
  'received_at': instance.receivedAt?.toIso8601String(),
  'note': instance.note,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$ReturnStatusEnumMap = {
  ReturnStatus.requested: 'requested',
  ReturnStatus.received: 'received',
  ReturnStatus.requiresAction: 'requires_action',
  ReturnStatus.canceled: 'canceled',
};

CreateReturnRequest _$CreateReturnRequestFromJson(Map<String, dynamic> json) =>
    CreateReturnRequest(
      orderId: json['order_id'] as String,
      items: (json['items'] as List<dynamic>)
          .map(
            (e) => CreateReturnItemRequest.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      locationId: json['location_id'] as String?,
      note: json['note'] as String?,
      receiveNow: json['receive_now'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateReturnRequestToJson(
  CreateReturnRequest instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'items': instance.items,
  'location_id': instance.locationId,
  'note': instance.note,
  'receive_now': instance.receiveNow,
  'metadata': instance.metadata,
};

CreateReturnItemRequest _$CreateReturnItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateReturnItemRequest(
  orderItemId: json['order_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  reasonId: json['reason_id'] as String?,
  note: json['note'] as String?,
  isDamaged: json['is_damaged'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateReturnItemRequestToJson(
  CreateReturnItemRequest instance,
) => <String, dynamic>{
  'order_item_id': instance.orderItemId,
  'quantity': instance.quantity,
  'reason_id': instance.reasonId,
  'note': instance.note,
  'is_damaged': instance.isDamaged,
  'metadata': instance.metadata,
};

UpdateReturnRequest _$UpdateReturnRequestFromJson(Map<String, dynamic> json) =>
    UpdateReturnRequest(
      note: json['note'] as String?,
      receivedAt: json['received_at'] == null
          ? null
          : DateTime.parse(json['received_at'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateReturnRequestToJson(
  UpdateReturnRequest instance,
) => <String, dynamic>{
  'note': instance.note,
  'received_at': instance.receivedAt?.toIso8601String(),
  'metadata': instance.metadata,
};

ReceiveReturnRequest _$ReceiveReturnRequestFromJson(
  Map<String, dynamic> json,
) => ReceiveReturnRequest(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => ReceiveReturnItemRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  note: json['note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ReceiveReturnRequestToJson(
  ReceiveReturnRequest instance,
) => <String, dynamic>{
  'items': instance.items,
  'note': instance.note,
  'metadata': instance.metadata,
};

ReceiveReturnItemRequest _$ReceiveReturnItemRequestFromJson(
  Map<String, dynamic> json,
) => ReceiveReturnItemRequest(
  returnItemId: json['return_item_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  isDamaged: json['is_damaged'] as bool?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$ReceiveReturnItemRequestToJson(
  ReceiveReturnItemRequest instance,
) => <String, dynamic>{
  'return_item_id': instance.returnItemId,
  'quantity': instance.quantity,
  'is_damaged': instance.isDamaged,
  'note': instance.note,
};

ReturnResponse _$ReturnResponseFromJson(Map<String, dynamic> json) =>
    ReturnResponse(
      returnOrder: Return.fromJson(
        json['return_order'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$ReturnResponseToJson(ReturnResponse instance) =>
    <String, dynamic>{'return_order': instance.returnOrder};

ReturnsResponse _$ReturnsResponseFromJson(Map<String, dynamic> json) =>
    ReturnsResponse(
      returns: (json['returns'] as List<dynamic>)
          .map((e) => Return.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$ReturnsResponseToJson(ReturnsResponse instance) =>
    <String, dynamic>{
      'returns': instance.returns,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };

ReturnReasonsResponse _$ReturnReasonsResponseFromJson(
  Map<String, dynamic> json,
) => ReturnReasonsResponse(
  returnReasons: (json['return_reasons'] as List<dynamic>)
      .map((e) => ReturnReason.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReturnReasonsResponseToJson(
  ReturnReasonsResponse instance,
) => <String, dynamic>{'return_reasons': instance.returnReasons};
