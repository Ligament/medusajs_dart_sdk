// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_edit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEditChange _$OrderEditChangeFromJson(Map<String, dynamic> json) =>
    OrderEditChange(
      id: json['id'] as String,
      orderEditId: json['order_edit_id'] as String,
      type: $enumDecode(_$OrderEditChangeTypeEnumMap, json['type']),
      originalLineItemId: json['original_line_item_id'] as String?,
      lineItemId: json['line_item_id'] as String?,
      data: json['data'] as Map<String, dynamic>?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OrderEditChangeToJson(OrderEditChange instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_edit_id': instance.orderEditId,
      'type': _$OrderEditChangeTypeEnumMap[instance.type]!,
      'original_line_item_id': instance.originalLineItemId,
      'line_item_id': instance.lineItemId,
      'data': instance.data,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$OrderEditChangeTypeEnumMap = {
  OrderEditChangeType.itemAdd: 'item_add',
  OrderEditChangeType.itemRemove: 'item_remove',
  OrderEditChangeType.itemUpdate: 'item_update',
  OrderEditChangeType.shippingAdd: 'shipping_add',
  OrderEditChangeType.shippingRemove: 'shipping_remove',
};

OrderEdit _$OrderEditFromJson(Map<String, dynamic> json) => OrderEdit(
  id: json['id'] as String,
  orderId: json['order_id'] as String,
  status: $enumDecode(_$OrderEditStatusEnumMap, json['status']),
  internalNote: json['internal_note'] as String?,
  createdBy: json['created_by'] as String?,
  requestedBy: json['requested_by'] as String?,
  requestedAt: json['requested_at'] == null
      ? null
      : DateTime.parse(json['requested_at'] as String),
  confirmedBy: json['confirmed_by'] as String?,
  confirmedAt: json['confirmed_at'] == null
      ? null
      : DateTime.parse(json['confirmed_at'] as String),
  declinedBy: json['declined_by'] as String?,
  declinedAt: json['declined_at'] == null
      ? null
      : DateTime.parse(json['declined_at'] as String),
  declinedReason: json['declined_reason'] as String?,
  canceledBy: json['canceled_by'] as String?,
  canceledAt: json['canceled_at'] == null
      ? null
      : DateTime.parse(json['canceled_at'] as String),
  changes: (json['changes'] as List<dynamic>?)
      ?.map((e) => OrderEditChange.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  differenceDue: (json['difference_due'] as num?)?.toInt(),
  paymentCollectionId: json['payment_collection_id'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OrderEditToJson(OrderEdit instance) => <String, dynamic>{
  'id': instance.id,
  'order_id': instance.orderId,
  'status': _$OrderEditStatusEnumMap[instance.status]!,
  'internal_note': instance.internalNote,
  'created_by': instance.createdBy,
  'requested_by': instance.requestedBy,
  'requested_at': instance.requestedAt?.toIso8601String(),
  'confirmed_by': instance.confirmedBy,
  'confirmed_at': instance.confirmedAt?.toIso8601String(),
  'declined_by': instance.declinedBy,
  'declined_at': instance.declinedAt?.toIso8601String(),
  'declined_reason': instance.declinedReason,
  'canceled_by': instance.canceledBy,
  'canceled_at': instance.canceledAt?.toIso8601String(),
  'changes': instance.changes,
  'subtotal': instance.subtotal,
  'total': instance.total,
  'difference_due': instance.differenceDue,
  'payment_collection_id': instance.paymentCollectionId,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

const _$OrderEditStatusEnumMap = {
  OrderEditStatus.created: 'created',
  OrderEditStatus.requested: 'requested',
  OrderEditStatus.confirmed: 'confirmed',
  OrderEditStatus.declined: 'declined',
  OrderEditStatus.canceled: 'canceled',
};

CreateOrderEditRequest _$CreateOrderEditRequestFromJson(
  Map<String, dynamic> json,
) => CreateOrderEditRequest(
  orderId: json['order_id'] as String,
  internalNote: json['internal_note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateOrderEditRequestToJson(
  CreateOrderEditRequest instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};

UpdateOrderEditRequest _$UpdateOrderEditRequestFromJson(
  Map<String, dynamic> json,
) => UpdateOrderEditRequest(
  internalNote: json['internal_note'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateOrderEditRequestToJson(
  UpdateOrderEditRequest instance,
) => <String, dynamic>{
  'internal_note': instance.internalNote,
  'metadata': instance.metadata,
};

AddOrderEditLineItemRequest _$AddOrderEditLineItemRequestFromJson(
  Map<String, dynamic> json,
) => AddOrderEditLineItemRequest(
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$AddOrderEditLineItemRequestToJson(
  AddOrderEditLineItemRequest instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};

UpdateOrderEditLineItemRequest _$UpdateOrderEditLineItemRequestFromJson(
  Map<String, dynamic> json,
) => UpdateOrderEditLineItemRequest(
  quantity: (json['quantity'] as num).toInt(),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateOrderEditLineItemRequestToJson(
  UpdateOrderEditLineItemRequest instance,
) => <String, dynamic>{
  'quantity': instance.quantity,
  'metadata': instance.metadata,
};

RequestOrderEditConfirmationRequest
_$RequestOrderEditConfirmationRequestFromJson(Map<String, dynamic> json) =>
    RequestOrderEditConfirmationRequest(
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RequestOrderEditConfirmationRequestToJson(
  RequestOrderEditConfirmationRequest instance,
) => <String, dynamic>{'metadata': instance.metadata};

ConfirmOrderEditRequest _$ConfirmOrderEditRequestFromJson(
  Map<String, dynamic> json,
) => ConfirmOrderEditRequest(
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ConfirmOrderEditRequestToJson(
  ConfirmOrderEditRequest instance,
) => <String, dynamic>{'metadata': instance.metadata};

DeclineOrderEditRequest _$DeclineOrderEditRequestFromJson(
  Map<String, dynamic> json,
) => DeclineOrderEditRequest(
  reason: json['reason'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$DeclineOrderEditRequestToJson(
  DeclineOrderEditRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'metadata': instance.metadata,
};

CancelOrderEditRequest _$CancelOrderEditRequestFromJson(
  Map<String, dynamic> json,
) =>
    CancelOrderEditRequest(metadata: json['metadata'] as Map<String, dynamic>?);

Map<String, dynamic> _$CancelOrderEditRequestToJson(
  CancelOrderEditRequest instance,
) => <String, dynamic>{'metadata': instance.metadata};

OrderEditResponse _$OrderEditResponseFromJson(Map<String, dynamic> json) =>
    OrderEditResponse(
      orderEdit: OrderEdit.fromJson(json['order_edit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderEditResponseToJson(OrderEditResponse instance) =>
    <String, dynamic>{'order_edit': instance.orderEdit};

OrderEditsResponse _$OrderEditsResponseFromJson(Map<String, dynamic> json) =>
    OrderEditsResponse(
      orderEdits: (json['order_edits'] as List<dynamic>)
          .map((e) => OrderEdit.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$OrderEditsResponseToJson(OrderEditsResponse instance) =>
    <String, dynamic>{
      'order_edits': instance.orderEdits,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
