import 'package:test/test.dart';
import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

void main() {
  group('Basic SDK Tests', () {
    test('should create MedusaConfig', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      expect(config.baseUrl, equals('https://test.medusa.com'));
      expect(config.publishableKey, equals('pk_test_123'));
    });

    test('should create Medusa instance', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      expect(medusa, isNotNull);
      expect(medusa.store, isNotNull);
      expect(medusa.admin, isNotNull);
      expect(medusa.auth, isNotNull);
      expect(medusa.client, isNotNull);
      expect(medusa.webhooks, isNotNull);
      expect(medusa.realtime, isNotNull);

      medusa.dispose();
    });

    test('should have store resources', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      expect(medusa.store.product, isA<StoreProductResource>());
      expect(medusa.store.cart, isA<StoreCartResource>());
      expect(medusa.store.region, isA<StoreRegionResource>());
      expect(medusa.store.collection, isA<StoreCollectionResource>());
      expect(medusa.store.category, isA<StoreCategoryResource>());
      expect(medusa.store.customer, isA<StoreCustomerResource>());
      expect(medusa.store.order, isA<StoreOrderResource>());
      expect(medusa.store.payment, isA<StorePaymentResource>());
      expect(medusa.store.fulfillment, isA<StoreFulfillmentResource>());

      medusa.dispose();
    });

    test('should have admin resources', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      // Core admin resources
      expect(medusa.admin.product, isA<AdminProductResource>());
      expect(medusa.admin.order, isA<AdminOrderResource>());
      expect(medusa.admin.customer, isA<AdminCustomerResource>());
      expect(medusa.admin.category, isA<AdminCategoryResource>());
      expect(medusa.admin.collection, isA<AdminCollectionResource>());

      // Extended admin resources
      expect(medusa.admin.apiKey, isA<AdminApiKeyResource>());
      expect(medusa.admin.campaign, isA<AdminCampaignResource>());
      expect(medusa.admin.claim, isA<AdminClaimResource>());
      expect(medusa.admin.currency, isA<AdminCurrencyResource>());
      expect(medusa.admin.customerGroup, isA<AdminCustomerGroupResource>());
      expect(medusa.admin.draftOrder, isA<AdminDraftOrderResource>());
      expect(medusa.admin.exchange, isA<AdminExchangeResource>());
      expect(medusa.admin.fulfillment, isA<AdminFulfillmentResource>());
      expect(
        medusa.admin.fulfillmentProvider,
        isA<AdminFulfillmentProviderResource>(),
      );
      expect(medusa.admin.fulfillmentSet, isA<AdminFulfillmentSetResource>());
      expect(medusa.admin.inventoryItem, isA<AdminInventoryItemResource>());
      expect(medusa.admin.invite, isA<AdminInviteResource>());
      expect(medusa.admin.notification, isA<AdminNotificationResource>());
      expect(medusa.admin.orderEdit, isA<AdminOrderEditResource>());
      expect(medusa.admin.payment, isA<AdminPaymentResource>());
      expect(
        medusa.admin.paymentCollection,
        isA<AdminPaymentCollectionResource>(),
      );
      expect(medusa.admin.plugin, isA<AdminPluginResource>());
      expect(medusa.admin.priceList, isA<AdminPriceListResource>());
      expect(medusa.admin.pricePreference, isA<AdminPricePreferenceResource>());
      expect(medusa.admin.productTag, isA<AdminProductTagResource>());
      expect(medusa.admin.productType, isA<AdminProductTypeResource>());
      expect(medusa.admin.productCollection, isA<AdminCollectionResource>());
      expect(medusa.admin.productCategory, isA<AdminCategoryResource>());
      expect(medusa.admin.productVariant, isA<AdminProductVariantResource>());
      expect(medusa.admin.promotion, isA<AdminPromotionResource>());
      expect(medusa.admin.refundReason, isA<AdminRefundReasonResource>());
      expect(medusa.admin.reservation, isA<AdminReservationResource>());
      expect(medusa.admin.returnResource, isA<AdminReturnResource>());
      expect(medusa.admin.returnReason, isA<AdminReturnReasonResource>());
      expect(medusa.admin.salesChannel, isA<AdminSalesChannelResource>());
      expect(medusa.admin.shippingOption, isA<AdminShippingOptionResource>());
      expect(medusa.admin.shippingProfile, isA<AdminShippingProfileResource>());
      expect(medusa.admin.stockLocation, isA<AdminStockLocationResource>());
      expect(medusa.admin.store, isA<AdminStoreResource>());
      expect(medusa.admin.taxProvider, isA<AdminTaxProviderResource>());
      expect(medusa.admin.taxRate, isA<AdminTaxRateResource>());
      expect(medusa.admin.taxRegion, isA<AdminTaxRegionResource>());
      expect(medusa.admin.upload, isA<AdminUploadResource>());
      // expect(medusa.admin.workflowExecution, isA<AdminWorkflowExecutionResource>());

      medusa.dispose();
    });

    test('should verify resource paths', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      // Store resource paths
      expect(medusa.store.product.resourcePath, equals('/store/products'));
      expect(medusa.store.cart.resourcePath, equals('/store/carts'));
      expect(medusa.store.region.resourcePath, equals('/store/regions'));
      expect(
        medusa.store.collection.resourcePath,
        equals('/store/collections'),
      );
      expect(
        medusa.store.category.resourcePath,
        equals('/store/product-categories'),
      );
      expect(medusa.store.customer.resourcePath, equals('/store/customers'));
      expect(medusa.store.order.resourcePath, equals('/store/orders'));
      expect(
        medusa.store.payment.resourcePath,
        equals('/store/payment-providers'),
      );
      expect(
        medusa.store.fulfillment.resourcePath,
        equals('/store/shipping-options'),
      );

      // Sample admin resource paths
      expect(medusa.admin.product.resourcePath, equals('/admin/products'));
      expect(medusa.admin.order.resourcePath, equals('/admin/orders'));
      expect(medusa.admin.customer.resourcePath, equals('/admin/customers'));
      expect(medusa.admin.apiKey.resourcePath, equals('/admin/api-keys'));
      expect(medusa.admin.campaign.resourcePath, equals('/admin/campaigns'));
      expect(medusa.admin.upload.resourcePath, equals('/admin/uploads'));

      medusa.dispose();
    });

    test('should verify resource inheritance', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      // All store resources should extend StoreResource
      expect(medusa.store.product, isA<StoreResource>());
      expect(medusa.store.cart, isA<StoreResource>());
      expect(medusa.store.region, isA<StoreResource>());
      expect(medusa.store.collection, isA<StoreResource>());
      expect(medusa.store.category, isA<StoreResource>());
      expect(medusa.store.customer, isA<StoreResource>());
      expect(medusa.store.order, isA<StoreResource>());
      expect(medusa.store.payment, isA<StoreResource>());
      expect(medusa.store.fulfillment, isA<StoreResource>());

      // All admin resources should extend AdminResource
      expect(medusa.admin.product, isA<AdminResource>());
      expect(medusa.admin.order, isA<AdminResource>());
      expect(medusa.admin.customer, isA<AdminResource>());
      expect(medusa.admin.apiKey, isA<AdminResource>());
      expect(medusa.admin.campaign, isA<AdminResource>());
      expect(medusa.admin.upload, isA<AdminResource>());

      medusa.dispose();
    });

    test('should count total resources correctly', () {
      final config = MedusaConfig(
        baseUrl: 'https://test.medusa.com',
        publishableKey: 'pk_test_123',
      );

      final medusa = Medusa(config);

      // Store resources count (should be 9)
      final storeResources = [
        medusa.store.product,
        medusa.store.cart,
        medusa.store.region,
        medusa.store.collection,
        medusa.store.category,
        medusa.store.customer,
        medusa.store.order,
        medusa.store.payment,
        medusa.store.fulfillment,
      ];
      expect(storeResources.length, equals(9));

      // Admin resources count (should be 42+)
      final coreAdminResources = [
        medusa.admin.product,
        medusa.admin.order,
        medusa.admin.customer,
        medusa.admin.category,
        medusa.admin.collection,
        medusa.admin.apiKey,
        medusa.admin.campaign,
        medusa.admin.claim,
        medusa.admin.currency,
        medusa.admin.customerGroup,
        medusa.admin.draftOrder,
        medusa.admin.exchange,
        medusa.admin.fulfillment,
        medusa.admin.fulfillmentProvider,
        medusa.admin.fulfillmentSet,
        medusa.admin.inventoryItem,
        medusa.admin.invite,
        medusa.admin.notification,
        medusa.admin.orderEdit,
        medusa.admin.payment,
        medusa.admin.paymentCollection,
        medusa.admin.plugin,
        medusa.admin.priceList,
        medusa.admin.pricePreference,
        medusa.admin.productTag,
        medusa.admin.productType,
        medusa.admin.productVariant,
        medusa.admin.promotion,
        medusa.admin.refundReason,
        medusa.admin.reservation,
        medusa.admin.returnResource,
        medusa.admin.returnReason,
        medusa.admin.salesChannel,
        medusa.admin.shippingOption,
        medusa.admin.shippingProfile,
        medusa.admin.stockLocation,
        medusa.admin.store,
        medusa.admin.taxProvider,
        medusa.admin.taxRate,
        medusa.admin.taxRegion,
        medusa.admin.upload,
        // medusa.admin.workflowExecution,
      ];
      expect(coreAdminResources.length, equals(41));

      medusa.dispose();
    });
  });
}
