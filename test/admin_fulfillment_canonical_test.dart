import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('AdminFulfillment Canonical Model', () {
    test('should parse AdminFulfillment JSON payloads', () {
      final json = {
        'id': 'ful_test123',
        'location_id': 'loc_test',
        'provider_id': 'prov_test',
        'packed_at': '2024-01-01T00:00:00Z',
        'shipped_at': '2024-01-02T00:00:00Z',
        'delivered_at': null,
        'canceled_at': null,
        'data': {'tracking_number': 'TRACK123'},
        'delivery_address': {
          'id': 'addr_1',
          'customer_id': 'cust_1',
          'company': 'Medusa',
          'first_name': 'John',
          'last_name': 'Doe',
          'address_1': 'Main St 1',
          'city': 'New York',
          'country_code': 'US',
          'postal_code': '10001',
          'created_at': '2024-01-01T00:00:00Z',
          'updated_at': '2024-01-01T00:00:00Z',
        },
        'items': [
          {
            'id': 'item_1',
            'fulfillment_id': 'ful_test123',
            'order_id': 'order_1',
            'title': 'Test Item',
            'sku': 'SKU-TEST',
            'barcode': 'BAR-TEST',
            'quantity': 2,
            'created_at': '2024-01-01T00:00:00Z',
            'updated_at': '2024-01-01T00:00:00Z',
          },
        ],
        'labels': [
          {
            'id': 'label_1',
            'fulfillment_id': 'ful_test123',
            'tracking_number': 'TRACK123',
            'printed_at': '2024-01-02T00:00:00Z',
            'created_at': '2024-01-01T00:00:00Z',
            'updated_at': '2024-01-01T00:00:00Z',
          },
        ],
        'requires_shipping': true,
        'metadata': {'priority': 'high'},
        'created_at': '2024-01-01T00:00:00Z',
        'updated_at': '2024-01-03T00:00:00Z',
      };

      final fulfillment = AdminFulfillment.fromJson(json);

      expect(fulfillment.id, equals('ful_test123'));
      expect(fulfillment.locationId, equals('loc_test'));
      expect(fulfillment.providerId, equals('prov_test'));
      expect(fulfillment.packedAt, isNotNull);
      expect(fulfillment.shippedAt, isNotNull);
      expect(fulfillment.items, hasLength(1));
      expect(fulfillment.labels, hasLength(1));
      expect(fulfillment.metadata!['priority'], equals('high'));
    });

    test('should serialize AdminFulfillment to JSON', () {
      final fulfillment = AdminFulfillment(
        id: 'ful_test123',
        locationId: 'loc_test',
        providerId: 'prov_test',
        packedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        shippedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        deliveredAt: null,
        canceledAt: null,
        data: const {'tracking_number': 'TRACK123'},
        deliveryAddress: const AdminFulfillmentAddress(
          firstName: 'John',
          lastName: 'Doe',
          company: 'Medusa',
          address1: 'Main St 1',
          city: 'New York',
          countryCode: 'US',
          postalCode: '10001',
        ),
        items: const <AdminFulfillmentItem>[],
        labels: const <AdminFulfillmentLabel>[],
        requiresShipping: true,
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-03T00:00:00Z'),
        metadata: const {'priority': 'high'},
      );

      final json = fulfillment.toJson();

      expect(json['id'], equals('ful_test123'));
      expect(json['location_id'], equals('loc_test'));
      expect(json['provider_id'], equals('prov_test'));
      expect(json['requires_shipping'], isTrue);
      expect(json['metadata']['priority'], equals('high'));
    });

    test('AdminFulfillmentFilters serializes correctly', () {
      const filters = AdminFulfillmentFilters(
        orderId: ['order_1'],
        status: ['shipped'],
        locationId: 'loc_test',
        providerId: 'prov_test',
      );

      final json = filters.toJson();

      expect(json['order_id'], equals(['order_1']));
      expect(json['status'], equals(['shipped']));
      expect(json['location_id'], equals('loc_test'));
      expect(json['provider_id'], equals('prov_test'));
    });
  });
}
