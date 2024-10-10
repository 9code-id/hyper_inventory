// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Lesson _$LessonFromJson(Map<String, dynamic> json) {
  return _Lesson.fromJson(json);
}

/// @nodoc
mixin _$Lesson {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  set imageUrl(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_category_id')
  int? get lessonCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_category_id')
  set lessonCategoryId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_name')
  String? get lessonName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_name')
  set lessonName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  set description(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_type')
  String? get lessonType => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_type')
  set lessonType(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  set url(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value) => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'lesson_category')
  LessonCategory? get lessonCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_category')
  set lessonCategory(LessonCategory? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonCopyWith<Lesson> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonCopyWith<$Res> {
  factory $LessonCopyWith(Lesson value, $Res Function(Lesson) then) =
      _$LessonCopyWithImpl<$Res, Lesson>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'lesson_category_id') int? lessonCategoryId,
      @JsonKey(name: 'lesson_name') String? lessonName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'lesson_type') String? lessonType,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'lesson_category') LessonCategory? lessonCategory,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  $LessonCategoryCopyWith<$Res>? get lessonCategory;
  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class _$LessonCopyWithImpl<$Res, $Val extends Lesson>
    implements $LessonCopyWith<$Res> {
  _$LessonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? lessonCategoryId = freezed,
    Object? lessonName = freezed,
    Object? description = freezed,
    Object? lessonType = freezed,
    Object? url = freezed,
    Object? userProfileId = freezed,
    Object? sortIndex = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lessonCategory = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonCategoryId: freezed == lessonCategoryId
          ? _value.lessonCategoryId
          : lessonCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonName: freezed == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonType: freezed == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      lessonCategory: freezed == lessonCategory
          ? _value.lessonCategory
          : lessonCategory // ignore: cast_nullable_to_non_nullable
              as LessonCategory?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LessonCategoryCopyWith<$Res>? get lessonCategory {
    if (_value.lessonCategory == null) {
      return null;
    }

    return $LessonCategoryCopyWith<$Res>(_value.lessonCategory!, (value) {
      return _then(_value.copyWith(lessonCategory: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LessonImplCopyWith<$Res> implements $LessonCopyWith<$Res> {
  factory _$$LessonImplCopyWith(
          _$LessonImpl value, $Res Function(_$LessonImpl) then) =
      __$$LessonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'lesson_category_id') int? lessonCategoryId,
      @JsonKey(name: 'lesson_name') String? lessonName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'lesson_type') String? lessonType,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'lesson_category') LessonCategory? lessonCategory,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  @override
  $LessonCategoryCopyWith<$Res>? get lessonCategory;
  @override
  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class __$$LessonImplCopyWithImpl<$Res>
    extends _$LessonCopyWithImpl<$Res, _$LessonImpl>
    implements _$$LessonImplCopyWith<$Res> {
  __$$LessonImplCopyWithImpl(
      _$LessonImpl _value, $Res Function(_$LessonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? lessonCategoryId = freezed,
    Object? lessonName = freezed,
    Object? description = freezed,
    Object? lessonType = freezed,
    Object? url = freezed,
    Object? userProfileId = freezed,
    Object? sortIndex = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? lessonCategory = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_$LessonImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonCategoryId: freezed == lessonCategoryId
          ? _value.lessonCategoryId
          : lessonCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      lessonName: freezed == lessonName
          ? _value.lessonName
          : lessonName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lessonType: freezed == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      lessonCategory: freezed == lessonCategory
          ? _value.lessonCategory
          : lessonCategory // ignore: cast_nullable_to_non_nullable
              as LessonCategory?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonImpl implements _Lesson {
  _$LessonImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'image_url') this.imageUrl = null,
      @JsonKey(name: 'lesson_category_id') this.lessonCategoryId = null,
      @JsonKey(name: 'lesson_name') this.lessonName = null,
      @JsonKey(name: 'description') this.description = null,
      @JsonKey(name: 'lesson_type') this.lessonType = null,
      @JsonKey(name: 'url') this.url = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'sort_index') this.sortIndex = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'lesson_category') this.lessonCategory = null,
      @JsonKey(name: 'user_profile') this.userProfile = null});

  factory _$LessonImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @override
  @JsonKey(name: 'lesson_category_id')
  int? lessonCategoryId;
  @override
  @JsonKey(name: 'lesson_name')
  String? lessonName;
  @override
  @JsonKey(name: 'description')
  String? description;
  @override
  @JsonKey(name: 'lesson_type')
  String? lessonType;
  @override
  @JsonKey(name: 'url')
  String? url;
  @override
  @JsonKey(name: 'user_profile_id')
  int? userProfileId;
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
  @JsonKey(name: 'lesson_category')
  LessonCategory? lessonCategory;
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? userProfile;

  @override
  String toString() {
    return 'Lesson(id: $id, imageUrl: $imageUrl, lessonCategoryId: $lessonCategoryId, lessonName: $lessonName, description: $description, lessonType: $lessonType, url: $url, userProfileId: $userProfileId, sortIndex: $sortIndex, createdAt: $createdAt, updatedAt: $updatedAt, lessonCategory: $lessonCategory, userProfile: $userProfile)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      __$$LessonImplCopyWithImpl<_$LessonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonImplToJson(
      this,
    );
  }
}

abstract class _Lesson implements Lesson {
  factory _Lesson(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'lesson_category_id') int? lessonCategoryId,
      @JsonKey(name: 'lesson_name') String? lessonName,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'lesson_type') String? lessonType,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'sort_index') int? sortIndex,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'lesson_category') LessonCategory? lessonCategory,
      @JsonKey(name: 'user_profile') UserProfile? userProfile}) = _$LessonImpl;

  factory _Lesson.fromJson(Map<String, dynamic> json) = _$LessonImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl;
  @JsonKey(name: 'image_url')
  set imageUrl(String? value);
  @override
  @JsonKey(name: 'lesson_category_id')
  int? get lessonCategoryId;
  @JsonKey(name: 'lesson_category_id')
  set lessonCategoryId(int? value);
  @override
  @JsonKey(name: 'lesson_name')
  String? get lessonName;
  @JsonKey(name: 'lesson_name')
  set lessonName(String? value);
  @override
  @JsonKey(name: 'description')
  String? get description;
  @JsonKey(name: 'description')
  set description(String? value);
  @override
  @JsonKey(name: 'lesson_type')
  String? get lessonType;
  @JsonKey(name: 'lesson_type')
  set lessonType(String? value);
  @override
  @JsonKey(name: 'url')
  String? get url;
  @JsonKey(name: 'url')
  set url(String? value);
  @override
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value);
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
  @JsonKey(name: 'lesson_category')
  LessonCategory? get lessonCategory;
  @JsonKey(name: 'lesson_category')
  set lessonCategory(LessonCategory? value);
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value);
  @override
  @JsonKey(ignore: true)
  _$$LessonImplCopyWith<_$LessonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
