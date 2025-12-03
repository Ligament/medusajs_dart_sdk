import 'package:json_annotation/json_annotation.dart';

part 'admin_view_configuration.g.dart';

@JsonSerializable(explicitToJson: true)
class AdminViewConfiguration {
  final String id;
  final String entity;
  final String? name;
  @JsonKey(name: 'user_id')
  final String? userId;
  @JsonKey(name: 'is_system_default')
  final bool isSystemDefault;
  final AdminViewConfigurationSettings configuration;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const AdminViewConfiguration({
    required this.id,
    required this.entity,
    this.name,
    this.userId,
    required this.isSystemDefault,
    required this.configuration,
    this.createdAt,
    this.updatedAt,
  });

  factory AdminViewConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AdminViewConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$AdminViewConfigurationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminViewConfigurationSettings {
  @JsonKey(name: 'visible_columns')
  final List<String> visibleColumns;
  @JsonKey(name: 'column_order')
  final List<String> columnOrder;
  @JsonKey(name: 'column_widths')
  final Map<String, num>? columnWidths;
  final Map<String, dynamic>? filters;
  final AdminViewConfigurationSorting? sorting;
  final String? search;

  const AdminViewConfigurationSettings({
    required this.visibleColumns,
    required this.columnOrder,
    this.columnWidths,
    this.filters,
    this.sorting,
    this.search,
  });

  factory AdminViewConfigurationSettings.fromJson(Map<String, dynamic> json) =>
      _$AdminViewConfigurationSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$AdminViewConfigurationSettingsToJson(this);
}

@JsonSerializable()
class AdminViewConfigurationSorting {
  final String id;
  final bool desc;

  const AdminViewConfigurationSorting({required this.id, required this.desc});

  factory AdminViewConfigurationSorting.fromJson(Map<String, dynamic> json) =>
      _$AdminViewConfigurationSortingFromJson(json);
  Map<String, dynamic> toJson() => _$AdminViewConfigurationSortingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminCreateViewConfiguration {
  final String? name;
  @JsonKey(name: 'is_system_default')
  final bool? isSystemDefault;
  @JsonKey(name: 'set_active')
  final bool? setActive;
  final AdminViewConfigurationSettings configuration;

  const AdminCreateViewConfiguration({
    this.name,
    this.isSystemDefault,
    this.setActive,
    required this.configuration,
  });

  factory AdminCreateViewConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AdminCreateViewConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$AdminCreateViewConfigurationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminUpdateViewConfiguration {
  final String? name;
  @JsonKey(name: 'is_system_default')
  final bool? isSystemDefault;
  @JsonKey(name: 'set_active')
  final bool? setActive;
  final AdminViewConfigurationSettings? configuration;

  const AdminUpdateViewConfiguration({
    this.name,
    this.isSystemDefault,
    this.setActive,
    this.configuration,
  });

  factory AdminUpdateViewConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AdminUpdateViewConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$AdminUpdateViewConfigurationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminViewConfigurationResponse {
  @JsonKey(name: 'view_configuration')
  final AdminViewConfiguration? viewConfiguration;

  const AdminViewConfigurationResponse({this.viewConfiguration});

  factory AdminViewConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminViewConfigurationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AdminViewConfigurationResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminViewConfigurationListResponse {
  @JsonKey(name: 'view_configurations')
  final List<AdminViewConfiguration> viewConfigurations;
  final int count;
  final int offset;
  final int limit;
  @JsonKey(name: 'estimate_count')
  final int? estimateCount;

  const AdminViewConfigurationListResponse({
    required this.viewConfigurations,
    required this.count,
    required this.offset,
    required this.limit,
    this.estimateCount,
  });

  factory AdminViewConfigurationListResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminViewConfigurationListResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdminViewConfigurationListResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminViewsEntityColumnsResponse {
  final List<AdminColumn> columns;

  const AdminViewsEntityColumnsResponse({required this.columns});

  factory AdminViewsEntityColumnsResponse.fromJson(Map<String, dynamic> json) =>
      _$AdminViewsEntityColumnsResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdminViewsEntityColumnsResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminColumn {
  final String id;
  final String name;
  final String? description;
  final String field;
  final bool sortable;
  final bool hideable;
  @JsonKey(name: 'default_visible')
  final bool defaultVisible;
  @JsonKey(name: 'data_type')
  final String dataType;
  @JsonKey(name: 'semantic_type')
  final String? semanticType;
  final String? context;
  final AdminColumnComputed? computed;
  final AdminColumnRelationship? relationship;
  @JsonKey(name: 'default_order')
  final int? defaultOrder;
  final String? category;

  const AdminColumn({
    required this.id,
    required this.name,
    this.description,
    required this.field,
    required this.sortable,
    required this.hideable,
    required this.defaultVisible,
    required this.dataType,
    this.semanticType,
    this.context,
    this.computed,
    this.relationship,
    this.defaultOrder,
    this.category,
  });

  factory AdminColumn.fromJson(Map<String, dynamic> json) =>
      _$AdminColumnFromJson(json);
  Map<String, dynamic> toJson() => _$AdminColumnToJson(this);
}

@JsonSerializable()
class AdminColumnComputed {
  final String type;
  @JsonKey(name: 'required_fields')
  final List<String> requiredFields;
  @JsonKey(name: 'optional_fields')
  final List<String> optionalFields;

  const AdminColumnComputed({
    required this.type,
    required this.requiredFields,
    required this.optionalFields,
  });

  factory AdminColumnComputed.fromJson(Map<String, dynamic> json) =>
      _$AdminColumnComputedFromJson(json);
  Map<String, dynamic> toJson() => _$AdminColumnComputedToJson(this);
}

@JsonSerializable()
class AdminColumnRelationship {
  final String entity;
  final String field;

  const AdminColumnRelationship({required this.entity, required this.field});

  factory AdminColumnRelationship.fromJson(Map<String, dynamic> json) =>
      _$AdminColumnRelationshipFromJson(json);
  Map<String, dynamic> toJson() => _$AdminColumnRelationshipToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdminActiveViewConfigurationResponse {
  @JsonKey(name: 'view_configuration')
  final AdminViewConfiguration? viewConfiguration;
  @JsonKey(name: 'active_view_configuration_id')
  final String? activeViewConfigurationId;

  const AdminActiveViewConfigurationResponse({
    this.viewConfiguration,
    this.activeViewConfigurationId,
  });

  factory AdminActiveViewConfigurationResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminActiveViewConfigurationResponseFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdminActiveViewConfigurationResponseToJson(this);
}

@JsonSerializable()
class AdminSetActiveViewConfigurationResult {
  final bool success;

  const AdminSetActiveViewConfigurationResult({required this.success});

  factory AdminSetActiveViewConfigurationResult.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminSetActiveViewConfigurationResultFromJson(json);
  Map<String, dynamic> toJson() =>
      _$AdminSetActiveViewConfigurationResultToJson(this);
}
