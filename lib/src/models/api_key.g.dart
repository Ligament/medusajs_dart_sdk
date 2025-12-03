// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) => ApiKey(
  id: json['id'] as String,
  token: json['token'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$ApiKeyTypeEnumMap, json['type']),
  lastUsedAt: json['last_used_at'] == null
      ? null
      : DateTime.parse(json['last_used_at'] as String),
  revoked: json['revoked'] as bool? ?? false,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  revokedAt: json['revoked_at'] == null
      ? null
      : DateTime.parse(json['revoked_at'] as String),
  createdBy: json['created_by'] as String?,
  revokedBy: json['revoked_by'] as String?,
);

Map<String, dynamic> _$ApiKeyToJson(ApiKey instance) => <String, dynamic>{
  'id': instance.id,
  'token': instance.token,
  'title': instance.title,
  'type': _$ApiKeyTypeEnumMap[instance.type]!,
  'last_used_at': instance.lastUsedAt?.toIso8601String(),
  'revoked': instance.revoked,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'revoked_at': instance.revokedAt?.toIso8601String(),
  'created_by': instance.createdBy,
  'revoked_by': instance.revokedBy,
};

const _$ApiKeyTypeEnumMap = {
  ApiKeyType.publishable: 'publishable',
  ApiKeyType.secret: 'secret',
};

CreateApiKeyRequest _$CreateApiKeyRequestFromJson(Map<String, dynamic> json) =>
    CreateApiKeyRequest(
      title: json['title'] as String,
      type: $enumDecode(_$ApiKeyTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$CreateApiKeyRequestToJson(
  CreateApiKeyRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'type': _$ApiKeyTypeEnumMap[instance.type]!,
};

UpdateApiKeyRequest _$UpdateApiKeyRequestFromJson(Map<String, dynamic> json) =>
    UpdateApiKeyRequest(title: json['title'] as String?);

Map<String, dynamic> _$UpdateApiKeyRequestToJson(
  UpdateApiKeyRequest instance,
) => <String, dynamic>{'title': instance.title};
