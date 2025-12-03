import '../../models/models.dart';
import '../../resources/base_resource.dart';
import '../../types/types.dart';

/// Admin resource for managing view configurations (feature-flagged)
class AdminViewsResource extends AdminResource {
  const AdminViewsResource(super.client);

  String get _resourcePath => '$basePath/views';

  Future<AdminViewsEntityColumnsResponse> columns(
    String entity, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/columns',
      query: query,
      headers: headers,
    );

    return AdminViewsEntityColumnsResponse.fromJson(response);
  }

  Future<AdminViewConfigurationListResponse> listConfigurations(
    String entity, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations',
      query: query,
      headers: headers,
    );

    return AdminViewConfigurationListResponse.fromJson(response);
  }

  Future<AdminViewConfigurationResponse> createConfiguration(
    String entity,
    AdminCreateViewConfiguration request, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations',
      method: 'POST',
      body: request.toJson(),
      headers: headers,
    );

    return AdminViewConfigurationResponse.fromJson(response);
  }

  Future<AdminViewConfigurationResponse> retrieveConfiguration(
    String entity,
    String configurationId, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations/$configurationId',
      query: query,
      headers: headers,
    );

    return AdminViewConfigurationResponse.fromJson(response);
  }

  Future<AdminViewConfigurationResponse> updateConfiguration(
    String entity,
    String configurationId,
    AdminUpdateViewConfiguration request, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations/$configurationId',
      method: 'POST',
      body: request.toJson(),
      headers: headers,
    );

    return AdminViewConfigurationResponse.fromJson(response);
  }

  Future<DeleteResponse> deleteConfiguration(
    String entity,
    String configurationId, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations/$configurationId',
      method: 'DELETE',
      headers: headers,
    );

    return DeleteResponse.fromJson(response);
  }

  Future<AdminActiveViewConfigurationResponse> retrieveActiveConfiguration(
    String entity, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations/active',
      headers: headers,
    );

    return AdminActiveViewConfigurationResponse.fromJson(response);
  }

  Future<AdminSetActiveViewConfigurationResult> setActiveConfiguration(
    String entity, {
    String? viewConfigurationId,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$_resourcePath/$entity/configurations/active',
      method: 'POST',
      body: {'view_configuration_id': viewConfigurationId},
      headers: headers,
    );

    return AdminSetActiveViewConfigurationResult.fromJson(response);
  }
}
