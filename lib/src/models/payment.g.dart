// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
  id: json['id'] as String,
  swapId: json['swap_id'] as String?,
  cartId: json['cart_id'] as String?,
  orderId: json['order_id'] as String?,
  amount: (json['amount'] as num).toInt(),
  currencyCode: json['currency_code'] as String,
  amountRefunded: (json['amount_refunded'] as num).toInt(),
  providerId: json['provider_id'] as String,
  data: json['data'] as Map<String, dynamic>,
  capturedAt: json['captured_at'] == null
      ? null
      : DateTime.parse(json['captured_at'] as String),
  canceledAt: json['canceled_at'] == null
      ? null
      : DateTime.parse(json['canceled_at'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
  'id': instance.id,
  'swap_id': instance.swapId,
  'cart_id': instance.cartId,
  'order_id': instance.orderId,
  'amount': instance.amount,
  'currency_code': instance.currencyCode,
  'amount_refunded': instance.amountRefunded,
  'provider_id': instance.providerId,
  'data': instance.data,
  'captured_at': instance.capturedAt?.toIso8601String(),
  'canceled_at': instance.canceledAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'metadata': instance.metadata,
};
