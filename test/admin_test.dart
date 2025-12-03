import 'package:test/test.dart';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  group('MedusaAdmin', () {
    late MedusaAdmin admin;
    late MedusaClient client;

    setUp(() {
      final config = MedusaConfig(
        baseUrl: 'https://test-medusa-backend.com',
        publishableKey: 'pk_test_123',
      );
      client = MedusaClient(config);
      admin = MedusaAdmin(client);
    });

    tearDown(() {
      client.dispose();
    });

    test('should create admin instance', () {
      expect(admin, isNotNull);
      expect(admin, isA<MedusaAdmin>());
    });

    group('Core Admin Resources', () {
      test('should have product resource', () {
        expect(admin.product, isNotNull);
        expect(admin.product, isA<AdminProductResource>());
      });

      test('should have order resource', () {
        expect(admin.order, isNotNull);
        expect(admin.order, isA<AdminOrderResource>());
      });

      test('should have customer resource', () {
        expect(admin.customer, isNotNull);
        expect(admin.customer, isA<AdminCustomerResource>());
      });

      test('should have category resource', () {
        expect(admin.category, isNotNull);
        expect(admin.category, isA<AdminCategoryResource>());
      });

      test('should have collection resource', () {
        expect(admin.collection, isNotNull);
        expect(admin.collection, isA<AdminCollectionResource>());
      });
    });

    group('Extended Admin Resources', () {
      test('should have api key resource', () {
        expect(admin.apiKey, isNotNull);
        expect(admin.apiKey, isA<AdminApiKeyResource>());
      });

      test('should have campaign resource', () {
        expect(admin.campaign, isNotNull);
        expect(admin.campaign, isA<AdminCampaignResource>());
      });

      test('should have claim resource', () {
        expect(admin.claim, isNotNull);
        expect(admin.claim, isA<AdminClaimResource>());
      });

      test('should have currency resource', () {
        expect(admin.currency, isNotNull);
        expect(admin.currency, isA<AdminCurrencyResource>());
      });

      test('should have customer group resource', () {
        expect(admin.customerGroup, isNotNull);
        expect(admin.customerGroup, isA<AdminCustomerGroupResource>());
      });

      test('should have draft order resource', () {
        expect(admin.draftOrder, isNotNull);
        expect(admin.draftOrder, isA<AdminDraftOrderResource>());
      });

      test('should have exchange resource', () {
        expect(admin.exchange, isNotNull);
        expect(admin.exchange, isA<AdminExchangeResource>());
      });

      test('should have fulfillment resource', () {
        expect(admin.fulfillment, isNotNull);
        expect(admin.fulfillment, isA<AdminFulfillmentResource>());
      });

      test('should have fulfillment provider resource', () {
        expect(admin.fulfillmentProvider, isNotNull);
        expect(
          admin.fulfillmentProvider,
          isA<AdminFulfillmentProviderResource>(),
        );
      });

      test('should have fulfillment set resource', () {
        expect(admin.fulfillmentSet, isNotNull);
        expect(admin.fulfillmentSet, isA<AdminFulfillmentSetResource>());
      });

      test('should have inventory item resource', () {
        expect(admin.inventoryItem, isNotNull);
        expect(admin.inventoryItem, isA<AdminInventoryItemResource>());
      });

      test('should have invite resource', () {
        expect(admin.invite, isNotNull);
        expect(admin.invite, isA<AdminInviteResource>());
      });

      test('should have notification resource', () {
        expect(admin.notification, isNotNull);
        expect(admin.notification, isA<AdminNotificationResource>());
      });

      test('should have order edit resource', () {
        expect(admin.orderEdit, isNotNull);
        expect(admin.orderEdit, isA<AdminOrderEditResource>());
      });

      test('should have payment resource', () {
        expect(admin.payment, isNotNull);
        expect(admin.payment, isA<AdminPaymentResource>());
      });

      test('should have payment collection resource', () {
        expect(admin.paymentCollection, isNotNull);
        expect(admin.paymentCollection, isA<AdminPaymentCollectionResource>());
      });

      test('should have plugin resource', () {
        expect(admin.plugin, isNotNull);
        expect(admin.plugin, isA<AdminPluginResource>());
      });

      test('should have views resource', () {
        expect(admin.views, isNotNull);
        expect(admin.views, isA<AdminViewsResource>());
      });

      test('should have price list resource', () {
        expect(admin.priceList, isNotNull);
        expect(admin.priceList, isA<AdminPriceListResource>());
      });

      test('should have price preference resource', () {
        expect(admin.pricePreference, isNotNull);
        expect(admin.pricePreference, isA<AdminPricePreferenceResource>());
      });

      test('should have product tag resource', () {
        expect(admin.productTag, isNotNull);
        expect(admin.productTag, isA<AdminProductTagResource>());
      });

      test('should have product type resource', () {
        expect(admin.productType, isNotNull);
        expect(admin.productType, isA<AdminProductTypeResource>());
      });

      test('should have product variant resource', () {
        expect(admin.productVariant, isNotNull);
        expect(admin.productVariant, isA<AdminProductVariantResource>());
      });

      test('should have promotion resource', () {
        expect(admin.promotion, isNotNull);
        expect(admin.promotion, isA<AdminPromotionResource>());
      });

      test('should have refund reason resource', () {
        expect(admin.refundReason, isNotNull);
        expect(admin.refundReason, isA<AdminRefundReasonResource>());
      });

      test('should have reservation resource', () {
        expect(admin.reservation, isNotNull);
        expect(admin.reservation, isA<AdminReservationResource>());
      });

      test('should have return resource', () {
        expect(admin.returnResource, isNotNull);
        expect(admin.returnResource, isA<AdminReturnResource>());
      });

      test('should have return reason resource', () {
        expect(admin.returnReason, isNotNull);
        expect(admin.returnReason, isA<AdminReturnReasonResource>());
      });

      test('should have sales channel resource', () {
        expect(admin.salesChannel, isNotNull);
        expect(admin.salesChannel, isA<AdminSalesChannelResource>());
      });

      test('should have shipping option resource', () {
        expect(admin.shippingOption, isNotNull);
        expect(admin.shippingOption, isA<AdminShippingOptionResource>());
      });

      test('should have shipping profile resource', () {
        expect(admin.shippingProfile, isNotNull);
        expect(admin.shippingProfile, isA<AdminShippingProfileResource>());
      });

      test('should have stock location resource', () {
        expect(admin.stockLocation, isNotNull);
        expect(admin.stockLocation, isA<AdminStockLocationResource>());
      });

      test('should have store resource', () {
        expect(admin.store, isNotNull);
        expect(admin.store, isA<AdminStoreResource>());
      });

      test('should have tax provider resource', () {
        expect(admin.taxProvider, isNotNull);
        expect(admin.taxProvider, isA<AdminTaxProviderResource>());
      });

      test('should have tax rate resource', () {
        expect(admin.taxRate, isNotNull);
        expect(admin.taxRate, isA<AdminTaxRateResource>());
      });

      test('should have tax region resource', () {
        expect(admin.taxRegion, isNotNull);
        expect(admin.taxRegion, isA<AdminTaxRegionResource>());
      });

      test('should have upload resource', () {
        expect(admin.upload, isNotNull);
        expect(admin.upload, isA<AdminUploadResource>());
      });

      // test('should have workflow execution resource', () {
      //   expect(admin.workflowExecution, isNotNull);
      //   expect(admin.workflowExecution, isA<AdminWorkflowExecutionResource>());
      // });
    });

    group('Resource Path Validation', () {
      test('admin product resource should have correct path', () {
        expect(admin.product.resourcePath, equals('/admin/products'));
      });

      test('admin order resource should have correct path', () {
        expect(admin.order.resourcePath, equals('/admin/orders'));
      });

      test('admin customer resource should have correct path', () {
        expect(admin.customer.resourcePath, equals('/admin/customers'));
      });

      test('admin api key resource should have correct path', () {
        expect(admin.apiKey.resourcePath, equals('/admin/api-keys'));
      });

      test('admin campaign resource should have correct path', () {
        expect(admin.campaign.resourcePath, equals('/admin/campaigns'));
      });
    });

    group('Resource Inheritance', () {
      test('all admin resources should extend AdminResource', () {
        expect(admin.product, isA<AdminResource>());
        expect(admin.order, isA<AdminResource>());
        expect(admin.customer, isA<AdminResource>());
        expect(admin.apiKey, isA<AdminResource>());
        expect(admin.campaign, isA<AdminResource>());
        expect(admin.claim, isA<AdminResource>());
        expect(admin.currency, isA<AdminResource>());
        expect(admin.customerGroup, isA<AdminResource>());
        expect(admin.draftOrder, isA<AdminResource>());
        expect(admin.exchange, isA<AdminResource>());
        expect(admin.fulfillment, isA<AdminResource>());
        expect(admin.fulfillmentProvider, isA<AdminResource>());
        expect(admin.fulfillmentSet, isA<AdminResource>());
        expect(admin.inventoryItem, isA<AdminResource>());
        expect(admin.invite, isA<AdminResource>());
        expect(admin.notification, isA<AdminResource>());
        expect(admin.orderEdit, isA<AdminResource>());
        expect(admin.payment, isA<AdminResource>());
        expect(admin.paymentCollection, isA<AdminResource>());
        expect(admin.plugin, isA<AdminResource>());
        expect(admin.priceList, isA<AdminResource>());
        expect(admin.pricePreference, isA<AdminResource>());
        expect(admin.productTag, isA<AdminResource>());
        expect(admin.productType, isA<AdminResource>());
        expect(admin.productVariant, isA<AdminResource>());
        expect(admin.promotion, isA<AdminResource>());
        expect(admin.refundReason, isA<AdminResource>());
        expect(admin.reservation, isA<AdminResource>());
        expect(admin.returnResource, isA<AdminResource>());
        expect(admin.returnReason, isA<AdminResource>());
        expect(admin.salesChannel, isA<AdminResource>());
        expect(admin.shippingOption, isA<AdminResource>());
        expect(admin.shippingProfile, isA<AdminResource>());
        expect(admin.stockLocation, isA<AdminResource>());
        expect(admin.store, isA<AdminResource>());
        expect(admin.taxProvider, isA<AdminResource>());
        expect(admin.taxRate, isA<AdminResource>());
        expect(admin.taxRegion, isA<AdminResource>());
        expect(admin.upload, isA<AdminResource>());
        // expect(admin.workflowExecution, isA<AdminResource>());
      });
    });
  });
}
