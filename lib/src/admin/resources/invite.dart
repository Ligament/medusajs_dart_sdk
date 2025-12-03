import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin invite resource for managing user invitations
class AdminInviteResource extends AdminResource {
  const AdminInviteResource(super.client);

  String get resourcePath => '$basePath/invites';

  /// List invites
  Future<PaginatedResponse<Map<String, dynamic>>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      query: query,
      headers: headers,
    );

    final invites =
        (response['invites'] as List? ?? [])
            .map((json) => json as Map<String, dynamic>)
            .toList();

    return PaginatedResponse(
      data: invites,
      count: response['count'] ?? 0,
      offset: response['offset'] ?? 0,
      limit: response['limit'] ?? 20,
    );
  }

  /// Retrieve an invite by ID
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

    return response['invite'] as Map<String, dynamic>?;
  }

  /// Create an invite
  Future<Map<String, dynamic>?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      resourcePath,
      method: 'POST',
      body: body,
      query: query,
      headers: headers,
    );

    return response['invite'] as Map<String, dynamic>?;
  }

  /// Delete an invite
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

  /// Accept an invite
  Future<User?> accept(
    String token,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/accept',
      method: 'POST',
      body: {'token': token, ...body},
      query: query,
      headers: headers,
    );

    final userData = response['user'] as Map<String, dynamic>?;
    return userData != null ? User.fromJson(userData) : null;
  }

  /// Resend an invite
  Future<Map<String, dynamic>?> resend(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$id/resend',
      method: 'POST',
      query: query,
      headers: headers,
    );

    return response['invite'] as Map<String, dynamic>?;
  }

  /// Get invites by email
  Future<PaginatedResponse<Map<String, dynamic>>> byEmail(
    String email, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['email'] = email;

    return list(query: query, headers: headers);
  }

  /// Get invites by status
  Future<PaginatedResponse<Map<String, dynamic>>> byStatus(
    String status, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['status'] = status;

    return list(query: query, headers: headers);
  }

  /// Get pending invites
  Future<PaginatedResponse<Map<String, dynamic>>> getPending({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    return byStatus(
      'pending',
      additionalFilters: additionalFilters,
      headers: headers,
    );
  }

  /// Get accepted invites
  Future<PaginatedResponse<Map<String, dynamic>>> getAccepted({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    return byStatus(
      'accepted',
      additionalFilters: additionalFilters,
      headers: headers,
    );
  }

  /// Get expired invites
  Future<PaginatedResponse<Map<String, dynamic>>> getExpired({
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    return byStatus(
      'expired',
      additionalFilters: additionalFilters,
      headers: headers,
    );
  }
}
