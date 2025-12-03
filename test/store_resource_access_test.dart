import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  // Test instantiation
  final medusa = Medusa(MedusaConfig(baseUrl: 'http://localhost:9000'));

  // Test that store resources are accessible
  print('✅ SDK created successfully');
  print('✅ Store instance: ${medusa.store}');
  print('✅ Store product resource: ${medusa.store.product}');
  print('✅ Store collection resource: ${medusa.store.collection}');
  print('✅ Store category resource: ${medusa.store.category}');
  print('✅ Store region resource: ${medusa.store.region}');
  print('✅ Store currency resource: ${medusa.store.currency}');
  print('✅ Store customer resource: ${medusa.store.customer}');
  print('✅ Store cart resource: ${medusa.store.cart}');
  print('✅ Store order resource: ${medusa.store.order}');
  print('✅ Store payment resource: ${medusa.store.payment}');
  print('✅ Store fulfillment resource: ${medusa.store.fulfillment}');

  print('\n🎉 All store resources are accessible!');
}
