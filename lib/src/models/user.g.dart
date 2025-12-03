// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String,
  email: json['email'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'avatar_url': instance.avatarUrl,
  'role': _$UserRoleEnumMap[instance.role],
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.member: 'member',
  UserRole.developer: 'developer',
};

Invite _$InviteFromJson(Map<String, dynamic> json) => Invite(
  id: json['id'] as String,
  email: json['email'] as String,
  status: $enumDecode(_$InviteStatusEnumMap, json['status']),
  token: json['token'] as String,
  userId: json['user_id'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  expiresAt: DateTime.parse(json['expires_at'] as String),
  acceptedAt: json['accepted_at'] == null
      ? null
      : DateTime.parse(json['accepted_at'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'] == null
      ? null
      : DateTime.parse(json['deleted_at'] as String),
);

Map<String, dynamic> _$InviteToJson(Invite instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'status': _$InviteStatusEnumMap[instance.status]!,
  'token': instance.token,
  'user_id': instance.userId,
  'user': instance.user,
  'expires_at': instance.expiresAt.toIso8601String(),
  'accepted_at': instance.acceptedAt?.toIso8601String(),
  'metadata': instance.metadata,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt?.toIso8601String(),
};

const _$InviteStatusEnumMap = {
  InviteStatus.pending: 'pending',
  InviteStatus.accepted: 'accepted',
  InviteStatus.expired: 'expired',
  InviteStatus.canceled: 'canceled',
};

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) =>
    CreateUserRequest(
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'role': _$UserRoleEnumMap[instance.role],
      'metadata': instance.metadata,
    };

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar_url': instance.avatarUrl,
      'role': _$UserRoleEnumMap[instance.role],
      'metadata': instance.metadata,
    };

CreateInviteRequest _$CreateInviteRequestFromJson(Map<String, dynamic> json) =>
    CreateInviteRequest(
      email: json['email'] as String,
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CreateInviteRequestToJson(
  CreateInviteRequest instance,
) => <String, dynamic>{
  'email': instance.email,
  'role': _$UserRoleEnumMap[instance.role],
  'metadata': instance.metadata,
};

AcceptInviteRequest _$AcceptInviteRequestFromJson(Map<String, dynamic> json) =>
    AcceptInviteRequest(
      token: json['token'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AcceptInviteRequestToJson(
  AcceptInviteRequest instance,
) => <String, dynamic>{
  'token': instance.token,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'password': instance.password,
};

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) =>
    UserResponse(user: User.fromJson(json['user'] as Map<String, dynamic>));

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{'user': instance.user};

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };

InviteResponse _$InviteResponseFromJson(Map<String, dynamic> json) =>
    InviteResponse(
      invite: Invite.fromJson(json['invite'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InviteResponseToJson(InviteResponse instance) =>
    <String, dynamic>{'invite': instance.invite};

InvitesResponse _$InvitesResponseFromJson(Map<String, dynamic> json) =>
    InvitesResponse(
      invites: (json['invites'] as List<dynamic>)
          .map((e) => Invite.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$InvitesResponseToJson(InvitesResponse instance) =>
    <String, dynamic>{
      'invites': instance.invites,
      'count': instance.count,
      'offset': instance.offset,
      'limit': instance.limit,
    };
