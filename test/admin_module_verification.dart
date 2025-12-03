// =============================================================================
// ADMIN MODULE VERIFICATION - Phase 6B Status Check
// =============================================================================

import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';
import 'package:test/test.dart';

/// Verification test for Admin module functionality and resource availability
///
/// This test verifies that all active Admin resources are properly:
/// - Instantiated in the MedusaAdmin class
/// - Accessible through the medusa.admin interface
/// - Using correct resource classes and inheritance
///
/// Current Status: All admin resources active (100% coverage)
void main() {
  group('Admin Module Verification - Phase 6B', () {
    late Medusa medusa;

    setUp(() {
      medusa = Medusa(
        MedusaConfig(
          baseUrl: 'https://test.medusajs.com',
          publishableKey: 'test_pk',
        ),
      );
    });

    test('Admin module should be properly initialized', () {
      expect(medusa.admin, isNotNull);
      expect(medusa.admin, isA<MedusaAdmin>());
    });

    group('Core Commerce Resources', () {
      test('should have essential commerce resources', () {
        // Core product management
        expect(medusa.admin.product, isA<AdminProductResource>());
        expect(medusa.admin.productTag, isA<AdminProductTagResource>());
        expect(medusa.admin.productType, isA<AdminProductTypeResource>());
        expect(medusa.admin.productCollection, isA<AdminCollectionResource>());
        expect(medusa.admin.productCategory, isA<AdminCategoryResource>());
        expect(medusa.admin.productVariant, isA<AdminProductVariantResource>());

        // Order management
        expect(medusa.admin.order, isA<AdminOrderResource>());
        expect(medusa.admin.orderEdit, isA<AdminOrderEditResource>());
        expect(medusa.admin.draftOrder, isA<AdminDraftOrderResource>());

        // Customer management
        expect(medusa.admin.customer, isA<AdminCustomerResource>());
        expect(medusa.admin.customerGroup, isA<AdminCustomerGroupResource>());

        // Inventory management
        expect(medusa.admin.inventory, isA<AdminInventoryResource>());
        expect(medusa.admin.inventoryItem, isA<AdminInventoryItemResource>());
        expect(medusa.admin.stockLocation, isA<AdminStockLocationResource>());
      });
    });

    group('Enhanced v2.10 Features', () {
      test('should have v2.10+ specific resources', () {
        // Workflow execution (v2.10+)
        expect(
          medusa.admin.workflowExecution,
          isA<AdminWorkflowExecutionResource>(),
        );

        // Shipping option types (v2.10+)
        expect(
          medusa.admin.shippingOptionType,
          isA<AdminShippingOptionTypeResource>(),
        );

        // Enhanced tax management
        expect(medusa.admin.taxProvider, isA<AdminTaxProviderResource>());
        expect(medusa.admin.taxRate, isA<AdminTaxRateResource>());
        expect(medusa.admin.taxRegion, isA<AdminTaxRegionResource>());

        // Campaign management
        expect(medusa.admin.campaign, isA<AdminCampaignResource>());
        expect(medusa.admin.promotion, isA<AdminPromotionResource>());
      });
    });

    group('Infrastructure Resources', () {
      test('should have infrastructure management resources', () {
        // Regions and sales channels
        expect(medusa.admin.region, isA<AdminRegionResource>());
        expect(medusa.admin.salesChannel, isA<AdminSalesChannelResource>());

        // Fulfillment infrastructure
        expect(
          medusa.admin.fulfillmentProvider,
          isA<AdminFulfillmentProviderResource>(),
        );
        expect(medusa.admin.fulfillmentSet, isA<AdminFulfillmentSetResource>());

        // Shipping management
        expect(medusa.admin.shippingOption, isA<AdminShippingOptionResource>());
        expect(
          medusa.admin.shippingProfile,
          isA<AdminShippingProfileResource>(),
        );

        // Store and currency
        expect(medusa.admin.store, isA<AdminStoreResource>());
        expect(medusa.admin.currency, isA<AdminCurrencyResource>());
      });
    });

    group('Administrative Features', () {
      test('should have admin management resources', () {
        // API keys and invites
        expect(medusa.admin.apiKey, isA<AdminApiKeyResource>());
        expect(medusa.admin.invite, isA<AdminInviteResource>());

        // Notifications and uploads
        expect(medusa.admin.notification, isA<AdminNotificationResource>());
        expect(medusa.admin.upload, isA<AdminUploadResource>());

        // Pricing and preferences
        expect(medusa.admin.priceList, isA<AdminPriceListResource>());
        expect(
          medusa.admin.pricePreference,
          isA<AdminPricePreferenceResource>(),
        );

        // Plugins
        expect(medusa.admin.plugin, isA<AdminPluginResource>());
      });
    });

    group('Returns and Exchanges', () {
      test('should have returns management resources', () {
        // Returns
        expect(medusa.admin.returnResource, isA<AdminReturnResource>());
        expect(medusa.admin.returnReason, isA<AdminReturnReasonResource>());
        expect(medusa.admin.refundReason, isA<AdminRefundReasonResource>());

        // Exchanges (newly enabled)
        expect(medusa.admin.exchange, isA<AdminExchangeResource>());

        // Claims and reservations
        expect(medusa.admin.claim, isA<AdminClaimResource>());
        expect(medusa.admin.reservation, isA<AdminReservationResource>());
      });
    });

    group('Collections and Categories', () {
      test('should have content management resources', () {
        // Product organization
        expect(medusa.admin.collection, isA<AdminCollectionResource>());
        expect(medusa.admin.category, isA<AdminCategoryResource>());
      });
    });

    group('Resource Count Verification', () {
      test('should report full availability', () {
        final adminInstance = medusa.admin;
        final available = adminInstance.availableResources.length;
        final disabled = adminInstance.disabledResources.length;

        expect(available, equals(AdminModuleStats.totalResources));
        expect(disabled, isZero);
      });
    });
  });

  group('Integration Verification', () {
    test('should maintain Store module functionality', () {
      final medusa = Medusa(
        MedusaConfig(
          baseUrl: 'https://test.medusajs.com',
          publishableKey: 'test_pk',
        ),
      );

      // Verify Store module is unaffected by Admin changes
      expect(medusa.store, isNotNull);
      expect(medusa.store, isA<MedusaStore>());

      // Key Store resources should remain functional
      expect(medusa.store.product, isA<StoreProductResource>());
      expect(medusa.store.cart, isA<StoreCartResource>());
      expect(medusa.store.order, isA<StoreOrderResource>());
      expect(medusa.store.customer, isA<StoreCustomerResource>());
      expect(medusa.store.region, isA<StoreRegionResource>());
    });
  });
}
