// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_leaderboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonLeaderboard _$LessonLeaderboardFromJson(Map<String, dynamic> json) {
  return _LessonLeaderboard.fromJson(json);
}

/// @nodoc
mixin _$LessonLeaderboard {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_streak')
  int? get currentStreak => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_streak')
  set currentStreak(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'longest_streak')
  int? get longestStreak => throw _privateConstructorUsedError;
  @JsonKey(name: 'longest_streak')
  set longestStreak(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_minutes')
  int? get totalMinutes => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_minutes')
  set totalMinutes(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonLeaderboardCopyWith<LessonLeaderboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonLeaderboardCopyWith<$Res> {
  factory $LessonLeaderboardCopyWith(
          LessonLeaderboard value, $Res Function(LessonLeaderboard) then) =
      _$LessonLeaderboardCopyWithImpl<$Res, LessonLeaderboard>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'current_streak') int? currentStreak,
      @JsonKey(name: 'longest_streak') int? longestStreak,
      @JsonKey(name: 'total_minutes') int? totalMinutes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class _$LessonLeaderboardCopyWithImpl<$Res, $Val extends LessonLeaderboard>
    implements $LessonLeaderboardCopyWith<$Res> {
  _$LessonLeaderboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? currentStreak = freezed,
    Object? longestStreak = freezed,
    Object? totalMinutes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStreak: freezed == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      longestStreak: freezed == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMinutes: freezed == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
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
abstract class _$$LessonLeaderboardImplCopyWith<$Res>
    implements $LessonLeaderboardCopyWith<$Res> {
  factory _$$LessonLeaderboardImplCopyWith(_$LessonLeaderboardImpl value,
          $Res Function(_$LessonLeaderboardImpl) then) =
      __$$LessonLeaderboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'current_streak') int? currentStreak,
      @JsonKey(name: 'longest_streak') int? longestStreak,
      @JsonKey(name: 'total_minutes') int? totalMinutes,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class __$$LessonLeaderboardImplCopyWithImpl<$Res>
    extends _$LessonLeaderboardCopyWithImpl<$Res, _$LessonLeaderboardImpl>
    implements _$$LessonLeaderboardImplCopyWith<$Res> {
  __$$LessonLeaderboardImplCopyWithImpl(_$LessonLeaderboardImpl _value,
      $Res Function(_$LessonLeaderboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? currentStreak = freezed,
    Object? longestStreak = freezed,
    Object? totalMinutes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_$LessonLeaderboardImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      currentStreak: freezed == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      longestStreak: freezed == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int?,
      totalMinutes: freezed == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonLeaderboardImpl implements _LessonLeaderboard {
  _$LessonLeaderboardImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'current_streak') this.currentStreak = null,
      @JsonKey(name: 'longest_streak') this.longestStreak = null,
      @JsonKey(name: 'total_minutes') this.totalMinutes = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_profile') this.userProfile = null});

  factory _$LessonLeaderboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonLeaderboardImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'user_profile_id')
  int? userProfileId;
  @override
  @JsonKey(name: 'current_streak')
  int? currentStreak;
  @override
  @JsonKey(name: 'longest_streak')
  int? longestStreak;
  @override
  @JsonKey(name: 'total_minutes')
  int? totalMinutes;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? userProfile;

  @override
  String toString() {
    return 'LessonLeaderboard(id: $id, userProfileId: $userProfileId, currentStreak: $currentStreak, longestStreak: $longestStreak, totalMinutes: $totalMinutes, createdAt: $createdAt, updatedAt: $updatedAt, userProfile: $userProfile)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonLeaderboardImplCopyWith<_$LessonLeaderboardImpl> get copyWith =>
      __$$LessonLeaderboardImplCopyWithImpl<_$LessonLeaderboardImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonLeaderboardImplToJson(
      this,
    );
  }
}

abstract class _LessonLeaderboard implements LessonLeaderboard {
  factory _LessonLeaderboard(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'user_profile_id') int? userProfileId,
          @JsonKey(name: 'current_streak') int? currentStreak,
          @JsonKey(name: 'longest_streak') int? longestStreak,
          @JsonKey(name: 'total_minutes') int? totalMinutes,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'user_profile') UserProfile? userProfile}) =
      _$LessonLeaderboardImpl;

  factory _LessonLeaderboard.fromJson(Map<String, dynamic> json) =
      _$LessonLeaderboardImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value);
  @override
  @JsonKey(name: 'current_streak')
  int? get currentStreak;
  @JsonKey(name: 'current_streak')
  set currentStreak(int? value);
  @override
  @JsonKey(name: 'longest_streak')
  int? get longestStreak;
  @JsonKey(name: 'longest_streak')
  set longestStreak(int? value);
  @override
  @JsonKey(name: 'total_minutes')
  int? get totalMinutes;
  @JsonKey(name: 'total_minutes')
  set totalMinutes(int? value);
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
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value);
  @override
  @JsonKey(ignore: true)
  _$$LessonLeaderboardImplCopyWith<_$LessonLeaderboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
