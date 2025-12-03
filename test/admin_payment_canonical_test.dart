import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('AdminPayment Canonical Model', () {
    test('AdminPayment JSON round-trip + decimal helpers', () {
      final payment = AdminPayment(
        id: 'pay_test',
        amount: 15000,
        authorizedAmount: 15000,
        capturedAmount: 10000,
        refundedAmount: 2000,
        currencyCode: 'usd',
        providerId: 'stripe',
        orderId: 'order_test',
        customerId: 'cust_test',
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        updatedAt: DateTime.parse('2024-01-01T00:00:00Z'),
        capturedAt: DateTime.parse('2024-01-02T00:00:00Z'),
        metadata: const {'source': 'demo'},
      );

      final json = payment.toJson();
      final parsed = AdminPayment.fromJson(json);

      expect(parsed.id, equals('pay_test'));
      expect(parsed.amountDecimal, equals(150.0));
      expect(parsed.authorizedAmountDecimal, equals(150.0));
      expect(parsed.capturedAmountDecimal, equals(100.0));
      expect(parsed.refundedAmountDecimal, equals(20.0));
      expect(parsed.metadata!['source'], equals('demo'));
    });

    test('BaseCapture serialization', () {
      final capture = BaseCapture(
        id: 'cap_test',
        amount: 5000,
        createdAt: DateTime.parse('2024-01-01T00:00:00Z'),
        createdBy: 'admin',
      );

      final json = capture.toJson();
      final parsed = BaseCapture.fromJson(json);

      expect(parsed.id, equals('cap_test'));
      expect(parsed.amountDecimal, equals(50.0));
      expect(parsed.createdBy, equals('admin'));
    });

    test('AdminRefund serialization', () {
      final refund = AdminRefund(
        id: 'ref_test',
        paymentId: 'pay_test',
        amount: 3000,
        note: 'Customer requested refund',
        createdAt: DateTime.parse('2024-01-02T00:00:00Z'),
        refundReasonId: 'reason_1',
        metadata: const {'channel': 'support'},
      );

      final json = refund.toJson();
      final parsed = AdminRefund.fromJson(json);

      expect(parsed.id, equals('ref_test'));
      expect(parsed.amountDecimal, equals(30.0));
      expect(parsed.note, equals('Customer requested refund'));
      expect(parsed.metadata!['channel'], equals('support'));
    });
  });
}
