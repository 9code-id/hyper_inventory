import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_category.freezed.dart';
part 'lesson_category.g.dart';

@unfreezed
class LessonCategory with _$LessonCategory {
  factory LessonCategory({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null)
    @JsonKey(name: 'lesson_category_name')
    String? lessonCategoryName,
    @Default(null) @JsonKey(name: 'sort_index') int? sortIndex,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _LessonCategory;

  factory LessonCategory.fromJson(Map<String, dynamic> json) =>
      _$LessonCategoryFromJson(json);
}
