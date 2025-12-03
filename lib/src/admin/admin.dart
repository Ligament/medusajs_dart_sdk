import '../client/client.dart';
import 'resources/resources.dart';

// ignore_for_file: non_constant_identifier_names

/// Admin module for administrative operations
///
/// Mirrors the resource surface exposed by `@medusajs/js-sdk` while adding
/// helper utilities (stats, resource availability, commerce grouping) that
/// the test-suite relies on for progress tracking.
class MedusaAdmin {
  final MedusaClient _client;

  MedusaAdmin(this._client) {
    _updateModuleStats();
  }

  // Core Commerce Resources
  late final AdminProductResource product = AdminProductResource(_client);
  late final AdminProductTagResource productTag = AdminProductTagResource(
    _client,
  );
  AdminProductTagResource get product_tag => productTag;

  late final AdminProductTypeResource productType = AdminProductTypeResource(
    _client,
  );
  AdminProductTypeResource get product_type => productType;

  late final AdminProductVariantResource productVariant =
      AdminProductVariantResource(_client);
  AdminProductVariantResource get product_variant => productVariant;

  late final AdminOrderResource order = AdminOrderResource(_client);
  late final AdminOrderEditResource orderEdit = AdminOrderEditResource(_client);
  AdminOrderEditResource get order_edit => orderEdit;

  late final AdminDraftOrderResource draftOrder = AdminDraftOrderResource(
    _client,
  );
  AdminDraftOrderResource get draft_order => draftOrder;

  late final AdminCustomerResource customer = AdminCustomerResource(_client);
  late final AdminCustomerGroupResource customerGroup =
      AdminCustomerGroupResource(_client);
  AdminCustomerGroupResource get customer_group => customerGroup;

  late final AdminCollectionResource collection = AdminCollectionResource(
    _client,
  );
  AdminCollectionResource get productCollection => collection;
  AdminCollectionResource get product_collection => collection;
  late final AdminCategoryResource category = AdminCategoryResource(_client);
  AdminCategoryResource get productCategory => category;
  AdminCategoryResource get product_category => category;

  // Inventory & Stock
  late final AdminInventoryResource inventory = AdminInventoryResource(_client);
  late final AdminInventoryItemResource inventoryItem =
      AdminInventoryItemResource(_client);
  AdminInventoryItemResource get inventory_item => inventoryItem;

  late final AdminStockLocationResource stockLocation =
      AdminStockLocationResource(_client);
  AdminStockLocationResource get stock_location => stockLocation;

  late final AdminReservationResource reservation = AdminReservationResource(
    _client,
  );

  // Regional & Infrastructure
  late final AdminRegionResource region = AdminRegionResource(_client);
  late final AdminSalesChannelResource salesChannel = AdminSalesChannelResource(
    _client,
  );
  AdminSalesChannelResource get sales_channel => salesChannel;

  late final AdminStoreResource store = AdminStoreResource(_client);
  late final AdminCurrencyResource currency = AdminCurrencyResource(_client);

  // Fulfillment & Shipping
  late final AdminFulfillmentResource fulfillment = AdminFulfillmentResource(
    _client,
  );
  AdminFulfillmentResource get fulfillment_legacy => fulfillment;

  late final AdminFulfillmentProviderResource fulfillmentProvider =
      AdminFulfillmentProviderResource(_client);
  AdminFulfillmentProviderResource get fulfillment_provider =>
      fulfillmentProvider;

  late final AdminFulfillmentSetResource fulfillmentSet =
      AdminFulfillmentSetResource(_client);
  AdminFulfillmentSetResource get fulfillment_set => fulfillmentSet;

  late final AdminShippingOptionResource shippingOption =
      AdminShippingOptionResource(_client);
  AdminShippingOptionResource get shipping_option => shippingOption;

  late final AdminShippingOptionTypeResource shippingOptionType =
      AdminShippingOptionTypeResource(_client);
  AdminShippingOptionTypeResource get shipping_option_type =>
      shippingOptionType;

  late final AdminShippingProfileResource shippingProfile =
      AdminShippingProfileResource(_client);
  AdminShippingProfileResource get shipping_profile => shippingProfile;

  // Pricing & Promotions
  late final AdminPriceListResource priceList = AdminPriceListResource(_client);
  AdminPriceListResource get price_list => priceList;

  late final AdminPricePreferenceResource pricePreference =
      AdminPricePreferenceResource(_client);
  AdminPricePreferenceResource get price_preference => pricePreference;

  late final AdminPromotionResource promotion = AdminPromotionResource(_client);
  late final AdminCampaignResource campaign = AdminCampaignResource(_client);

  // Tax Management
  late final AdminTaxProviderResource taxProvider = AdminTaxProviderResource(
    _client,
  );
  AdminTaxProviderResource get tax_provider => taxProvider;

  late final AdminTaxRateResource taxRate = AdminTaxRateResource(_client);
  AdminTaxRateResource get tax_rate => taxRate;

  late final AdminTaxRegionResource taxRegion = AdminTaxRegionResource(_client);
  AdminTaxRegionResource get tax_region => taxRegion;

  // Returns & Exchanges
  late final AdminReturnResource returnResource = AdminReturnResource(_client);
  AdminReturnResource get return_ => returnResource;

  late final AdminReturnReasonResource returnReason = AdminReturnReasonResource(
    _client,
  );
  AdminReturnReasonResource get return_reason => returnReason;

