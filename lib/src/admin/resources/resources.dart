// =============================================================================
// MedusaJS Admin Resources – v2.11.3
// =============================================================================
// Central export barrel for every Admin API surface that the JS SDK exposes.
// Grouped by business domain for easier discoverability and parity tracking.
// =============================================================================

// =====================================================================
// 🏪 CORE COMMERCE RESOURCES (11/11 active) ✅ COMPLETE
// =====================================================================
// Essential e-commerce operations covering the complete product-to-order
// lifecycle with comprehensive management capabilities.

export 'product.dart'; // 📦 Product catalog & lifecycle management
export 'product_tag.dart'; // 🏷️ Product tagging & categorization system
export 'product_type.dart'; // 📋 Product type definitions & attributes
export 'product_variant.dart'; // 🎨 Product variant & option management
export 'order.dart'; // 🛒 Order processing & lifecycle management
export 'order_edit.dart'; // ✏️ Order modification & update operations
export 'draft_order.dart'; // 📝 Draft order creation & management
export 'customer.dart'; // 👤 Customer account & profile management
export 'customer_group.dart'; // 👥 Customer segmentation & grouping
export 'collection.dart'; // 📚 Product collection organization
export 'category.dart'; // 🗂️ Product category hierarchy & navigation

// =====================================================================
// 📦 INVENTORY & STOCK MANAGEMENT (4/4 active) ✅ COMPLETE
// =====================================================================
// Comprehensive inventory tracking with multi-location support and
// real-time stock management capabilities.

export 'inventory.dart'; // 📊 Central inventory tracking & analytics
export 'inventory_item.dart'; // 📋 Individual inventory item management
export 'stock_location.dart'; // 🏢 Multi-warehouse & location management
export 'reservation.dart'; // 🔒 Stock reservation & allocation system

// =====================================================================
// 🌍 REGIONAL & INFRASTRUCTURE (4/4 active) ✅ COMPLETE
// =====================================================================
// Geographic configuration and system infrastructure for global
// e-commerce operations with multi-region support.

export 'region.dart'; // 🗺️ Geographic region configuration & management
export 'sales_channel.dart'; // 📺 Multi-channel sales configuration
export 'store.dart'; // 🏬 Store settings & configuration management
export 'currency.dart'; // 💱 Multi-currency support & conversion

// =====================================================================
// 🚚 FULFILLMENT & SHIPPING (5/6 active) ✅ NEAR COMPLETE
// =====================================================================
// Advanced shipping and logistics with provider integration and
// comprehensive fulfillment workflow management.

export 'fulfillment_provider.dart'; // 🚛 Third-party shipping provider integration
export 'fulfillment_set.dart'; // 📦 Fulfillment grouping & configuration
export 'fulfillment.dart'; // 📮 Direct fulfillment management
export 'shipping_option.dart'; // 🚢 Shipping method definitions & pricing
export 'shipping_option_type.dart'; // 🏷️ Shipping type classification (v2.10+)
export 'shipping_profile.dart'; // 📋 Shipping profile & rule management

// =====================================================================
// 💰 PRICING & PROMOTIONS (4/4 active) ✅ COMPLETE
// =====================================================================
// Dynamic pricing engine with advanced promotion campaigns and
// sophisticated marketing automation capabilities.

export 'price_list.dart'; // 💲 Dynamic pricing & customer-specific rates
export 'price_preference.dart'; // ⚙️ Pricing strategy & preference configuration
export 'promotion.dart'; // 🎯 Marketing promotion & discount campaigns
export 'campaign.dart'; // 📢 Campaign management & automation (v2.10+)

// =====================================================================
// 🧾 TAX MANAGEMENT (3/3 active) ✅ COMPLETE
// =====================================================================
// Comprehensive tax calculation with multi-jurisdiction support and
// automated compliance for global e-commerce operations.

export 'tax_provider.dart'; // 🧮 Tax calculation engine & provider integration
export 'tax_rate.dart'; // 📊 Tax rate configuration & management
export 'tax_region.dart'; // 🗺️ Geographic tax jurisdiction mapping

// =====================================================================
// 🔄 RETURNS & EXCHANGES (5/5 active) ✅ COMPLETE
// =====================================================================
// Complete return lifecycle management with exchange processing and
// automated refund workflows for enhanced customer experience.

export 'return.dart'; // 📤 Return request processing & management
export 'return_reason.dart'; // 📝 Return reason classification & tracking
export 'refund_reason.dart'; // 💳 Refund reason & policy configuration
export 'exchange.dart'; // 🔄 Product exchange processing (v2.10+)
export 'claim.dart'; // ⚖️ Order dispute & claim management

// =====================================================================
// 💳 PAYMENT OPERATIONS (2/2 active) ✅ COMPLETE
// =====================================================================

export 'payment.dart'; // 💳 Payment processing lifecycle management
export 'payment_collection.dart'; // 🧾 Payment collection orchestration

// =====================================================================
// ⚡ ENHANCED v2.10+ FEATURES (3/3 active) ✅ COMPLETE
// =====================================================================
// Cutting-edge automation and integration capabilities introduced in
// Medusa v2.10+ for advanced business process management.

export 'workflow_execution.dart'; // 🔄 Business process automation & workflows
export 'api_key.dart'; // 🔑 API key management & access control
export 'plugin.dart'; // 🔌 Plugin system integration & extensions

// =====================================================================
// ⚙️ ADMINISTRATIVE OPERATIONS (3/4 active) ✅ NEAR COMPLETE
// =====================================================================
// System administration and management tools for platform operation
// and user management capabilities.

export 'invite.dart'; // 📧 User invitation & onboarding system
export 'notification.dart'; // 📱 Notification management & delivery
export 'upload.dart'; // 📁 File upload & media management
export 'user.dart'; // 👤 Admin user management APIs
export 'views.dart'; // 🧩 View configuration management (feature flagged)
