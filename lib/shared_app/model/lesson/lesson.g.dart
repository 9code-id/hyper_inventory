// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonImpl _$$LessonImplFromJson(Map<String, dynamic> json) => _$LessonImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      imageUrl: json['image_url'] as String? ?? null,
      lessonCategoryId: (json['lesson_category_id'] as num?)?.toInt() ?? null,
      lessonName: json['lesson_name'] as String? ?? null,
      description: json['description'] as String? ?? null,
      lessonType: json['lesson_type'] as String? ?? null,
      url: json['url'] as String? ?? null,
      userProfileId: (json['user_profile_id'] as num?)?.toInt() ?? null,
      sortIndex: (json['sort_index'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      lessonCategory: json['lesson_category'] == null
          ? null
          : LessonCategory.fromJson(
              json['lesson_category'] as Map<String, dynamic>),
      userProfile: json['user_profile'] == null
          ? null
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LessonImplToJson(_$LessonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'lesson_category_id': instance.lessonCategoryId,
      'lesson_name': instance.lessonName,
      'description': instance.description,
      'lesson_type': instance.lessonType,
      'url': instance.url,
      'user_profile_id': instance.userProfileId,
      'sort_index': instance.sortIndex,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'lesson_category': instance.lessonCategory,
      'user_profile': instance.userProfile,
    };