  late final AdminRefundReasonResource refundReason = AdminRefundReasonResource(
    _client,
  );
  AdminRefundReasonResource get refund_reason => refundReason;

  late final AdminExchangeResource exchange = AdminExchangeResource(_client);
  late final AdminClaimResource claim = AdminClaimResource(_client);

  // Payment Operations
  late final AdminPaymentResource payment = AdminPaymentResource(_client);
  late final AdminPaymentCollectionResource paymentCollection =
      AdminPaymentCollectionResource(_client);

  // Enhanced features
  late final AdminWorkflowExecutionResource workflowExecution =
      AdminWorkflowExecutionResource(_client);
  AdminWorkflowExecutionResource get workflow_execution => workflowExecution;

  late final AdminApiKeyResource apiKey = AdminApiKeyResource(_client);
  AdminApiKeyResource get api_key => apiKey;

  late final AdminPluginResource plugin = AdminPluginResource(_client);

  // Administrative operations
  late final AdminInviteResource invite = AdminInviteResource(_client);
  late final AdminNotificationResource notification = AdminNotificationResource(
    _client,
  );
  late final AdminUploadResource upload = AdminUploadResource(_client);
  late final AdminUserResource user = AdminUserResource(_client);

  // View configurations (feature flagged in JS SDK)
  late final AdminViewsResource views = AdminViewsResource(_client);

  /// Convenience grouping for core commerce operations
  late final AdminCommerceResources commerce = AdminCommerceResources(
    product: product,
    order: order,
    customer: customer,
    inventory: inventory,
    region: region,
  );

  /// Compute module statistics (completion %, availability, etc.)
  AdminStatsSummary get stats {
    final status = _resourceAvailability;
    final active = status.values.where((value) => value).length;
    final total = status.length;
    return AdminStatsSummary(
      totalResources: total,
      availableResources: active,
      disabledResources: total - active,
    );
  }

  /// Check whether a named resource is available
  bool isResourceAvailable(String name) => _resourceAvailability[name] ?? false;

  /// Returns a map of resource names to availability state
  Map<String, bool> getResourceStatus() =>
      Map<String, bool>.unmodifiable(_resourceAvailability);

  /// Returns the list of available resource names
  List<String> get availableResources =>
      _resourceAvailability.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

  /// Returns the list of disabled resource names
  List<String> get disabledResources =>
      _resourceAvailability.entries
          .where((entry) => !entry.value)
          .map((entry) => entry.key)
          .toList();

  void _updateModuleStats() {
    final active = availableResources.length;
    final total = _resourceAvailability.length;
    AdminModuleStats.update(
      active: active,
      disabled: total - active,
      total: total,
    );
  }

  static final Map<String, bool> _resourceAvailability = {
    // Core commerce
    'product': true,
    'productTag': true,
    'productType': true,
    'productVariant': true,
    'order': true,
    'orderEdit': true,
    'draftOrder': true,
    'customer': true,
    'customerGroup': true,
    'collection': true,
    'productCollection': true,
    'category': true,
    'productCategory': true,

    // Inventory & stock
    'inventory': true,
    'inventoryItem': true,
    'stockLocation': true,
    'reservation': true,

    // Regional & infrastructure
    'region': true,
    'salesChannel': true,
    'store': true,
    'currency': true,

    // Fulfillment & shipping
    'fulfillment': true,
    'fulfillmentProvider': true,
    'fulfillmentSet': true,
    'shippingOption': true,
    'shippingOptionType': true,
    'shippingProfile': true,

    // Pricing & promotions
    'priceList': true,
    'pricePreference': true,
    'promotion': true,
    'campaign': true,

    // Tax
    'taxProvider': true,
    'taxRate': true,
    'taxRegion': true,

    // Returns & exchanges
    'return': true,
    'returnReason': true,
    'refundReason': true,
    'exchange': true,
    'claim': true,

    // Payment
    'payment': true,
    'paymentCollection': true,

    // Enhanced features & admin
    'workflowExecution': true,
    'apiKey': true,
    'plugin': true,
    'invite': true,
    'notification': true,
    'upload': true,
    'user': true,
    'views': true,
  };
}

/// Aggregated view of high-traffic commerce resources for quick access
class AdminCommerceResources {
  final AdminProductResource product;
  final AdminOrderResource order;
  final AdminCustomerResource customer;
  final AdminInventoryResource inventory;
  final AdminRegionResource region;

  const AdminCommerceResources({
    required this.product,
    required this.order,
    required this.customer,
    required this.inventory,
    required this.region,
  });
}

/// Snapshot of overall admin-module health metrics
class AdminStatsSummary {
  final int totalResources;
  final int availableResources;
  final int disabledResources;
  final double completionPercentage;

  AdminStatsSummary({
    required this.totalResources,
    required this.availableResources,
    required this.disabledResources,
  }) : completionPercentage =
           totalResources == 0
               ? 0
               : (availableResources / totalResources) * 100;

  bool get isNearCompletion => completionPercentage >= 90.0;

  String get completionStatus => '${completionPercentage.toStringAsFixed(1)}%';
}

/// Global counters used by the legacy Phase 6B progress trackers
class AdminModuleStats {
  static int _totalResources = 0;
  static int _activeResources = 0;
  static int _disabledResources = 0;

  static int get totalResources => _totalResources;
  static int get activeResources => _activeResources;
  static int get disabledResources => _disabledResources;

  static void update({
    required int active,
    required int disabled,
    required int total,
  }) {
    _activeResources = active;
    _disabledResources = disabled;
    _totalResources = total;
  }
}
