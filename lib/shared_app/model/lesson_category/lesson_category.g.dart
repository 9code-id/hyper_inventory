// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonCategoryImpl _$$LessonCategoryImplFromJson(Map<String, dynamic> json) =>
    _$LessonCategoryImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      lessonCategoryName: json['lesson_category_name'] as String? ?? null,
      sortIndex: (json['sort_index'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LessonCategoryImplToJson(
        _$LessonCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lesson_category_name': instance.lessonCategoryName,
      'sort_index': instance.sortIndex,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
