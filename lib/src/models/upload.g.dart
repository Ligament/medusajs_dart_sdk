// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDimensions _$FileDimensionsFromJson(Map<String, dynamic> json) =>
    FileDimensions(
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$FileDimensionsToJson(FileDimensions instance) =>
    <String, dynamic>{'width': instance.width, 'height': instance.height};

Upload _$UploadFromJson(Map<String, dynamic> json) => Upload(
  id: json['id'] as String,
  url: json['url'] as String,
  filename: json['filename'] as String,
  originalName: json['original_name'] as String?,
  mimeType: json['mime_type'] as String,
  size: (json['size'] as num).toInt(),
  type: $enumDecode(_$UploadTypeEnumMap, json['type']),
  status: $enumDecode(_$UploadStatusEnumMap, json['status']),
  dimensions: json['dimensions'] == null
      ? null
      : FileDimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
  alt: json['alt'] as String?,
  description: json['description'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$UploadToJson(Upload instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'filename': instance.filename,
  'original_name': instance.originalName,
  'mime_type': instance.mimeType,
  'size': instance.size,
  'type': _$UploadTypeEnumMap[instance.type]!,
  'status': _$UploadStatusEnumMap[instance.status]!,
  'dimensions': instance.dimensions,
  'alt': instance.alt,
  'description': instance.description,
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$UploadTypeEnumMap = {
  UploadType.image: 'image',
  UploadType.video: 'video',
  UploadType.document: 'document',
  UploadType.other: 'other',
};

const _$UploadStatusEnumMap = {
  UploadStatus.pending: 'pending',
  UploadStatus.processing: 'processing',
  UploadStatus.completed: 'completed',
  UploadStatus.failed: 'failed',
};

CreateUploadRequest _$CreateUploadRequestFromJson(Map<String, dynamic> json) =>
    CreateUploadRequest(
      filename: json['filename'] as String,
      originalName: json['original_name'] as String?,
      mimeType: json['mime_type'] as String,
      size: (json['size'] as num).toInt(),
      alt: json['alt'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateUploadRequestToJson(
  CreateUploadRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'original_name': instance.originalName,
  'mime_type': instance.mimeType,
  'size': instance.size,
  'alt': instance.alt,
  'description': instance.description,
  'metadata': instance.metadata,
};

UpdateUploadRequest _$UpdateUploadRequestFromJson(Map<String, dynamic> json) =>
    UpdateUploadRequest(
      alt: json['alt'] as String?,
      description: json['description'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateUploadRequestToJson(
  UpdateUploadRequest instance,
) => <String, dynamic>{
  'alt': instance.alt,
  'description': instance.description,
  'metadata': instance.metadata,
};

GetUploadUrlRequest _$GetUploadUrlRequestFromJson(Map<String, dynamic> json) =>
    GetUploadUrlRequest(
      filename: json['filename'] as String,
      mimeType: json['mime_type'] as String,
    );

Map<String, dynamic> _$GetUploadUrlRequestToJson(
  GetUploadUrlRequest instance,
) => <String, dynamic>{
  'filename': instance.filename,
  'mime_type': instance.mimeType,
};

UploadUrlResponse _$UploadUrlResponseFromJson(Map<String, dynamic> json) =>
    UploadUrlResponse(
      url: json['url'] as String,
      fields: json['fields'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UploadUrlResponseToJson(UploadUrlResponse instance) =>
    <String, dynamic>{'url': instance.url, 'fields': instance.fields};

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    UploadResponse(
      upload: Upload.fromJson(json['upload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) =>
    <String, dynamic>{'upload': instance.upload};

UploadsResponse _$UploadsResponseFromJson(Map<String, dynamic> json) =>
    UploadsResponse(
      uploads: (json['uploads'] as List<dynamic>)
          .map((e) => Upload.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$UploadsResponseToJson(UploadsResponse instance) =>
    <String, dynamic>{
      'uploads': instance.uploads,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
