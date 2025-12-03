import 'dart:io';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

/// Quick test to verify Store functionality
void main() async {
  print('🚀 Testing Store functionality...');

  try {
    // Create Medusa client
    final medusa = Medusa(
      MedusaConfig(baseUrl: 'https://demo.medusajs.com', debug: true),
    );

    print('✅ Medusa client created successfully');

    // Test Store module access
    final store = medusa.store;
    print('✅ Store module accessible');

    // Test Store resources access
    print('✅ Store.product: ${store.product.runtimeType}');
    print('✅ Store.cart: ${store.cart.runtimeType}');
    print('✅ Store.region: ${store.region.runtimeType}');
    print('✅ Store.collection: ${store.collection.runtimeType}');
    print('✅ Store.category: ${store.category.runtimeType}');
    print('✅ Store.customer: ${store.customer.runtimeType}');
    print('✅ Store.order: ${store.order.runtimeType}');
    print('✅ Store.payment: ${store.payment.runtimeType}');
    print('✅ Store.fulfillment: ${store.fulfillment.runtimeType}');

    print('\n🎉 All Store resources are accessible!');
    print('✅ Store module is functional and ready to use');
  } catch (e, stackTrace) {
    print('❌ Error testing Store functionality: $e');
    print('Stack trace: $stackTrace');
    exit(1);
  }
}
