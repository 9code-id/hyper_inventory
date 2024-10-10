// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderTransactionItem _$OrderTransactionItemFromJson(Map<String, dynamic> json) {
  return _OrderTransactionItem.fromJson(json);
}

/// @nodoc
mixin _$OrderTransactionItem {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction_id')
  int? get orderTransactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_transaction_id')
  set orderTransactionId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  int? get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  set productId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  set qty(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_price')
  double? get purchasePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_price')
  set purchasePrice(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  double? get sellingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  set sellingPrice(double? value) => throw _privateConstructorUsedError;
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
  $OrderTransactionItemCopyWith<OrderTransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderTransactionItemCopyWith<$Res> {
  factory $OrderTransactionItemCopyWith(OrderTransactionItem value,
          $Res Function(OrderTransactionItem) then) =
      _$OrderTransactionItemCopyWithImpl<$Res, OrderTransactionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'order_transaction_id') int? orderTransactionId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product});

  $OrderTransactionCopyWith<$Res>? get orderTransaction;
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$OrderTransactionItemCopyWithImpl<$Res,
        $Val extends OrderTransactionItem>
    implements $OrderTransactionItemCopyWith<$Res> {
  _$OrderTransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? orderTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTransactionId: freezed == orderTransactionId
          ? _value.orderTransactionId
          : orderTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
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
abstract class _$$OrderTransactionItemImplCopyWith<$Res>
    implements $OrderTransactionItemCopyWith<$Res> {
  factory _$$OrderTransactionItemImplCopyWith(_$OrderTransactionItemImpl value,
          $Res Function(_$OrderTransactionItemImpl) then) =
      __$$OrderTransactionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'order_transaction_id') int? orderTransactionId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product});

  @override
  $OrderTransactionCopyWith<$Res>? get orderTransaction;
  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$OrderTransactionItemImplCopyWithImpl<$Res>
    extends _$OrderTransactionItemCopyWithImpl<$Res, _$OrderTransactionItemImpl>
    implements _$$OrderTransactionItemImplCopyWith<$Res> {
  __$$OrderTransactionItemImplCopyWithImpl(_$OrderTransactionItemImpl _value,
      $Res Function(_$OrderTransactionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? orderTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? orderTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_$OrderTransactionItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      orderTransactionId: freezed == orderTransactionId
          ? _value.orderTransactionId
          : orderTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
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
class _$OrderTransactionItemImpl implements _OrderTransactionItem {
  _$OrderTransactionItemImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'order_transaction_id') this.orderTransactionId = null,
      @JsonKey(name: 'product_id') this.productId = null,
      @JsonKey(name: 'qty') this.qty = null,
      @JsonKey(name: 'purchase_price') this.purchasePrice = null,
      @JsonKey(name: 'selling_price') this.sellingPrice = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'order_transaction') this.orderTransaction = null,
      @JsonKey(name: 'product') this.product = null});

  factory _$OrderTransactionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderTransactionItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'order_transaction_id')
  int? orderTransactionId;
  @override
  @JsonKey(name: 'product_id')
  int? productId;
  @override
  @JsonKey(name: 'qty')
  int? qty;
  @override
  @JsonKey(name: 'purchase_price')
  double? purchasePrice;
  @override
  @JsonKey(name: 'selling_price')
  double? sellingPrice;
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
  @JsonKey(name: 'order_transaction')
  OrderTransaction? orderTransaction;
  @override
  @JsonKey(name: 'product')
  Product? product;

  @override
  String toString() {
    return 'OrderTransactionItem(id: $id, orderTransactionId: $orderTransactionId, productId: $productId, qty: $qty, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, orderTransaction: $orderTransaction, product: $product)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderTransactionItemImplCopyWith<_$OrderTransactionItemImpl>
      get copyWith =>
          __$$OrderTransactionItemImplCopyWithImpl<_$OrderTransactionItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderTransactionItemImplToJson(
      this,
    );
  }
}

abstract class _OrderTransactionItem implements OrderTransactionItem {
  factory _OrderTransactionItem(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'order_transaction_id') int? orderTransactionId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'order_transaction') OrderTransaction? orderTransaction,
      @JsonKey(name: 'product') Product? product}) = _$OrderTransactionItemImpl;

  factory _OrderTransactionItem.fromJson(Map<String, dynamic> json) =
      _$OrderTransactionItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'order_transaction_id')
  int? get orderTransactionId;
  @JsonKey(name: 'order_transaction_id')
  set orderTransactionId(int? value);
  @override
  @JsonKey(name: 'product_id')
  int? get productId;
  @JsonKey(name: 'product_id')
  set productId(int? value);
  @override
  @JsonKey(name: 'qty')
  int? get qty;
  @JsonKey(name: 'qty')
  set qty(int? value);
  @override
  @JsonKey(name: 'purchase_price')
  double? get purchasePrice;
  @JsonKey(name: 'purchase_price')
  set purchasePrice(double? value);
  @override
  @JsonKey(name: 'selling_price')
  double? get sellingPrice;
  @JsonKey(name: 'selling_price')
  set sellingPrice(double? value);
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
  _$$OrderTransactionItemImplCopyWith<_$OrderTransactionItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
