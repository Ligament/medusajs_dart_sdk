import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin campaign management resource
class AdminCampaignResource extends AdminResource {
  const AdminCampaignResource(super.client);

  String get resourcePath => '$basePath/campaigns';

  /// List campaigns
  Future<PaginatedResponse<Campaign>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Campaign>(
      endpoint: resourcePath,
      dataKey: 'campaigns',
      fromJson: Campaign.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve a campaign by ID
  Future<Campaign?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<Campaign>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'campaign',
      fromJson: Campaign.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new campaign
  Future<Campaign?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<Campaign>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'campaign',
      fromJson: Campaign.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update a campaign
  Future<Campaign?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<Campaign>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'campaign',
      fromJson: Campaign.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete a campaign
  Future<Map<String, dynamic>> delete(
    String id, {
    ClientHeaders? headers,
  }) async {
    return await deleteGeneric(
      id: id,
      endpoint: '$resourcePath/$id',
      headers: headers,
    );
  }

  /// Launch a campaign
  Future<Campaign?> launch(String id, {ClientHeaders? headers}) async {
    return await updateGeneric<Campaign>(
      id: id,
      body: {'status': 'active'},
      endpoint: '$resourcePath/$id/launch',
      dataKey: 'campaign',
      fromJson: Campaign.fromJson,
      headers: headers,
    );
  }

  /// Pause a campaign
  Future<Campaign?> pause(String id, {ClientHeaders? headers}) async {
    return await updateGeneric<Campaign>(
      id: id,
      body: {'status': 'paused'},
      endpoint: '$resourcePath/$id/pause',
      dataKey: 'campaign',
      fromJson: Campaign.fromJson,
      headers: headers,
    );
  }

  /// List campaigns by status
  Future<PaginatedResponse<Campaign>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// Get campaign analytics
  Future<Map<String, dynamic>> getAnalytics(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/analytics',
      query: query,
      headers: headers,
    );
  }
}
