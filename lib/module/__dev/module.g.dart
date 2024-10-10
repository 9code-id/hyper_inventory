// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ModuleImpl _$$ModuleImplFromJson(Map<String, dynamic> json) => _$ModuleImpl(
      name: json['name'] as String?,
      icon: json['icon'] as String?,
      tableColumnPriority: (json['tableColumnPriority'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subEditFormHiddenFields:
          (json['subEditFormHiddenFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      subEditTableHiddenFields:
          (json['subEditTableHiddenFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      subEditTableHiddenFooters:
          (json['subEditTableHiddenFooters'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      listViewHiddenFields: (json['listViewHiddenFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createFormHiddenFields: (json['createFormHiddenFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      editFormHiddenFields: (json['editFormHiddenFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createFormDisabledFields:
          (json['createFormDisabledFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      editFormDisabledFields: (json['editFormDisabledFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      subEditMode: json['subEditMode'] as bool?,
      subEditTable: json['subEditTable'] as String?,
      generatedModules: (json['generatedModules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ModuleImplToJson(_$ModuleImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'tableColumnPriority': instance.tableColumnPriority,
      'subEditFormHiddenFields': instance.subEditFormHiddenFields,
      'subEditTableHiddenFields': instance.subEditTableHiddenFields,
      'subEditTableHiddenFooters': instance.subEditTableHiddenFooters,
      'listViewHiddenFields': instance.listViewHiddenFields,
      'createFormHiddenFields': instance.createFormHiddenFields,
      'editFormHiddenFields': instance.editFormHiddenFields,
      'createFormDisabledFields': instance.createFormDisabledFields,
      'editFormDisabledFields': instance.editFormDisabledFields,
      'subEditMode': instance.subEditMode,
      'subEditTable': instance.subEditTable,
      'generatedModules': instance.generatedModules,
    };
