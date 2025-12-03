import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin plugin resource for managing plugins
class AdminPluginResource extends AdminResource {
  const AdminPluginResource(super.client);

  String get resourcePath => '$basePath/plugins';

  /// List plugins
  Future<PaginatedResponse<Map<String, dynamic>>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      query: query,
      headers: headers,
    );

    final plugins =
        (response['plugins'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: plugins,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve a plugin by ID
  Future<Map<String, dynamic>?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id',
      query: query,
      headers: headers,
    );

    return response['plugin'] as Map<String, dynamic>?;
  }
}
