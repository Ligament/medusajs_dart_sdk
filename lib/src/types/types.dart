import 'dart:async';

export '../query/query_builder.dart';

/// Configuration for the Medusa SDK
class MedusaConfig {
  final String baseUrl;
  final Map<String, dynamic>? globalHeaders;
  final String? publishableKey;
  final String? apiKey;
  final AuthConfig? auth;
  final Logger? logger;
  final Duration? timeout;
  final int maxRetries;
  final Duration retryDelay;
  final bool debug;

  const MedusaConfig({
    required this.baseUrl,
    this.globalHeaders,
    this.publishableKey,
    this.apiKey,
    this.auth,
    this.logger,
    this.timeout,
    this.maxRetries = 3,
    this.retryDelay = const Duration(milliseconds: 1000),
    this.debug = false,
  });

  /// Create a copy of the config with updated values
  MedusaConfig copyWith({
    String? baseUrl,
    Map<String, dynamic>? globalHeaders,
    String? publishableKey,
    String? apiKey,
    AuthConfig? auth,
    Logger? logger,
    Duration? timeout,
    int? maxRetries,
    Duration? retryDelay,
    bool? debug,
  }) {
    return MedusaConfig(
      baseUrl: baseUrl ?? this.baseUrl,
      globalHeaders: globalHeaders ?? this.globalHeaders,
      publishableKey: publishableKey ?? this.publishableKey,
      apiKey: apiKey ?? this.apiKey,
      auth: auth ?? this.auth,
      logger: logger ?? this.logger,
      timeout: timeout ?? this.timeout,
      maxRetries: maxRetries ?? this.maxRetries,
      retryDelay: retryDelay ?? this.retryDelay,
      debug: debug ?? this.debug,
    );
  }
}

/// Authentication configuration
class AuthConfig {
  final AuthType type;
  final String jwtTokenStorageKey;
  final StorageMethod jwtTokenStorageMethod;
  final String fetchCredentials;
  final CustomStorage? storage;

  const AuthConfig({
    this.type = AuthType.jwt,
    this.jwtTokenStorageKey = 'medusa_auth_token',
    this.jwtTokenStorageMethod = StorageMethod.local,
    this.fetchCredentials = 'include',
    this.storage,
  });
}

/// Authentication types
enum AuthType { jwt, session }

/// Storage methods for tokens
enum StorageMethod { local, session, memory, custom, nostore }

/// Logger interface
abstract class Logger {
  void error(String message);
  void warn(String message);
  void info(String message);
  void debug(String message);
}

/// Default console logger implementation
class ConsoleLogger implements Logger {
  @override
  void error(String message) => print('ERROR: $message');

  @override
  void warn(String message) => print('WARN: $message');

  @override
  void info(String message) => print('INFO: $message');

  @override
  void debug(String message) => print('DEBUG: $message');
}

/// Custom storage interface
abstract class CustomStorage {
  Future<String?> getItem(String key);
  Future<void> setItem(String key, String value);
  Future<void> removeItem(String key);
}

/// HTTP headers type
typedef ClientHeaders = Map<String, dynamic>;

/// Query parameters type
typedef QueryParams = Map<String, dynamic>;

/// Pagination parameters
class FindParams {
  final int? limit;
  final int? offset;
  final String? fields;
  final Map<String, dynamic>? order;

  const FindParams({this.limit, this.offset, this.fields, this.order});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (limit != null) map['limit'] = limit;
    if (offset != null) map['offset'] = offset;
    if (fields != null) map['fields'] = fields;
    if (order != null) map.addAll(order!);
    return map;
  }
}

/// Select parameters for specific field selection
class SelectParams {
  final String? fields;

  const SelectParams({this.fields});

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if (fields != null) map['fields'] = fields;
    return map;
  }
}

/// Base response structure
class BaseResponse<T> {
  final T data;
  final Map<String, dynamic>? metadata;

  const BaseResponse({required this.data, this.metadata});
}

/// Server-sent event message
class ServerSentEventMessage {
  final String? comment;
  final String? event;
  final String? data;
  final String? id;
  final int? retry;

  const ServerSentEventMessage({
    this.comment,
    this.event,
    this.data,
    this.id,
    this.retry,
  });
}

/// Stream response with abort capability
class StreamResponse {
  final Stream<ServerSentEventMessage>? stream;
  final void Function() abort;

  const StreamResponse({required this.stream, required this.abort});
}
