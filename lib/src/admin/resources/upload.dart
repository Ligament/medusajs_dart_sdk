import '../../resources/base_resource.dart';
import '../../models/models.dart';
import '../../types/types.dart';

/// Admin upload management resource
class AdminUploadResource extends AdminResource {
  const AdminUploadResource(super.client);

  String get resourcePath => '$basePath/uploads';

  /// List uploads
  Future<PaginatedResponse<Upload>> list({
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await listGeneric<Upload>(
      endpoint: resourcePath,
      dataKey: 'uploads',
      fromJson: Upload.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Retrieve an upload by ID
  Future<Upload?> retrieve(
    String id, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await retrieveGeneric<Upload>(
      id: id,
      endpoint: '$resourcePath/$id',
      dataKey: 'upload',
      fromJson: Upload.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Create a new upload
  Future<Upload?> create(
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await createGeneric<Upload>(
      body: body,
      endpoint: resourcePath,
      dataKey: 'upload',
      fromJson: Upload.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Update an upload
  Future<Upload?> update(
    String id,
    Map<String, dynamic> body, {
    Map<String, dynamic>? query,
    ClientHeaders? headers,
  }) async {
    return await updateGeneric<Upload>(
      id: id,
      body: body,
      endpoint: '$resourcePath/$id',
      dataKey: 'upload',
      fromJson: Upload.fromJson,
      query: query,
      headers: headers,
    );
  }

  /// Delete an upload
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

  /// Upload file from multipart form data
  Future<Upload?> uploadFile(
    List<int> fileData,
    String fileName, {
    String? mimeType,
    Map<String, String>? additionalFields,
    ClientHeaders? headers,
  }) async {
    // This would typically use multipart/form-data
    // For now, we'll use a simple implementation
    final body = {
      'file_data': fileData,
      'file_name': fileName,
      if (mimeType != null) 'mime_type': mimeType,
      if (additionalFields != null) ...additionalFields,
    };

    return await createGeneric<Upload>(
      body: body,
      endpoint: '$resourcePath/file',
      dataKey: 'upload',
      fromJson: Upload.fromJson,
      headers: headers,
    );
  }

  /// Upload multiple files
  Future<List<Upload>> uploadFiles(
    List<Map<String, dynamic>> files, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/files',
      method: 'POST',
      body: {'files': files},
      headers: headers,
    );

    final uploads =
        (response['uploads'] as List? ?? [])
            .map((json) => Upload.fromJson(json as Map<String, dynamic>))
            .toList();

    return uploads;
  }

  /// Get upload by URL
  Future<Upload?> getByUrl(String url, {ClientHeaders? headers}) async {
    final query = {'url': url};
    final uploads = await list(query: query, headers: headers);
    return uploads.data.isNotEmpty ? uploads.data.first : null;
  }

  /// Get uploads by type
  Future<PaginatedResponse<Upload>> byType(
    String type, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['type'] = type;

    return list(query: query, headers: headers);
  }

  /// Get uploads by entity
  Future<PaginatedResponse<Upload>> byEntity(
    String entityType,
    String entityId, {
    Map<String, dynamic>? additionalFilters,
    ClientHeaders? headers,
  }) async {
    final query = Map<String, dynamic>.from(additionalFilters ?? {});
    query['entity_type'] = entityType;
    query['entity_id'] = entityId;

    return list(query: query, headers: headers);
  }

  /// Generate presigned URL for upload
  Future<Map<String, dynamic>> getPresignedUrl(
    String fileName, {
    String? mimeType,
    Map<String, dynamic>? metadata,
    ClientHeaders? headers,
  }) async {
    final body = {
      'file_name': fileName,
      if (mimeType != null) 'mime_type': mimeType,
      if (metadata != null) 'metadata': metadata,
    };

    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/presigned-url',
      method: 'POST',
      body: body,
      headers: headers,
    );
  }

  /// Complete multipart upload
  Future<Upload?> completeMultipartUpload(
    String uploadId,
    List<Map<String, dynamic>> parts, {
    ClientHeaders? headers,
  }) async {
    final response = await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$uploadId/complete',
      method: 'POST',
      body: {'parts': parts},
      headers: headers,
    );

    final data = response['upload'];
    return data != null ? Upload.fromJson(data as Map<String, dynamic>) : null;
  }

  /// Abort multipart upload
  Future<Map<String, dynamic>> abortMultipartUpload(
    String uploadId, {
    ClientHeaders? headers,
  }) async {
    return await client.fetch<Map<String, dynamic>>(
      '$resourcePath/$uploadId/abort',
      method: 'POST',
      headers: headers,
    );
  }
}
