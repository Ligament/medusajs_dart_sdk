import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

/// Demonstrate the updated fulfillment models and Store API integration
void main() async {
  print('=== Medusa.js Dart SDK - Store Fulfillment API Demo ===\n');

  // Initialize the Medusa client
  final medusa = Medusa(
    MedusaConfig(
      baseUrl: 'https://demo.medusajs.com',
      // Note: This is a demo URL, replace with your actual Medusa backend
    ),
  );

  try {
    demonstrateShippingOptionModels();
    demonstrateStoreFulfillmentAPI(medusa);
  } catch (e) {
    print('❌ Demo error (expected - no real backend): $e');
  }

  print('\n✅ Store Fulfillment API models and integration ready!');
}

/// Demonstrate the new Store shipping option models
void demonstrateShippingOptionModels() {
  print('1. Store Shipping Option Models');
  print('--------------------------------');

  // Create sample data that matches the Store API structure
  final sampleShippingOption = StoreCartShippingOption(
    id: 'so_123',
    name: 'Standard Shipping',
    priceType: ShippingOptionPriceType.flat,
    serviceZoneId: 'sz_123',
    shippingProfileId: 'sp_123',
    providerId: 'fp_123',
    provider: StoreFulfillmentProvider(id: 'fp_123', isEnabled: true),
    type: ShippingOptionTypeInfo(
      id: 'sot_123',
      label: 'Standard',
      description: 'Standard shipping option',
      code: 'standard',
    ),
    amount: 599, // $5.99 in cents
    data: {'carrier': 'UPS', 'service_type': 'ground'},
    prices: [
      StorePrice(
        id: 'price_123',
        currencyCode: 'usd',
        amount: 599,
        minQuantity: 1,
        maxQuantity: null,
      ),
    ],
    calculatedPrice: StoreCalculatedPrice(
      id: 'calc_123',
      calculatedAmount: 599,
      originalAmount: 799,
      currencyCode: 'usd',
      isCalculatedPriceTaxInclusive: false,
    ),
    insufficientInventory: false,
  );

  print('✅ StoreCartShippingOption created:');
  print('   ID: ${sampleShippingOption.id}');
  print('   Name: ${sampleShippingOption.name}');
  print('   Price Type: ${sampleShippingOption.priceType}');
  print('   Is Flat Rate: ${sampleShippingOption.isFlatRate}');
  print('   Is Calculated: ${sampleShippingOption.isCalculated}');
  print(
    '   Effective Amount: \$${(sampleShippingOption.effectiveAmount / 100).toStringAsFixed(2)}',
  );
  print('   Currency: ${sampleShippingOption.currencyCode}');
  print('   Has Inventory: ${sampleShippingOption.hasInventory}');
  print('   Provider: ${sampleShippingOption.provider.id}');
  print('   Type: ${sampleShippingOption.type.label}');

  // Demonstrate JSON serialization
  final json = sampleShippingOption.toJson();
  print('   ✅ JSON serialization works: ${json.keys.length} fields');

  // Demonstrate list response
  final listResponse = StoreShippingOptionListResponse(
    shippingOptions: [sampleShippingOption],
  );
  print('   ✅ List response: ${listResponse.shippingOptions.length} option(s)');

  print('');
}

/// Demonstrate the Store fulfillment API methods
void demonstrateStoreFulfillmentAPI(Medusa medusa) {
  print('2. Store Fulfillment API Methods');
  print('---------------------------------');

  final fulfillment = medusa.store.fulfillment;
  print('✅ Store fulfillment resource available');
  print('   Resource path: ${fulfillment.resourcePath}');

  // The following would work with a real Medusa backend
  print('\n📋 Available API methods:');
  print('   • listCartOptions(cartId: "cart_123")');
  print('   • calculate("so_123", cartId: "cart_123")');
  print('   • listForRegion("reg_123")');
  print('   • byProvider("fp_123")');
  print('   • getCheapest(cartId: "cart_123")');
  print('   • getFastest(cartId: "cart_123")');

  print('\n🔧 Example API calls (would work with real backend):');
  print('   ```dart');
  print('   // List shipping options for cart');
  print('   final options = await medusa.store.fulfillment.listCartOptions(');
  print('     cartId: "cart_123",');
  print('   );');
  print('');
  print('   // Calculate price for specific option');
  print('   final calculated = await medusa.store.fulfillment.calculate(');
  print('     "so_123",');
  print('     cartId: "cart_123",');
  print('   );');
  print('');
  print('   // Get cheapest option');
  print('   final cheapest = await medusa.store.fulfillment.getCheapest(');
  print('     cartId: "cart_123",');
  print('   );');
  print('   ```');

  print('\n🎯 Benefits of the updated implementation:');
  print('   • Type-safe shipping option models');
  print('   • Matches official Medusa Store API structure');
  print('   • Helper methods for common operations');
  print('   • Proper price calculation handling');
  print('   • Full JSON serialization support');
  print('   • Comprehensive documentation');
}
