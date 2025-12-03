// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResponse<T>(
  data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
  count: (json['count'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': instance.data.map(toJsonT).toList(),
  'count': instance.count,
  'offset': instance.offset,
  'limit': instance.limit,
};

DeleteResponse _$DeleteResponseFromJson(Map<String, dynamic> json) =>
    DeleteResponse(
      id: json['id'] as String,
      object: json['object'] as String,
      deleted: json['deleted'] as bool,
    );

Map<String, dynamic> _$DeleteResponseToJson(DeleteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'deleted': instance.deleted,
    };

BatchResponse<T> _$BatchResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => BatchResponse<T>(
  created: (json['created'] as List<dynamic>).map(fromJsonT).toList(),
  updated: (json['updated'] as List<dynamic>).map(fromJsonT).toList(),
  deleted: (json['deleted'] as List<dynamic>)
      .map((e) => DeleteResponse.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$BatchResponseToJson<T>(
  BatchResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'created': instance.created.map(toJsonT).toList(),
  'updated': instance.updated.map(toJsonT).toList(),
  'deleted': instance.deleted,
};
