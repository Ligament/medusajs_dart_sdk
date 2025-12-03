import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  // Test that store models are available
  print('Testing Store Models Availability...');

  try {
    // Test StoreRegion
    final region = StoreRegion(
      id: 'test_region',
      name: 'Test Region',
      currencyCode: 'USD',
      metadata: {},
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    print('✅ StoreRegion is available: ${region.id}');

    // Test StoreCollection
    final collection = StoreCollection(
      id: 'test_collection',
      title: 'Test Collection',
      handle: 'test-collection',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    print('✅ StoreCollection is available: ${collection.title}');

    // Test StoreProductCategory
    final category = StoreProductCategory(
      id: 'test_category',
      name: 'Test Category',
      handle: 'test-category',
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
    print('✅ StoreProductCategory is available: ${category.name}');

    // Test Store Resource Classes
    final config = MedusaConfig(
      baseUrl: 'http://localhost:9000',
      publishableKey: 'pk_test_123',
    );

    final medusa = Medusa(config);

    print('✅ Store region resource: ${medusa.store.region}');
    print('✅ Store collection resource: ${medusa.store.collection}');
    print('✅ Store category resource: ${medusa.store.category}');

    print('\n🎉 All store models and resources are properly available!');
  } catch (e) {
    print('❌ Error: $e');
  }
}
