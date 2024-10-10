// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonCategory _$LessonCategoryFromJson(Map<String, dynamic> json) {
  return _LessonCategory.fromJson(json);
}

/// @nodoc
mixin _$LessonCategory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_category_name')
  String? get lessonCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_category_name')
  set lessonCategoryName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_index')
  int? get sortIndex => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_index')
  set sortIndex(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCategoryCopyWith<LessonCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCategoryCopyWith<$Res> {
  factory $LessonCategoryCopyWith(
          LessonCategory value, $Res Function(LessonCategory) then) =
      _$LessonCategoryCopyWithImpl<$Res, LessonCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'lesson_category_name') String? lessonCategoryName,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$LessonCategoryCopyWithImpl<$Res, $Val extends LessonCategory>
    implements $LessonCategoryCopyWith<$Res> {
  _$LessonCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lessonCategoryName = freezed,
    Object? sortIndex = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonCategoryName: freezed == lessonCategoryName
          ? _value.lessonCategoryName
          : lessonCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonCategoryImplCopyWith<$Res>
    implements $LessonCategoryCopyWith<$Res> {
  factory _$$LessonCategoryImplCopyWith(_$LessonCategoryImpl value,
          $Res Function(_$LessonCategoryImpl) then) =
      __$$LessonCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'lesson_category_name') String? lessonCategoryName,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$LessonCategoryImplCopyWithImpl<$Res>
    extends _$LessonCategoryCopyWithImpl<$Res, _$LessonCategoryImpl>
    implements _$$LessonCategoryImplCopyWith<$Res> {
  __$$LessonCategoryImplCopyWithImpl(
      _$LessonCategoryImpl _value, $Res Function(_$LessonCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? lessonCategoryName = freezed,
    Object? sortIndex = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$LessonCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonCategoryName: freezed == lessonCategoryName
          ? _value.lessonCategoryName
          : lessonCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      sortIndex: freezed == sortIndex
          ? _value.sortIndex
          : sortIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonCategoryImpl implements _LessonCategory {
  _$LessonCategoryImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'lesson_category_name') this.lessonCategoryName = null,
      @JsonKey(name: 'sort_index') this.sortIndex = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null});

  factory _$LessonCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'lesson_category_name')
  String? lessonCategoryName;
  @override
  @JsonKey(name: 'sort_index')
  int? sortIndex;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @override
  String toString() {
    return 'LessonCategory(id: $id, lessonCategoryName: $lessonCategoryName, sortIndex: $sortIndex, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonCategoryImplCopyWith<_$LessonCategoryImpl> get copyWith =>
      __$$LessonCategoryImplCopyWithImpl<_$LessonCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonCategoryImplToJson(
      this,
    );
  }
}

abstract class _LessonCategory implements LessonCategory {
  factory _LessonCategory(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'lesson_category_name') String? lessonCategoryName,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt}) = _$LessonCategoryImpl;

  factory _LessonCategory.fromJson(Map<String, dynamic> json) =
      _$LessonCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'lesson_category_name')
  String? get lessonCategoryName;
  @JsonKey(name: 'lesson_category_name')
  set lessonCategoryName(String? value);
  @override
  @JsonKey(name: 'sort_index')
  int? get sortIndex;
  @JsonKey(name: 'sort_index')
  set sortIndex(int? value);
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value);
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$LessonCategoryImplCopyWith<_$LessonCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
