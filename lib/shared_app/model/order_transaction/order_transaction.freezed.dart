// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderTransaction _$OrderTransactionFromJson(Map<String, dynamic> json) {
  return _OrderTransaction.fromJson(json);
}

/// @nodoc
mixin _$OrderTransaction {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  int? get userProfileId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_profile_id')
  set userProfileId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  int? get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  set customerId(int? value) => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'customer')
  Customer? get customer => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer')
  set customer(Customer? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  set paymentMethod(PaymentMethod? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderTransactionCopyWith<OrderTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTransactionCopyWith<$Res> {
  factory $OrderTransactionCopyWith(
          OrderTransaction value, $Res Function(OrderTransaction) then) =
      _$OrderTransactionCopyWithImpl<$Res, OrderTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'customer') Customer? customer,
      @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod});

  $UserProfileCopyWith<$Res>? get userProfile;
  $CustomerCopyWith<$Res>? get customer;
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class _$OrderTransactionCopyWithImpl<$Res, $Val extends OrderTransaction>
    implements $OrderTransactionCopyWith<$Res> {
  _$OrderTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? customerId = freezed,
    Object? paymentMethodId = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? customer = freezed,
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
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
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
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
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
abstract class _$$OrderTransactionImplCopyWith<$Res>
    implements $OrderTransactionCopyWith<$Res> {
  factory _$$OrderTransactionImplCopyWith(_$OrderTransactionImpl value,
          $Res Function(_$OrderTransactionImpl) then) =
      __$$OrderTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_profile_id') int? userProfileId,
      @JsonKey(name: 'customer_id') int? customerId,
      @JsonKey(name: 'payment_method_id') int? paymentMethodId,
      @JsonKey(name: 'order_status') String? orderStatus,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'user_profile') UserProfile? userProfile,
      @JsonKey(name: 'customer') Customer? customer,
      @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
}

/// @nodoc
class __$$OrderTransactionImplCopyWithImpl<$Res>
    extends _$OrderTransactionCopyWithImpl<$Res, _$OrderTransactionImpl>
    implements _$$OrderTransactionImplCopyWith<$Res> {
  __$$OrderTransactionImplCopyWithImpl(_$OrderTransactionImpl _value,
      $Res Function(_$OrderTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfileId = freezed,
    Object? customerId = freezed,
    Object? paymentMethodId = freezed,
    Object? orderStatus = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userProfile = freezed,
    Object? customer = freezed,
    Object? paymentMethod = freezed,
  }) {
    return _then(_$OrderTransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userProfileId: freezed == userProfileId
          ? _value.userProfileId
          : userProfileId // ignore: cast_nullable_to_non_nullable
              as int?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
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
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderTransactionImpl implements _OrderTransaction {
  _$OrderTransactionImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'user_profile_id') this.userProfileId = null,
      @JsonKey(name: 'customer_id') this.customerId = null,
      @JsonKey(name: 'payment_method_id') this.paymentMethodId = null,
      @JsonKey(name: 'order_status') this.orderStatus = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'user_profile') this.userProfile = null,
      @JsonKey(name: 'customer') this.customer = null,
      @JsonKey(name: 'payment_method') this.paymentMethod = null});

  factory _$OrderTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTransactionImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'user_profile_id')
  int? userProfileId;
  @override
  @JsonKey(name: 'customer_id')
  int? customerId;
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
  @JsonKey(name: 'customer')
  Customer? customer;
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod? paymentMethod;

  @override
  String toString() {
    return 'OrderTransaction(id: $id, userProfileId: $userProfileId, customerId: $customerId, paymentMethodId: $paymentMethodId, orderStatus: $orderStatus, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, userProfile: $userProfile, customer: $customer, paymentMethod: $paymentMethod)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTransactionImplCopyWith<_$OrderTransactionImpl> get copyWith =>
      __$$OrderTransactionImplCopyWithImpl<_$OrderTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTransactionImplToJson(
      this,
    );
  }
}

abstract class _OrderTransaction implements OrderTransaction {
  factory _OrderTransaction(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'user_profile_id') int? userProfileId,
          @JsonKey(name: 'customer_id') int? customerId,
          @JsonKey(name: 'payment_method_id') int? paymentMethodId,
          @JsonKey(name: 'order_status') String? orderStatus,
          @JsonKey(name: 'total') double? total,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'user_profile') UserProfile? userProfile,
          @JsonKey(name: 'customer') Customer? customer,
          @JsonKey(name: 'payment_method') PaymentMethod? paymentMethod}) =
      _$OrderTransactionImpl;

  factory _OrderTransaction.fromJson(Map<String, dynamic> json) =
      _$OrderTransactionImpl.fromJson;

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
  @JsonKey(name: 'customer_id')
  int? get customerId;
  @JsonKey(name: 'customer_id')
  set customerId(int? value);
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
  @JsonKey(name: 'customer')
  Customer? get customer;
  @JsonKey(name: 'customer')
  set customer(Customer? value);
  @override
  @JsonKey(name: 'payment_method')
  PaymentMethod? get paymentMethod;
  @JsonKey(name: 'payment_method')
  set paymentMethod(PaymentMethod? value);
  @override
  @JsonKey(ignore: true)
  _$$OrderTransactionImplCopyWith<_$OrderTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
