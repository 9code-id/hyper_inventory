// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseTransactionItem _$PurchaseTransactionItemFromJson(
    Map<String, dynamic> json) {
  return _PurchaseTransactionItem.fromJson(json);
}

/// @nodoc
mixin _$PurchaseTransactionItem {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction_id')
  int? get purchaseTransactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction_id')
  set purchaseTransactionId(int? value) => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'purchase_transaction')
  PurchaseTransaction? get purchaseTransaction =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_transaction')
  set purchaseTransaction(PurchaseTransaction? value) =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'product')
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product')
  set product(Product? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseTransactionItemCopyWith<PurchaseTransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseTransactionItemCopyWith<$Res> {
  factory $PurchaseTransactionItemCopyWith(PurchaseTransactionItem value,
          $Res Function(PurchaseTransactionItem) then) =
      _$PurchaseTransactionItemCopyWithImpl<$Res, PurchaseTransactionItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'purchase_transaction_id') int? purchaseTransactionId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'purchase_transaction')
      PurchaseTransaction? purchaseTransaction,
      @JsonKey(name: 'product') Product? product});

  $PurchaseTransactionCopyWith<$Res>? get purchaseTransaction;
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$PurchaseTransactionItemCopyWithImpl<$Res,
        $Val extends PurchaseTransactionItem>
    implements $PurchaseTransactionItemCopyWith<$Res> {
  _$PurchaseTransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? purchaseTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? purchasePrice = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? purchaseTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseTransactionId: freezed == purchaseTransactionId
          ? _value.purchaseTransactionId
          : purchaseTransactionId // ignore: cast_nullable_to_non_nullable
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
      purchaseTransaction: freezed == purchaseTransaction
          ? _value.purchaseTransaction
          : purchaseTransaction // ignore: cast_nullable_to_non_nullable
              as PurchaseTransaction?,
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
abstract class _$$PurchaseTransactionItemImplCopyWith<$Res>
    implements $PurchaseTransactionItemCopyWith<$Res> {
  factory _$$PurchaseTransactionItemImplCopyWith(
          _$PurchaseTransactionItemImpl value,
          $Res Function(_$PurchaseTransactionItemImpl) then) =
      __$$PurchaseTransactionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'purchase_transaction_id') int? purchaseTransactionId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'qty') int? qty,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'total') double? total,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'purchase_transaction')
      PurchaseTransaction? purchaseTransaction,
      @JsonKey(name: 'product') Product? product});

  @override
  $PurchaseTransactionCopyWith<$Res>? get purchaseTransaction;
  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$PurchaseTransactionItemImplCopyWithImpl<$Res>
    extends _$PurchaseTransactionItemCopyWithImpl<$Res,
        _$PurchaseTransactionItemImpl>
    implements _$$PurchaseTransactionItemImplCopyWith<$Res> {
  __$$PurchaseTransactionItemImplCopyWithImpl(
      _$PurchaseTransactionItemImpl _value,
      $Res Function(_$PurchaseTransactionItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? purchaseTransactionId = freezed,
    Object? productId = freezed,
    Object? qty = freezed,
    Object? purchasePrice = freezed,
    Object? total = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? purchaseTransaction = freezed,
    Object? product = freezed,
  }) {
    return _then(_$PurchaseTransactionItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseTransactionId: freezed == purchaseTransactionId
          ? _value.purchaseTransactionId
          : purchaseTransactionId // ignore: cast_nullable_to_non_nullable
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
      purchaseTransaction: freezed == purchaseTransaction
          ? _value.purchaseTransaction
          : purchaseTransaction // ignore: cast_nullable_to_non_nullable
              as PurchaseTransaction?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseTransactionItemImpl implements _PurchaseTransactionItem {
  _$PurchaseTransactionItemImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'purchase_transaction_id')
      this.purchaseTransactionId = null,
      @JsonKey(name: 'product_id') this.productId = null,
      @JsonKey(name: 'qty') this.qty = null,
      @JsonKey(name: 'purchase_price') this.purchasePrice = null,
      @JsonKey(name: 'total') this.total = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'purchase_transaction') this.purchaseTransaction = null,
      @JsonKey(name: 'product') this.product = null});

  factory _$PurchaseTransactionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseTransactionItemImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'purchase_transaction_id')
  int? purchaseTransactionId;
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
  @JsonKey(name: 'total')
  double? total;
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
  @JsonKey(name: 'product')
  Product? product;

  @override
  String toString() {
    return 'PurchaseTransactionItem(id: $id, purchaseTransactionId: $purchaseTransactionId, productId: $productId, qty: $qty, purchasePrice: $purchasePrice, total: $total, createdAt: $createdAt, updatedAt: $updatedAt, purchaseTransaction: $purchaseTransaction, product: $product)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseTransactionItemImplCopyWith<_$PurchaseTransactionItemImpl>
      get copyWith => __$$PurchaseTransactionItemImplCopyWithImpl<
          _$PurchaseTransactionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseTransactionItemImplToJson(
      this,
    );
  }
}

abstract class _PurchaseTransactionItem implements PurchaseTransactionItem {
  factory _PurchaseTransactionItem(
          {@JsonKey(name: 'id') int? id,
          @JsonKey(name: 'purchase_transaction_id') int? purchaseTransactionId,
          @JsonKey(name: 'product_id') int? productId,
          @JsonKey(name: 'qty') int? qty,
          @JsonKey(name: 'purchase_price') double? purchasePrice,
          @JsonKey(name: 'total') double? total,
          @JsonKey(name: 'created_at') DateTime? createdAt,
          @JsonKey(name: 'updated_at') DateTime? updatedAt,
          @JsonKey(name: 'purchase_transaction')
          PurchaseTransaction? purchaseTransaction,
          @JsonKey(name: 'product') Product? product}) =
      _$PurchaseTransactionItemImpl;

  factory _PurchaseTransactionItem.fromJson(Map<String, dynamic> json) =
      _$PurchaseTransactionItemImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'purchase_transaction_id')
  int? get purchaseTransactionId;
  @JsonKey(name: 'purchase_transaction_id')
  set purchaseTransactionId(int? value);
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
  @JsonKey(name: 'purchase_transaction')
  PurchaseTransaction? get purchaseTransaction;
  @JsonKey(name: 'purchase_transaction')
  set purchaseTransaction(PurchaseTransaction? value);
  @override
  @JsonKey(name: 'product')
  Product? get product;
  @JsonKey(name: 'product')
  set product(Product? value);
  @override
  @JsonKey(ignore: true)
  _$$PurchaseTransactionItemImplCopyWith<_$PurchaseTransactionItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
