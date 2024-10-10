// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseTransaction _$PurchaseTransactionFromJson(Map<String, dynamic> json) {
  return _PurchaseTransaction.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTransaction {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  int? get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  set supplierId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method_id')
  set paymentMethodId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String? get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  set orderStatus(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  set total(double? value) => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'supplier')
  Supplier? get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  set supplier(Supplier? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  set paymentMethod(PaymentMethod? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseTransactionCopyWith<PurchaseTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTransactionCopyWith<$Res> {
  factory $PurchaseTransactionCopyWith(
          PurchaseTransaction value, $Res Function(PurchaseTransaction) then) =
      _$PurchaseTransactionCopyWithImpl<$Res, PurchaseTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'supplier_id') int? supplierId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'supplier') Supplier? supplier,
      @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod});

  $UserProfileCopyWith<$Res>? get userProfile;
  $SupplierCopyWith<$Res>? get supplier;
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$PurchaseTransactionCopyWithImpl<$Res, $Val extends PurchaseTransaction>
    implements $PurchaseTransactionCopyWith<$Res> {
  _$PurchaseTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? supplierId = freezed,
    Object? paymentMethodId = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? supplier = freezed,
    Object? paymentMethod = freezed,
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
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
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
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
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

  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PurchaseTransactionImplCopyWith<$Res>
    implements $PurchaseTransactionCopyWith<$Res> {
  factory _$$PurchaseTransactionImplCopyWith(_$PurchaseTransactionImpl value,
          $Res Function(_$PurchaseTransactionImpl) then) =
      __$$PurchaseTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'supplier_id') int? supplierId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'supplier') Supplier? supplier,
      @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $SupplierCopyWith<$Res>? get supplier;
  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$PurchaseTransactionImplCopyWithImpl<$Res>
    extends _$PurchaseTransactionCopyWithImpl<$Res, _$PurchaseTransactionImpl>
    implements _$$PurchaseTransactionImplCopyWith<$Res> {
  __$$PurchaseTransactionImplCopyWithImpl(_$PurchaseTransactionImpl _value,
      $Res Function(_$PurchaseTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? supplierId = freezed,
    Object? paymentMethodId = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? supplier = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$PurchaseTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      supplierId: freezed == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethodId: freezed == paymentMethodId
          ? _value.paymentMethodId
          : paymentMethodId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: freezed == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
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
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseTransactionImpl implements _PurchaseTransaction {
  _$PurchaseTransactionImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'supplier_id') this.supplierId = null,
      @JsonKey(name: 'payment_method_id') this.paymentMethodId = null,
      @JsonKey(name: 'order_status') this.orderStatus = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_profile') this.userProfile = null,
      @JsonKey(name: 'supplier') this.supplier = null,
      @JsonKey(name: 'payment_method') this.paymentMethod = null});

  factory _$PurchaseTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTransactionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'user_profile_id')
  int? userProfileId;
  @override
  @JsonKey(name: 'supplier_id')
  int? supplierId;
  @override
  @JsonKey(name: 'payment_method_id')
  int? paymentMethodId;
  @override
  @JsonKey(name: 'order_status')
  String? orderStatus;
  @override
  @JsonKey(name: 'total')
  double? total;
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
  @JsonKey(name: 'supplier')
  Supplier? supplier;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod? paymentMethod;

  @override
  String toString() {
    return 'PurchaseTransaction(id: $id, userProfileId: $userProfileId, supplierId: $supplierId, paymentMethodId: $paymentMethodId, orderStatus: $orderStatus, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, userProfile: $userProfile, supplier: $supplier, paymentMethod: $paymentMethod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTransactionImplCopyWith<_$PurchaseTransactionImpl> get copyWith =>
      __$$PurchaseTransactionImplCopyWithImpl<_$PurchaseTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTransactionImplToJson(
      this,
    );
  }
}

abstract class _PurchaseTransaction implements PurchaseTransaction {
  factory _PurchaseTransaction(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'user_profile_id') int? userProfileId,
          @JsonKey(name: 'supplier_id') int? supplierId,
          @JsonKey(name: 'payment_method_id') int? paymentMethodId,
          @JsonKey(name: 'order_status') String? orderStatus,
          @JsonKey(name: 'total') double? total,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'user_profile') UserProfile? userProfile,
          @JsonKey(name: 'supplier') Supplier? supplier,
          @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod}) =
      _$PurchaseTransactionImpl;

  factory _PurchaseTransaction.fromJson(Map<String, dynamic> json) =
      _$PurchaseTransactionImpl.fromJson;

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
  @JsonKey(name: 'supplier_id')
  int? get supplierId;
  @JsonKey(name: 'supplier_id')
  set supplierId(int? value);
  @override
  @JsonKey(name: 'payment_method_id')
  int? get paymentMethodId;
  @JsonKey(name: 'payment_method_id')
  set paymentMethodId(int? value);
  @override
  @JsonKey(name: 'order_status')
  String? get orderStatus;
  @JsonKey(name: 'order_status')
  set orderStatus(String? value);
  @override
  @JsonKey(name: 'total')
  double? get total;
  @JsonKey(name: 'total')
  set total(double? value);
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
  @JsonKey(name: 'supplier')
  Supplier? get supplier;
  @JsonKey(name: 'supplier')
  set supplier(Supplier? value);
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod? get paymentMethod;
  @JsonKey(name: 'payment_method')
  set paymentMethod(PaymentMethod? value);
  @override
  @JsonKey(ignore: true)
  _$$PurchaseTransactionImplCopyWith<_$PurchaseTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
