// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockHistory _$ProductStockHistoryFromJson(Map<String, dynamic> json) {
  return _ProductStockHistory.fromJson(json);
}

/// @nodoc
mixin _$ProductStockHistory {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  set id(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction_id')
  String? get purchaseTransactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction_id')
  set purchaseTransactionId(String? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction_id')
  String? get orderTransactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction_id')
  set orderTransactionId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  set productId(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  set qty(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction')
  PurchaseTransaction? get purchaseTransaction =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction')
  set purchaseTransaction(PurchaseTransaction? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction')
  OrderTransaction? get orderTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction')
  set orderTransaction(OrderTransaction? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'product')
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product')
  set product(Product? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStockHistoryCopyWith<ProductStockHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockHistoryCopyWith<$Res> {
  factory $ProductStockHistoryCopyWith(
          ProductStockHistory value, $Res Function(ProductStockHistory) then) =
      _$ProductStockHistoryCopyWithImpl<$Res, ProductStockHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'purchase_transaction_id') String? purchaseTransactionId,
      @JsonKey(name: 'order_transaction_id') String? orderTransactionId,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'purchase_transaction')
      PurchaseTransaction? purchaseTransaction,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product});

  $PurchaseTransactionCopyWith<$Res>? get purchaseTransaction;
  $OrderTransactionCopyWith<$Res>? get orderTransaction;
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductStockHistoryCopyWithImpl<$Res, $Val extends ProductStockHistory>
    implements $ProductStockHistoryCopyWith<$Res> {
  _$ProductStockHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? purchaseTransactionId = freezed,
    Object? orderTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? purchaseTransaction = freezed,
    Object? orderTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseTransactionId: freezed == purchaseTransactionId
          ? _value.purchaseTransactionId
          : purchaseTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderTransactionId: freezed == orderTransactionId
          ? _value.orderTransactionId
          : orderTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseTransaction: freezed == purchaseTransaction
          ? _value.purchaseTransaction
          : purchaseTransaction // ignore: cast_nullable_to_non_nullable
              as PurchaseTransaction?,
      orderTransaction: freezed == orderTransaction
          ? _value.orderTransaction
          : orderTransaction // ignore: cast_nullable_to_non_nullable
              as OrderTransaction?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PurchaseTransactionCopyWith<$Res>? get purchaseTransaction {
    if (_value.purchaseTransaction == null) {
      return null;
    }

    return $PurchaseTransactionCopyWith<$Res>(_value.purchaseTransaction!,
        (value) {
      return _then(_value.copyWith(purchaseTransaction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderTransactionCopyWith<$Res>? get orderTransaction {
    if (_value.orderTransaction == null) {
      return null;
    }

    return $OrderTransactionCopyWith<$Res>(_value.orderTransaction!, (value) {
      return _then(_value.copyWith(orderTransaction: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductStockHistoryImplCopyWith<$Res>
    implements $ProductStockHistoryCopyWith<$Res> {
  factory _$$ProductStockHistoryImplCopyWith(_$ProductStockHistoryImpl value,
          $Res Function(_$ProductStockHistoryImpl) then) =
      __$$ProductStockHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'purchase_transaction_id') String? purchaseTransactionId,
      @JsonKey(name: 'order_transaction_id') String? orderTransactionId,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'purchase_transaction')
      PurchaseTransaction? purchaseTransaction,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product});

  @override
  $PurchaseTransactionCopyWith<$Res>? get purchaseTransaction;
  @override
  $OrderTransactionCopyWith<$Res>? get orderTransaction;
  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductStockHistoryImplCopyWithImpl<$Res>
    extends _$ProductStockHistoryCopyWithImpl<$Res, _$ProductStockHistoryImpl>
    implements _$$ProductStockHistoryImplCopyWith<$Res> {
  __$$ProductStockHistoryImplCopyWithImpl(_$ProductStockHistoryImpl _value,
      $Res Function(_$ProductStockHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? purchaseTransactionId = freezed,
    Object? orderTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? purchaseTransaction = freezed,
    Object? orderTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_$ProductStockHistoryImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseTransactionId: freezed == purchaseTransactionId
          ? _value.purchaseTransactionId
          : purchaseTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      orderTransactionId: freezed == orderTransactionId
          ? _value.orderTransactionId
          : orderTransactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      purchaseTransaction: freezed == purchaseTransaction
          ? _value.purchaseTransaction
          : purchaseTransaction // ignore: cast_nullable_to_non_nullable
              as PurchaseTransaction?,
      orderTransaction: freezed == orderTransaction
          ? _value.orderTransaction
          : orderTransaction // ignore: cast_nullable_to_non_nullable
              as OrderTransaction?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockHistoryImpl implements _ProductStockHistory {
  _$ProductStockHistoryImpl(
      {@JsonKey(name: '_id') this.id = null,
      @JsonKey(name: 'purchase_transaction_id')
      this.purchaseTransactionId = null,
      @JsonKey(name: 'order_transaction_id') this.orderTransactionId = null,
      @JsonKey(name: 'product_id') this.productId = null,
      @JsonKey(name: 'qty') this.qty = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'purchase_transaction') this.purchaseTransaction = null,
      @JsonKey(name: 'order_transaction') this.orderTransaction = null,
      @JsonKey(name: 'product') this.product = null});

  factory _$ProductStockHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockHistoryImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  String? id;
  @override
  @JsonKey(name: 'purchase_transaction_id')
  String? purchaseTransactionId;
  @override
  @JsonKey(name: 'order_transaction_id')
  String? orderTransactionId;
  @override
  @JsonKey(name: 'product_id')
  String? productId;
  @override
  @JsonKey(name: 'qty')
  int? qty;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @override
  @JsonKey(name: 'purchase_transaction')
  PurchaseTransaction? purchaseTransaction;
  @override
  @JsonKey(name: 'order_transaction')
  OrderTransaction? orderTransaction;
  @override
  @JsonKey(name: 'product')
  Product? product;

  @override
  String toString() {
    return 'ProductStockHistory(id: $id, purchaseTransactionId: $purchaseTransactionId, orderTransactionId: $orderTransactionId, productId: $productId, qty: $qty, createdAt: $createdAt, updatedAt: $updatedAt, purchaseTransaction: $purchaseTransaction, orderTransaction: $orderTransaction, product: $product)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockHistoryImplCopyWith<_$ProductStockHistoryImpl> get copyWith =>
      __$$ProductStockHistoryImplCopyWithImpl<_$ProductStockHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockHistoryImplToJson(
      this,
    );
  }
}

abstract class _ProductStockHistory implements ProductStockHistory {
  factory _ProductStockHistory(
      {@JsonKey(name: '_id') String? id,
      @JsonKey(name: 'purchase_transaction_id') String? purchaseTransactionId,
      @JsonKey(name: 'order_transaction_id') String? orderTransactionId,
      @JsonKey(name: 'product_id') String? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'purchase_transaction')
      PurchaseTransaction? purchaseTransaction,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product}) = _$ProductStockHistoryImpl;

  factory _ProductStockHistory.fromJson(Map<String, dynamic> json) =
      _$ProductStockHistoryImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @JsonKey(name: '_id')
  set id(String? value);
  @override
  @JsonKey(name: 'purchase_transaction_id')
  String? get purchaseTransactionId;
  @JsonKey(name: 'purchase_transaction_id')
  set purchaseTransactionId(String? value);
  @override
  @JsonKey(name: 'order_transaction_id')
  String? get orderTransactionId;
  @JsonKey(name: 'order_transaction_id')
  set orderTransactionId(String? value);
  @override
  @JsonKey(name: 'product_id')
  String? get productId;
  @JsonKey(name: 'product_id')
  set productId(String? value);
  @override
  @JsonKey(name: 'qty')
  int? get qty;
  @JsonKey(name: 'qty')
  set qty(int? value);
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
  @JsonKey(name: 'purchase_transaction')
  PurchaseTransaction? get purchaseTransaction;
  @JsonKey(name: 'purchase_transaction')
  set purchaseTransaction(PurchaseTransaction? value);
  @override
  @JsonKey(name: 'order_transaction')
  OrderTransaction? get orderTransaction;
  @JsonKey(name: 'order_transaction')
  set orderTransaction(OrderTransaction? value);
  @override
  @JsonKey(name: 'product')
  Product? get product;
  @JsonKey(name: 'product')
  set product(Product? value);
  @override
  @JsonKey(ignore: true)
  _$$ProductStockHistoryImplCopyWith<_$ProductStockHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
