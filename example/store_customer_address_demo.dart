import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

/// Demonstrate the updated Store Customer Address API with type-safe models
void main() async {
  print('=== Medusa.js Dart SDK - Store Customer Address API Demo ===\n');

  // Initialize the Medusa client
  final medusa = Medusa(
    MedusaConfig(
      baseUrl: 'https://demo.medusajs.com',
      // Note: This is a demo URL, replace with your actual Medusa backend
    ),
  );

  try {
    await demonstrateStoreCustomerAddressModels();
    await demonstrateStoreCustomerAddressAPI(medusa);
  } catch (e) {
    print('❌ Demo error (expected - no real backend): $e');
  }

  print('\n✅ Store Customer Address API models and integration ready!');
}

/// Demonstrate the new Store customer address models
Future<void> demonstrateStoreCustomerAddressModels() async {
  print('1. Store Customer Address Models');
  print('--------------------------------');

  // Create sample address data that matches the Store API structure
  final sampleAddress = StoreAddress(
    id: 'addr_123',
    customerId: 'cus_123',
    firstName: 'John',
    lastName: 'Doe',
    company: 'Acme Corp',
    address1: '123 Main Street',
    address2: 'Suite 4B',
    city: 'New York',
    countryCode: 'US',
    province: 'NY',
    postalCode: '10001',
    phone: '+1-555-0123',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    metadata: {'apartment_buzzer': '4B', 'delivery_notes': 'Ring doorbell'},
  );

  print('✅ StoreAddress created:');
  print('   ID: ${sampleAddress.id}');
  print('   Customer: ${sampleAddress.customerId}');
  print('   Full Name: ${sampleAddress.fullName}');
  print('   Company: ${sampleAddress.company}');
  print('   Is Complete: ${sampleAddress.isComplete}');
  print('   Is Deleted: ${sampleAddress.isDeleted}');

  print('\n✅ Address formatting:');
  print('   Formatted Address:');
  print('   ${sampleAddress.formattedAddress.replaceAll('\n', '\n   ')}');
  print('\n   Single Line: ${sampleAddress.singleLineAddress}');

  // Demonstrate request models
  final createRequest = StoreCreateCustomerAddress(
    firstName: 'Jane',
    lastName: 'Smith',
    company: 'Tech Solutions Inc',
    address1: '456 Oak Avenue',
    address2: 'Floor 3',
    city: 'Los Angeles',
    countryCode: 'US',
    province: 'CA',
    postalCode: '90210',
    phone: '+1-555-0456',
    metadata: {'access_code': '1234', 'preferred_delivery_time': 'morning'},
  );

  final updateRequest = StoreUpdateCustomerAddress(
    address2: 'Floor 5', // Updated floor
    phone: '+1-555-0789', // Updated phone
  );

  print('\n✅ Request models:');
  print('   Create Request: ${createRequest.address1}, ${createRequest.city}');
  print('   Update Request: Floor changed to "${updateRequest.address2}"');

  // Demonstrate JSON serialization
  final addressJson = sampleAddress.toJson();
  print('\n   ✅ JSON serialization works: ${addressJson.keys.length} fields');

  print('');
}

/// Demonstrate the Store customer address API methods
Future<void> demonstrateStoreCustomerAddressAPI(Medusa medusa) async {
  print('2. Store Customer Address API Methods');
  print('--------------------------------------');

  final customer = medusa.store.customer;
  print('✅ Store customer resource available');
  print('   Resource path: ${customer.resourcePath}');

  // The following would work with a real Medusa backend
  print('\n📋 Available Address API methods (type-safe):');
  print(
    '   • createAddress(StoreCreateCustomerAddress) → StoreCustomerResponse',
  );
  print(
    '   • updateAddress(id, StoreUpdateCustomerAddress) → StoreCustomerResponse',
  );
  print('   • listAddress() → StoreCustomerAddressListResponse');
  print('   • retrieveAddress(id) → StoreCustomerAddressResponse?');
  print('   • deleteAddress(id) → StoreCustomerAddressDeleteResponse');

  print('\n📋 Backward compatibility methods:');
  print('   • createAddressFromMap(Map) → Customer?');
  print('   • updateAddressFromMap(id, Map) → Customer?');
  print('   • listAddresses() → PaginatedResponse<Address>');
  print('   • retrieveAddressLegacy(id) → Address?');

  print('\n🔧 Example Address API calls (would work with real backend):');
  print('   ```dart');
  print('   // Create new address');
  print('   final response = await medusa.store.customer.createAddress(');
  print('     StoreCreateCustomerAddress(');
  print('       firstName: "John",');
  print('       lastName: "Doe",');
  print('       address1: "123 Main St",');
  print('       city: "New York",');
  print('       countryCode: "US",');
  print('       postalCode: "10001",');
  print('     ),');
  print('   );');
  print('   final updatedCustomer = response.customer;');
  print(
    '   print("Customer now has \${updatedCustomer.addressCount} addresses");',
  );
  print('');
  print('   // List all addresses');
  print('   final addressList = await medusa.store.customer.listAddress();');
  print('   for (final addr in addressList.addresses) {');
  print('     print("Address: \${addr.formattedAddress}");');
  print('   }');
  print('');
  print('   // Update an address');
  print('   final updated = await medusa.store.customer.updateAddress(');
  print('     "addr_123",');
  print('     StoreUpdateCustomerAddress(');
  print('       address2: "Suite 5B", // Change apartment number');
  print('       phone: "+1-555-9999", // Update phone');
  print('     ),');
  print('   );');
  print('');
  print('   // Retrieve specific address');
  print(
    '   final addressResponse = await medusa.store.customer.retrieveAddress(',
  );
  print('     "addr_123",');
  print('   );');
  print('   if (addressResponse != null) {');
  print('     final address = addressResponse.address;');
  print('     print("Retrieved: \${address.singleLineAddress}");');
  print('   }');
  print('');
  print('   // Delete an address');
  print('   final deleteResult = await medusa.store.customer.deleteAddress(');
  print('     "addr_123",');
  print('   );');
  print('   if (deleteResult.deleted) {');
  print('     print("Address deleted successfully");');
  print(
    '     print("Customer now has \${deleteResult.parent.addressCount} addresses");',
  );
  print('   }');
  print('   ```');

  print('\n🎯 Address Management Features:');
  print('   • Type-safe address models with validation');
  print('   • Automatic address formatting (single line & multi-line)');
  print('   • Complete profile detection (required fields check)');
  print('   • Metadata support for custom address attributes');
  print('   • Full CRUD operations with proper response types');
  print('   • Backward compatibility with existing Map-based methods');
  print('   • Customer object includes updated address list after operations');

  print('\n📍 Address Validation:');
  print('   • Required fields: address1, city, countryCode');
  print('   • Optional fields: address2, company, province, postalCode, phone');
  print(
    '   • Metadata support for custom fields (buzzer codes, delivery notes)',
  );
  print('   • Automatic completeness checking with isComplete property');

  print('\n🔄 Response Structure:');
  print('   • Create/Update address operations return full customer object');
  print('   • List operations return paginated address list');
  print('   • Retrieve operations return single address');
  print('   • Delete operations return confirmation + updated customer');
}
