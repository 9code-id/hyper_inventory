// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_journal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountJournal _$AccountJournalFromJson(Map<String, dynamic> json) {
  return _AccountJournal.fromJson(json);
}

/// @nodoc
mixin _$AccountJournal {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category_id')
  int? get accountCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category_id')
  set accountCategoryId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  set amount(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  set description(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category')
  AccountCategory? get accountCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category')
  set accountCategory(AccountCategory? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountJournalCopyWith<AccountJournal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountJournalCopyWith<$Res> {
  factory $AccountJournalCopyWith(
          AccountJournal value, $Res Function(AccountJournal) then) =
      _$AccountJournalCopyWithImpl<$Res, AccountJournal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'account_category_id') int? accountCategoryId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'account_category') AccountCategory? accountCategory,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  $AccountCategoryCopyWith<$Res>? get accountCategory;
  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class _$AccountJournalCopyWithImpl<$Res, $Val extends AccountJournal>
    implements $AccountJournalCopyWith<$Res> {
  _$AccountJournalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountCategoryId = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? userProfileId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? accountCategory = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCategoryId: freezed == accountCategoryId
          ? _value.accountCategoryId
          : accountCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accountCategory: freezed == accountCategory
          ? _value.accountCategory
          : accountCategory // ignore: cast_nullable_to_non_nullable
              as AccountCategory?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCategoryCopyWith<$Res>? get accountCategory {
    if (_value.accountCategory == null) {
      return null;
    }

    return $AccountCategoryCopyWith<$Res>(_value.accountCategory!, (value) {
      return _then(_value.copyWith(accountCategory: value) as $Val);
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
abstract class _$$AccountJournalImplCopyWith<$Res>
    implements $AccountJournalCopyWith<$Res> {
  factory _$$AccountJournalImplCopyWith(_$AccountJournalImpl value,
          $Res Function(_$AccountJournalImpl) then) =
      __$$AccountJournalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'account_category_id') int? accountCategoryId,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'account_category') AccountCategory? accountCategory,
      @JsonKey(name: 'user_profile') UserProfile? userProfile});

  @override
  $AccountCategoryCopyWith<$Res>? get accountCategory;
  @override
  $UserProfileCopyWith<$Res>? get userProfile;
}

/// @nodoc
class __$$AccountJournalImplCopyWithImpl<$Res>
    extends _$AccountJournalCopyWithImpl<$Res, _$AccountJournalImpl>
    implements _$$AccountJournalImplCopyWith<$Res> {
  __$$AccountJournalImplCopyWithImpl(
      _$AccountJournalImpl _value, $Res Function(_$AccountJournalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountCategoryId = freezed,
    Object? amount = freezed,
    Object? description = freezed,
    Object? userProfileId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? accountCategory = freezed,
    Object? userProfile = freezed,
  }) {
    return _then(_$AccountJournalImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCategoryId: freezed == accountCategoryId
          ? _value.accountCategoryId
          : accountCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      accountCategory: freezed == accountCategory
          ? _value.accountCategory
          : accountCategory // ignore: cast_nullable_to_non_nullable
              as AccountCategory?,
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountJournalImpl implements _AccountJournal {
  _$AccountJournalImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'account_category_id') this.accountCategoryId = null,
      @JsonKey(name: 'amount') this.amount = null,
      @JsonKey(name: 'description') this.description = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'account_category') this.accountCategory = null,
      @JsonKey(name: 'user_profile') this.userProfile = null});

  factory _$AccountJournalImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountJournalImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'account_category_id')
  int? accountCategoryId;
  @override
  @JsonKey(name: 'amount')
  double? amount;
  @override
  @JsonKey(name: 'description')
  String? description;
  @override
  @JsonKey(name: 'user_profile_id')
  int? userProfileId;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @override
  @JsonKey(name: 'account_category')
  AccountCategory? accountCategory;
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? userProfile;

  @override
  String toString() {
    return 'AccountJournal(id: $id, accountCategoryId: $accountCategoryId, amount: $amount, description: $description, userProfileId: $userProfileId, createdAt: $createdAt, updatedAt: $updatedAt, accountCategory: $accountCategory, userProfile: $userProfile)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountJournalImplCopyWith<_$AccountJournalImpl> get copyWith =>
      __$$AccountJournalImplCopyWithImpl<_$AccountJournalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountJournalImplToJson(
      this,
    );
  }
}

abstract class _AccountJournal implements AccountJournal {
  factory _AccountJournal(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'account_category_id') int? accountCategoryId,
          @JsonKey(name: 'amount') double? amount,
          @JsonKey(name: 'description') String? description,
          @JsonKey(name: 'user_profile_id') int? userProfileId,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'account_category') AccountCategory? accountCategory,
          @JsonKey(name: 'user_profile') UserProfile? userProfile}) =
      _$AccountJournalImpl;

  factory _AccountJournal.fromJson(Map<String, dynamic> json) =
      _$AccountJournalImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'account_category_id')
  int? get accountCategoryId;
  @JsonKey(name: 'account_category_id')
  set accountCategoryId(int? value);
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @JsonKey(name: 'amount')
  set amount(double? value);
  @override
  @JsonKey(name: 'description')
  String? get description;
  @JsonKey(name: 'description')
  set description(String? value);
  @override
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value);
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
  @JsonKey(name: 'account_category')
  AccountCategory? get accountCategory;
  @JsonKey(name: 'account_category')
  set accountCategory(AccountCategory? value);
  @override
  @JsonKey(name: 'user_profile')
  UserProfile? get userProfile;
  @JsonKey(name: 'user_profile')
  set userProfile(UserProfile? value);
  @override
  @JsonKey(ignore: true)
  _$$AccountJournalImplCopyWith<_$AccountJournalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
