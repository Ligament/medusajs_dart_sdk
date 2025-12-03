import 'dart:io';

import 'package:medusajs_dart_sdk/medusajs_dart_sdk.dart';

/// Basic configuration used by [MedusaServiceProvider].
class MedusaServiceProviderConfig {
  final String baseUrl;
  final String? publishableKey;
  final bool debug;
  final Duration requestTimeout;
  final int maxRetries;
  final Map<String, dynamic>? defaultHeaders;

  const MedusaServiceProviderConfig({
    required this.baseUrl,
    this.publishableKey,
    this.debug = false,
    this.requestTimeout = const Duration(seconds: 20),
    this.maxRetries = 3,
    this.defaultHeaders,
  });
}

/// Wraps the `Medusa` SDK and offers a single entry point for store, admin,
/// auth, realtime, and webhook helpers.
class MedusaServiceProvider {
  final MedusaServiceProviderConfig config;
  final MedusaCache cache;

  Medusa? _sdk;

  MedusaServiceProvider({required this.config, MedusaCache? cache})
    : cache = cache ?? MedusaCache();

  bool get isInitialized => _sdk != null;

  /// Lazily create the Medusa SDK instance.
  Medusa get sdk => _sdk ??= Medusa(
    MedusaConfig(
      baseUrl: config.baseUrl,
      publishableKey: config.publishableKey,
      debug: config.debug,
      timeout: config.requestTimeout,
      maxRetries: config.maxRetries,
      globalHeaders: config.defaultHeaders,
      logger: config.debug ? ConsoleLogger() : null,
    ),
    cache: cache,
  );

  MedusaStore get store => sdk.store;
  MedusaAuth get auth => sdk.auth;
  MedusaClient get client => sdk.client;
  MedusaWebhooks get webhooks => sdk.webhooks;
  RealtimeManager get realtime => sdk.realtime;

  /// Preloads basic store/admin metadata to validate connectivity.
  Future<MedusaServiceHealth> warmUp() async {
    final storeRegions = await store.region.list(query: {'limit': 5});

    return MedusaServiceHealth(
      fetchedAt: DateTime.now().toUtc(),
      regionCount: storeRegions.count,
      sampleRegionIds: storeRegions.data
          .take(5)
          .map((region) => region.id)
          .toList(),
    );
  }

  /// Dispose any allocated resources.
  void dispose() {
    if (!isInitialized) return;
    _sdk?.dispose();
    _sdk = null;
  }
}

/// Snapshot returned by [MedusaServiceProvider.warmUp].
class MedusaServiceHealth {
  final DateTime fetchedAt;
  final int regionCount;
  final List<String> sampleRegionIds;

  const MedusaServiceHealth({
    required this.fetchedAt,
    required this.regionCount,
    required this.sampleRegionIds,
  });
}

/// Demonstrates creating and using the provider.
Future<void> main() async {
  final provider = MedusaServiceProvider(
    config: MedusaServiceProviderConfig(
      baseUrl: _env('MEDUSA_BASE_URL', 'http://localhost:9000'),
      publishableKey: _env('MEDUSA_PUBLISHABLE_KEY', ''),
      debug: true,
      defaultHeaders: const {
        'x-medusa-user-agent': 'medusajs-dart-sdk/service-provider-example',
      },
    ),
  );

  final health = await provider.warmUp();
  print('✅ Medusa service reachable at ${provider.config.baseUrl}');
  print('   Regions available: ${health.regionCount}');
  if (health.sampleRegionIds.isNotEmpty) {
    print('   Sample region IDs: ${health.sampleRegionIds.join(', ')}');
  }

  await _demoStoreFlow(
    provider,
    preferredRegion: health.sampleRegionIds.firstOrNull,
  );

  provider.dispose();
}

Future<void> _demoStoreFlow(
  MedusaServiceProvider provider, {
  String? preferredRegion,
}) async {
  print('\n🛍️  Store flow demo');
  final regionId = preferredRegion ?? 'reg_default';

  try {
    final cart = await provider.store.cart.create({'region_id': regionId});

    if (cart == null || cart.id == null) {
      print('   Failed to create cart – check region configuration.');
      return;
    }

    print('   Created cart ${cart.id} in region $regionId');

    final products = await provider.store.product.list(query: {'limit': 3});
    if (products.data.isEmpty) {
      print('   No products available to add to cart.');
      return;
    }

    final firstProduct = products.data.first;
    final variantId = firstProduct.variants?.isNotEmpty == true
        ? firstProduct.variants!.first.id
        : null;

    if (variantId == null) {
      print('   First product has no variants; skipping line item demo.');
      return;
    }

    final updatedCart = await provider.store.cart.createLineItem(cart.id!, {
      'variant_id': variantId,
      'quantity': 1,
    });

    print('   Added 1x ${firstProduct.title} to cart.');
    print('   Cart now has ${updatedCart?.items?.length ?? 0} line item(s).');
  } catch (err) {
    print('   ⚠️  Store flow failed: $err');
  }
}

String _env(String key, String fallback) =>
    Platform.environment[key] ?? fallback;

extension IterableFirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
