import '../models/common.dart';

/// Pagination configuration
class PaginationConfig {
  /// The number of items per page (default: 20)
  final int limit;

  /// The offset for pagination (default: 0)
  final int offset;

  /// Maximum number of items to fetch across all pages (optional)
  final int? maxItems;

  /// Whether to fetch all pages automatically (default: false)
  final bool fetchAll;

  const PaginationConfig({
    this.limit = 20,
    this.offset = 0,
    this.maxItems,
    this.fetchAll = false,
  });

  /// Create a copy with updated values
  PaginationConfig copyWith({
    int? limit,
    int? offset,
    int? maxItems,
    bool? fetchAll,
  }) {
    return PaginationConfig(
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      maxItems: maxItems ?? this.maxItems,
      fetchAll: fetchAll ?? this.fetchAll,
    );
  }

  /// Convert to query parameters
  Map<String, dynamic> toQuery() {
    return {'limit': limit, 'offset': offset};
  }
}

/// Iterator for paginated responses
class PaginatedIterator<T> {
  final Future<PaginatedResponse<T>> Function(int offset, int limit) _fetcher;
  final PaginationConfig _config;

  int _currentOffset = 0;
  bool _hasMorePages = true;
  int _totalFetched = 0;

  PaginatedIterator(this._fetcher, this._config) {
    _currentOffset = _config.offset;
  }

  /// Get the next page of results
  Future<List<T>?> nextPage() async {
    if (!_hasMorePages) return null;

    // Check if we've reached the maximum items limit
    if (_config.maxItems != null && _totalFetched >= _config.maxItems!) {
      return null;
    }

    final response = await _fetcher(_currentOffset, _config.limit);
    final items = response.data;

    _totalFetched += items.length;
    _currentOffset += _config.limit;

    // Check if there are more pages
    _hasMorePages =
        items.length == _config.limit &&
        (_config.maxItems == null || _totalFetched < _config.maxItems!);

    return items;
  }

  /// Get all remaining pages as a flattened list
  Future<List<T>> getAllPages() async {
    final allItems = <T>[];

    while (_hasMorePages) {
      final items = await nextPage();
      if (items == null || items.isEmpty) break;
      allItems.addAll(items);
    }

    return allItems;
  }

  /// Get all pages as a stream
  Stream<T> asStream() async* {
    while (_hasMorePages) {
      final items = await nextPage();
      if (items == null || items.isEmpty) break;

      for (final item in items) {
        yield item;
      }
    }
  }

  /// Get pages as a stream of batches
  Stream<List<T>> asBatchStream() async* {
    while (_hasMorePages) {
      final items = await nextPage();
      if (items == null || items.isEmpty) break;
      yield items;
    }
  }
}

/// Cursor-based pagination for real-time data
class CursorPaginator<T> {
  final Future<CursorPaginatedResponse<T>> Function(String? cursor, int limit)
  _fetcher;
  final int _limit;

  String? _nextCursor;
  bool _hasMorePages = true;

  CursorPaginator(this._fetcher, {int limit = 20}) : _limit = limit;

  /// Get the next page of results
  Future<List<T>?> nextPage() async {
    if (!_hasMorePages) return null;

    final response = await _fetcher(_nextCursor, _limit);
    final items = response.data ?? [];

    _nextCursor = response.nextCursor;
    _hasMorePages = _nextCursor != null;

    return items;
  }

  /// Get all remaining pages as a flattened list
  Future<List<T>> getAllPages() async {
    final allItems = <T>[];

    while (_hasMorePages) {
      final items = await nextPage();
      if (items == null || items.isEmpty) break;
      allItems.addAll(items);
    }

    return allItems;
  }

  /// Get all pages as a stream
  Stream<T> asStream() async* {
    while (_hasMorePages) {
      final items = await nextPage();
      if (items == null || items.isEmpty) break;

      for (final item in items) {
        yield item;
      }
    }
  }

  /// Reset the paginator to start from the beginning
  void reset() {
    _nextCursor = null;
    _hasMorePages = true;
  }
}

