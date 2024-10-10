// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountCategory _$AccountCategoryFromJson(Map<String, dynamic> json) {
  return _AccountCategory.fromJson(json);
}

/// @nodoc
mixin _$AccountCategory {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category_name')
  String? get accountCategoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_category_name')
  set accountCategoryName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_type')
  String? get accountType => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_type')
  set accountType(String? value) => throw _privateConstructorUsedError;
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
  $AccountCategoryCopyWith<AccountCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCategoryCopyWith<$Res> {
  factory $AccountCategoryCopyWith(
          AccountCategory value, $Res Function(AccountCategory) then) =
      _$AccountCategoryCopyWithImpl<$Res, AccountCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'account_category_name') String? accountCategoryName,
      @JsonKey(name: 'account_type') String? accountType,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$AccountCategoryCopyWithImpl<$Res, $Val extends AccountCategory>
    implements $AccountCategoryCopyWith<$Res> {
  _$AccountCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountCategoryName = freezed,
    Object? accountType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCategoryName: freezed == accountCategoryName
          ? _value.accountCategoryName
          : accountCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$AccountCategoryImplCopyWith<$Res>
    implements $AccountCategoryCopyWith<$Res> {
  factory _$$AccountCategoryImplCopyWith(_$AccountCategoryImpl value,
          $Res Function(_$AccountCategoryImpl) then) =
      __$$AccountCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'account_category_name') String? accountCategoryName,
      @JsonKey(name: 'account_type') String? accountType,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$AccountCategoryImplCopyWithImpl<$Res>
    extends _$AccountCategoryCopyWithImpl<$Res, _$AccountCategoryImpl>
    implements _$$AccountCategoryImplCopyWith<$Res> {
  __$$AccountCategoryImplCopyWithImpl(
      _$AccountCategoryImpl _value, $Res Function(_$AccountCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? accountCategoryName = freezed,
    Object? accountType = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$AccountCategoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      accountCategoryName: freezed == accountCategoryName
          ? _value.accountCategoryName
          : accountCategoryName // ignore: cast_nullable_to_non_nullable
              as String?,
      accountType: freezed == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$AccountCategoryImpl implements _AccountCategory {
  _$AccountCategoryImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'account_category_name') this.accountCategoryName = null,
      @JsonKey(name: 'account_type') this.accountType = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null});

  factory _$AccountCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'account_category_name')
  String? accountCategoryName;
  @override
  @JsonKey(name: 'account_type')
  String? accountType;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @override
  String toString() {
    return 'AccountCategory(id: $id, accountCategoryName: $accountCategoryName, accountType: $accountType, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountCategoryImplCopyWith<_$AccountCategoryImpl> get copyWith =>
      __$$AccountCategoryImplCopyWithImpl<_$AccountCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountCategoryImplToJson(
      this,
    );
  }
}

abstract class _AccountCategory implements AccountCategory {
  factory _AccountCategory(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'account_category_name') String? accountCategoryName,
          @JsonKey(name: 'account_type') String? accountType,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt}) =
      _$AccountCategoryImpl;

  factory _AccountCategory.fromJson(Map<String, dynamic> json) =
      _$AccountCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'account_category_name')
  String? get accountCategoryName;
  @JsonKey(name: 'account_category_name')
  set accountCategoryName(String? value);
  @override
  @JsonKey(name: 'account_type')
  String? get accountType;
  @JsonKey(name: 'account_type')
  set accountType(String? value);
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
  _$$AccountCategoryImplCopyWith<_$AccountCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
