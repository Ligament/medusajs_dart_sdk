// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftOrder _$DraftOrderFromJson(Map<String, dynamic> json) => DraftOrder(
  id: json['id'] as String,
  status: $enumDecode(_$DraftOrderStatusEnumMap, json['status']),
  displayId: json['display_id'] as String?,
  cartId: json['cart_id'] as String?,
  orderId: json['order_id'] as String?,
  regionId: json['region_id'] as String?,
  customerId: json['customer_id'] as String?,
  salesChannelId: json['sales_channel_id'] as String?,
  email: json['email'] as String,
  currencyCode: json['currency_code'] as String?,
  shippingAddressId: json['shipping_address_id'] as String?,
  billingAddressId: json['billing_address_id'] as String?,
  subtotal: (json['subtotal'] as num?)?.toInt(),
  taxTotal: (json['tax_total'] as num?)?.toInt(),
  total: (json['total'] as num?)?.toInt(),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  noNotificationOrder: json['no_notification_order'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$DraftOrderToJson(DraftOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$DraftOrderStatusEnumMap[instance.status]!,
      'display_id': instance.displayId,
      'cart_id': instance.cartId,
      'order_id': instance.orderId,
      'region_id': instance.regionId,
      'customer_id': instance.customerId,
      'sales_channel_id': instance.salesChannelId,
      'email': instance.email,
      'currency_code': instance.currencyCode,
      'shipping_address_id': instance.shippingAddressId,
      'billing_address_id': instance.billingAddressId,
      'subtotal': instance.subtotal,
      'tax_total': instance.taxTotal,
      'total': instance.total,
      'completed_at': instance.completedAt?.toIso8601String(),
      'no_notification_order': instance.noNotificationOrder,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };

const _$DraftOrderStatusEnumMap = {
  DraftOrderStatus.open: 'open',
  DraftOrderStatus.completed: 'completed',
};

CreateDraftOrderRequest _$CreateDraftOrderRequestFromJson(
  Map<String, dynamic> json,
) => CreateDraftOrderRequest(
  email: json['email'] as String,
  regionId: json['region_id'] as String?,
  customerId: json['customer_id'] as String?,
  salesChannelId: json['sales_channel_id'] as String?,
  shippingAddress: json['shipping_address'] == null
      ? null
      : AddressRequest.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
  billingAddress: json['billing_address'] == null
      ? null
      : AddressRequest.fromJson(
          json['billing_address'] as Map<String, dynamic>,
        ),
  items: (json['items'] as List<dynamic>?)
      ?.map(
        (e) => CreateDraftOrderItemRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  discounts: (json['discounts'] as List<dynamic>?)
      ?.map(
        (e) =>
            CreateDraftOrderDiscountRequest.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  noNotificationOrder: json['no_notification_order'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateDraftOrderRequestToJson(
  CreateDraftOrderRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'region_id': instance.regionId,
  'customer_id': instance.customerId,
  'sales_channel_id': instance.salesChannelId,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
  'items': instance.items,
  'discounts': instance.discounts,
  'no_notification_order': instance.noNotificationOrder,
  'metadata': instance.metadata,
};

CreateDraftOrderItemRequest _$CreateDraftOrderItemRequestFromJson(
  Map<String, dynamic> json,
) => CreateDraftOrderItemRequest(
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  unitPrice: (json['unit_price'] as num?)?.toInt(),
  title: json['title'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CreateDraftOrderItemRequestToJson(
  CreateDraftOrderItemRequest instance,
) => <String, dynamic>{
  'variant_id': instance.variantId,
  'quantity': instance.quantity,
  'unit_price': instance.unitPrice,
  'title': instance.title,
  'metadata': instance.metadata,
};

CreateDraftOrderDiscountRequest _$CreateDraftOrderDiscountRequestFromJson(
  Map<String, dynamic> json,
) => CreateDraftOrderDiscountRequest(code: json['code'] as String);

Map<String, dynamic> _$CreateDraftOrderDiscountRequestToJson(
  CreateDraftOrderDiscountRequest instance,
) => <String, dynamic>{'code': instance.code};

UpdateDraftOrderRequest _$UpdateDraftOrderRequestFromJson(
  Map<String, dynamic> json,
) => UpdateDraftOrderRequest(
  regionId: json['region_id'] as String?,
  customerId: json['customer_id'] as String?,
  email: json['email'] as String?,
  shippingAddress: json['shipping_address'] == null
      ? null
      : AddressRequest.fromJson(
          json['shipping_address'] as Map<String, dynamic>,
        ),
  billingAddress: json['billing_address'] == null
      ? null
      : AddressRequest.fromJson(
          json['billing_address'] as Map<String, dynamic>,
        ),
  noNotificationOrder: json['no_notification_order'] as bool?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateDraftOrderRequestToJson(
  UpdateDraftOrderRequest instance,
) => <String, dynamic>{
  'region_id': instance.regionId,
  'customer_id': instance.customerId,
  'email': instance.email,
  'shipping_address': instance.shippingAddress,
  'billing_address': instance.billingAddress,
  'no_notification_order': instance.noNotificationOrder,
  'metadata': instance.metadata,
};

CompleteDraftOrderRequest _$CompleteDraftOrderRequestFromJson(
  Map<String, dynamic> json,
) => CompleteDraftOrderRequest(
  noNotificationOrder: json['no_notification_order'] as bool?,
);

Map<String, dynamic> _$CompleteDraftOrderRequestToJson(
  CompleteDraftOrderRequest instance,
) => <String, dynamic>{'no_notification_order': instance.noNotificationOrder};

RegisterPaymentRequest _$RegisterPaymentRequestFromJson(
  Map<String, dynamic> json,
) => RegisterPaymentRequest(amount: (json['amount'] as num).toInt());

Map<String, dynamic> _$RegisterPaymentRequestToJson(
  RegisterPaymentRequest instance,
) => <String, dynamic>{'amount': instance.amount};

DraftOrderResponse _$DraftOrderResponseFromJson(Map<String, dynamic> json) =>
    DraftOrderResponse(
      draftOrder: DraftOrder.fromJson(
        json['draft_order'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DraftOrderResponseToJson(DraftOrderResponse instance) =>
    <String, dynamic>{'draft_order': instance.draftOrder};

DraftOrdersResponse _$DraftOrdersResponseFromJson(Map<String, dynamic> json) =>
    DraftOrdersResponse(
      draftOrders: (json['draft_orders'] as List<dynamic>)
          .map((e) => DraftOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$DraftOrdersResponseToJson(
  DraftOrdersResponse instance,
) => <String, dynamic>{
  'draft_orders': instance.draftOrders,
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};