/// Batch processor for paginated data
class BatchProcessor<T, R> {
  final PaginatedIterator<T> _iterator;
  final Future<List<R>> Function(List<T> batch) _processor;

  BatchProcessor(this._iterator, this._processor);

  /// Process all pages in batches
  Future<List<R>> processAll() async {
    final results = <R>[];

    await for (final batch in _iterator.asBatchStream()) {
      final processed = await _processor(batch);
      results.addAll(processed);
    }

    return results;
  }

  /// Process all pages as a stream
  Stream<R> processAsStream() async* {
    await for (final batch in _iterator.asBatchStream()) {
      final processed = await _processor(batch);
      for (final result in processed) {
        yield result;
      }
    }
  }
}

/// Utilities for working with paginated responses
class PaginationUtils {
  /// Calculate total pages from count and limit
  static int calculateTotalPages(int count, int limit) {
    return (count / limit).ceil();
  }

  /// Check if there are more pages available
  static bool hasMorePages(int offset, int limit, int count) {
    return offset + limit < count;
  }

  /// Get the page number from offset and limit
  static int getPageNumber(int offset, int limit) {
    return (offset / limit).floor() + 1;
  }

  /// Get offset from page number and limit
  static int getOffset(int page, int limit) {
    return (page - 1) * limit;
  }

  /// Create pagination metadata
  static PaginationMeta createMeta({
    required int offset,
    required int limit,
    required int count,
  }) {
    final totalPages = calculateTotalPages(count, limit);
    final currentPage = getPageNumber(offset, limit);
    final hasNext = hasMorePages(offset, limit, count);
    final hasPrev = offset > 0;

    return PaginationMeta(
      offset: offset,
      limit: limit,
      count: count,
      totalPages: totalPages,
      currentPage: currentPage,
      hasNext: hasNext,
      hasPrev: hasPrev,
    );
  }
}

/// Extension methods for paginated responses
extension PaginatedResponseExtensions<T> on PaginatedResponse<T> {
  /// Get pagination metadata
  PaginationMeta get meta {
    return PaginationUtils.createMeta(
      offset: offset,
      limit: limit,
      count: count,
    );
  }

  /// Check if there are more pages
  bool get hasMorePages {
    return PaginationUtils.hasMorePages(offset, limit, count);
  }

  /// Get current page number
  int get pageNumber {
    return PaginationUtils.getPageNumber(offset, limit);
  }

  /// Get total pages
  int get totalPages {
    return PaginationUtils.calculateTotalPages(count, limit);
  }
}

/// Pagination metadata
class PaginationMeta {
  final int offset;
  final int limit;
  final int count;
  final int totalPages;
  final int currentPage;
  final bool hasNext;
  final bool hasPrev;

  const PaginationMeta({
    required this.offset,
    required this.limit,
    required this.count,
    required this.totalPages,
    required this.currentPage,
    required this.hasNext,
    required this.hasPrev,
  });

  Map<String, dynamic> toJson() {
    return {
      'offset': offset,
      'limit': limit,
      'count': count,
      'total_pages': totalPages,
      'current_page': currentPage,
      'has_next': hasNext,
      'has_prev': hasPrev,
    };
  }
}

/// Cursor-based paginated response
class CursorPaginatedResponse<T> {
  final List<T>? data;
  final String? nextCursor;
  final String? prevCursor;
  final bool hasNext;
  final bool hasPrev;

  const CursorPaginatedResponse({
    this.data,
    this.nextCursor,
    this.prevCursor,
    this.hasNext = false,
    this.hasPrev = false,
  });

  factory CursorPaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return CursorPaginatedResponse<T>(
      data:
          json['data'] != null
              ? (json['data'] as List).map((item) => fromJsonT(item)).toList()
              : null,
      nextCursor: json['next_cursor'],
      prevCursor: json['prev_cursor'],
      hasNext: json['has_next'] ?? false,
      hasPrev: json['has_prev'] ?? false,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'data': data?.map(toJsonT).toList(),
      'next_cursor': nextCursor,
      'prev_cursor': prevCursor,
      'has_next': hasNext,
      'has_prev': hasPrev,
    };
  }
}
