import 'dart:async';
import 'dart:convert';

/// Cache entry with expiration support
class CacheEntry<T> {
  final T data;
  final DateTime createdAt;
  final Duration? ttl;

  CacheEntry(this.data, {this.ttl}) : createdAt = DateTime.now();

  bool get isExpired {
    if (ttl == null) return false;
    return DateTime.now().difference(createdAt) > ttl!;
  }

  bool get isValid => !isExpired;
}

/// Cache storage interface
abstract class CacheStorage {
  Future<String?> get(String key);
  Future<void> set(String key, String value, {Duration? ttl});
  Future<void> remove(String key);
  Future<void> clear();
  Future<List<String>> keys();
}

/// In-memory cache storage implementation
class MemoryCacheStorage implements CacheStorage {
  final Map<String, CacheEntry<String>> _cache = {};

  @override
  Future<String?> get(String key) async {
    final entry = _cache[key];
    if (entry == null || entry.isExpired) {
      _cache.remove(key);
      return null;
    }
    return entry.data;
  }

  @override
  Future<void> set(String key, String value, {Duration? ttl}) async {
    _cache[key] = CacheEntry(value, ttl: ttl);
  }

  @override
  Future<void> remove(String key) async {
    _cache.remove(key);
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }

  @override
  Future<List<String>> keys() async {
    // Clean expired entries first
    final expiredKeys =
        _cache.entries
            .where((entry) => entry.value.isExpired)
            .map((entry) => entry.key)
            .toList();

    for (final key in expiredKeys) {
      _cache.remove(key);
    }

    return _cache.keys.toList();
  }

  /// Get cache statistics
  Map<String, dynamic> getStats() {
    var expired = 0;
    var valid = 0;

    for (final entry in _cache.values) {
      if (entry.isExpired) {
        expired++;
      } else {
        valid++;
      }
    }

    return {
      'total': _cache.length,
      'valid': valid,
      'expired': expired,
      'size_mb': _approximateSize(),
    };
  }

  double _approximateSize() {
    var totalBytes = 0;
    for (final entry in _cache.entries) {
      totalBytes += entry.key.length * 2; // UTF-16
      totalBytes += entry.value.data.length * 2; // UTF-16
      totalBytes += 50; // Overhead estimate
    }
    return totalBytes / (1024 * 1024); // Convert to MB
  }
}

/// Cache configuration
class CacheConfig {
  final Duration defaultTtl;
  final int maxSize;
  final bool enabled;
  final Duration cleanupInterval;

  const CacheConfig({
    this.defaultTtl = const Duration(minutes: 5),
    this.maxSize = 1000,
    this.enabled = true,
    this.cleanupInterval = const Duration(minutes: 10),
  });
}

/// Cache manager for Medusa SDK
class MedusaCache {
  final CacheStorage _storage;
  final CacheConfig _config;
  Timer? _cleanupTimer;

  MedusaCache({CacheStorage? storage, CacheConfig? config})
    : _storage = storage ?? MemoryCacheStorage(),
      _config = config ?? const CacheConfig() {
    _startCleanupTimer();
  }

  /// Get cached data
  Future<T?> get<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    if (!_config.enabled) return null;

    try {
      final jsonString = await _storage.get(key);
      if (jsonString == null) return null;

      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return fromJson(json);
    } catch (e) {
      // If deserialization fails, remove the invalid cache entry
      await _storage.remove(key);
      return null;
    }
  }

  /// Get cached JSON data
  Future<Map<String, dynamic>?> getJson(String key) async {
    if (!_config.enabled) return null;

    try {
      final jsonString = await _storage.get(key);
      if (jsonString == null) return null;
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      await _storage.remove(key);
      return null;
    }
  }

  /// Set cached data
  Future<void> set<T>(
    String key,
    T data,
    Map<String, dynamic> Function(T) toJson, {
    Duration? ttl,
  }) async {
    if (!_config.enabled) return;

    try {
      final json = toJson(data);
      final jsonString = jsonEncode(json);
      await _storage.set(key, jsonString, ttl: ttl ?? _config.defaultTtl);
    } catch (e) {
      // Silently ignore serialization errors
    }
  }

  /// Set cached JSON data
  Future<void> setJson(
    String key,
    Map<String, dynamic> data, {
    Duration? ttl,
  }) async {
    if (!_config.enabled) return;

    try {
      final jsonString = jsonEncode(data);
      await _storage.set(key, jsonString, ttl: ttl ?? _config.defaultTtl);
    } catch (e) {
      // Silently ignore serialization errors
    }
  }

  /// Remove cached data
  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  /// Clear all cached data
  Future<void> clear() async {
    await _storage.clear();
  }

  /// Check if key exists in cache
  Future<bool> has(String key) async {
    if (!_config.enabled) return false;
    return await _storage.get(key) != null;
  }

  /// Get cache keys
  Future<List<String>> keys() async {
    return await _storage.keys();
  }

  /// Generate cache key for API requests
  static String generateKey(String endpoint, {Map<String, dynamic>? query}) {
    final buffer = StringBuffer(endpoint);
    if (query != null && query.isNotEmpty) {
      final sortedKeys = query.keys.toList()..sort();
      buffer.write('?');
      for (int i = 0; i < sortedKeys.length; i++) {
        if (i > 0) buffer.write('&');
        buffer.write('${sortedKeys[i]}=${query[sortedKeys[i]]}');
      }
    }
    return buffer.toString();
  }

  /// Generate cache key with prefix
  static String generatePrefixedKey(
    String prefix,
    String endpoint, {
    Map<String, dynamic>? query,
  }) {
    return '$prefix:${generateKey(endpoint, query: query)}';
  }

  /// Start automatic cleanup of expired entries
  void _startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(_config.cleanupInterval, (_) async {
      await _cleanup();
    });
  }

  /// Clean up expired entries
  Future<void> _cleanup() async {
    if (_storage is MemoryCacheStorage) {
      // For memory storage, getting keys already cleans up expired entries
      await _storage.keys();
    }
  }

  /// Get cache statistics (if supported by storage)
  Map<String, dynamic>? getStats() {
    if (_storage is MemoryCacheStorage) {
      return (_storage).getStats();
    }
    return null;
  }

  /// Dispose resources
  void dispose() {
    _cleanupTimer?.cancel();
  }
}

/// Cache-aware HTTP client mixin
mixin CacheableMixin {
  MedusaCache? get cache;

  /// Fetch with caching support
  Future<T> fetchWithCache<T>(
    String endpoint,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? query,
    Duration? cacheTtl,
    bool useCache = true,
    String cachePrefix = 'api',
  }) async {
    final cacheKey = MedusaCache.generatePrefixedKey(
      cachePrefix,
      endpoint,
      query: query,
    );

    // Try to get from cache first
    if (useCache && cache != null) {
      final cached = await cache!.get<T>(cacheKey, fromJson);
      if (cached != null) {
        return cached;
      }
    }

    // Fetch from API (this would be implemented by the concrete class)
    final response = await fetchFromApi<Map<String, dynamic>>(
      endpoint,
      query: query,
    );
    final result = fromJson(response);

    // Cache the result
    if (useCache && cache != null) {
      await cache!.set<T>(cacheKey, result, (data) => response, ttl: cacheTtl);
    }

    return result;
  }

  /// This method should be implemented by the concrete class
  Future<T> fetchFromApi<T>(String endpoint, {Map<String, dynamic>? query});
}
