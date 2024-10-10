import 'package:freezed_annotation/freezed_annotation.dart';
import './../lesson_category/lesson_category.dart';
import './../user_profile/user_profile.dart';

part 'lesson.freezed.dart';
part 'lesson.g.dart';

@unfreezed
class Lesson with _$Lesson {
  factory Lesson({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'image_url') String? imageUrl,
    @Default(null) @JsonKey(name: 'lesson_category_id') int? lessonCategoryId,
    @Default(null) @JsonKey(name: 'lesson_name') String? lessonName,
    @Default(null) @JsonKey(name: 'description') String? description,
    @Default(null) @JsonKey(name: 'lesson_type') String? lessonType,
    @Default(null) @JsonKey(name: 'url') String? url,
    @Default(null) @JsonKey(name: 'user_profile_id') int? userProfileId,
    @Default(null) @JsonKey(name: 'sort_index') int? sortIndex,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'lesson_category')
    LessonCategory? lessonCategory,
    @Default(null) @JsonKey(name: 'user_profile') UserProfile? userProfile,
  }) = _Lesson;

  factory Lesson.fromJson(Map<String, dynamic> json) => _$LessonFromJson(json);
}
