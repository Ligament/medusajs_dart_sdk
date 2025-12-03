import 'dart:convert';
import 'package:medusajs_dart_sdk/src/models/store_commerce.dart';

void main() {
  // Test parsing the cart JSON that was failing
  const cartJsonString = '''
{
  "id": "cart_01JDCRRRR4E5YN3T2RKDVE61MS",
  "email": null,
  "billing_address_id": null,
  "billing_address": null,
  "shipping_address_id": null,
  "shipping_address": {
    "id": "caddr_01JDCRRRR4KXY7MBWMFE74JRGT",
    "customer_id": null,
    "company": null,
    "first_name": null,
    "last_name": null,
    "address_1": null,
    "address_2": null,
    "city": null,
    "country_code": null,
    "province": null,
    "postal_code": null,
    "phone": null,
    "metadata": null
  },
  "items": [],
  "region": {
    "id": "reg_01J6T5GWJSB7TDJBHH5EQEV5G1",
    "name": "North America",
    "currency_code": "usd",
    "automatic_taxes": true,
    "metadata": null,
    "created_at": "2024-09-03T03:07:19.473Z",
    "updated_at": "2024-09-03T03:07:19.473Z",
    "deleted_at": null
  },
  "region_id": "reg_01J6T5GWJSB7TDJBHH5EQEV5G1",
  "customer_id": null,
  "sales_channel_id": "sc_01J6T5GVQCZG4Y2E47T1E8PPZR",
  "sales_channel": {
    "id": "sc_01J6T5GVQCZG4Y2E47T1E8PPZR",
    "name": "Default Sales Channel",
    "description": "Created by Medusa",
    "is_disabled": false,
    "metadata": null,
    "created_at": "2024-09-03T03:07:19.238Z",
    "updated_at": "2024-09-03T03:07:19.238Z",
    "deleted_at": null
  },
  "payment_collection": null,
  "type": "default",
  "completed_at": null,
  "payment_authorized_at": null,
  "idempotency_key": null,
  "context": {
    "ip": "47.158.137.202",
    "user_agent": "dart:io-client"
  },
  "metadata": null,
  "created_at": "2024-11-22T08:32:49.748Z",
  "updated_at": "2024-11-22T08:32:49.748Z",
  "deleted_at": null,
  "currency_code": "usd",
  "tax_total": 0,
  "taxed_total": 0,
  "subtotal": 0,
  "discount_total": 0,
  "discount_tax_total": 0,
  "gift_card_total": 0,
  "gift_card_tax_total": 0,
  "shipping_total": 0,
  "shipping_tax_total": 0,
  "total": 0
}
''';

  try {
    // Parse the JSON string into a map
    final cartData = json.decode(cartJsonString) as Map<String, dynamic>;

    print('Attempting to parse StoreCart...');
    final cart = StoreCart.fromJson(cartData);
    print('✅ Successfully parsed StoreCart!');
    print('Cart ID: ${cart.id}');
    print('Region: ${cart.region?.name}');
    print('Shipping address ID: ${cart.shippingAddress?.id}');
    print('Total: ${cart.total}');
  } catch (e, stackTrace) {
    print('❌ Error parsing StoreCart: $e');
    print('Stack trace: $stackTrace');
  }
}
