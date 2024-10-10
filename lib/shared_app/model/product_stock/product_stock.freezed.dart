// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStock _$ProductStockFromJson(Map<String, dynamic> json) {
  return _ProductStock.fromJson(json);
}

/// @nodoc
mixin _$ProductStock {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  set productName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock')
  int? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock')
  set stock(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_count')
  int? get purchaseCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_count')
  set purchaseCount(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_count')
  int? get orderCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_count')
  set orderCount(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStockCopyWith<ProductStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockCopyWith<$Res> {
  factory $ProductStockCopyWith(
          ProductStock value, $Res Function(ProductStock) then) =
      _$ProductStockCopyWithImpl<$Res, ProductStock>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'purchase_count') int? purchaseCount,
      @JsonKey(name: 'order_count') int? orderCount});
}

/// @nodoc
class _$ProductStockCopyWithImpl<$Res, $Val extends ProductStock>
    implements $ProductStockCopyWith<$Res> {
  _$ProductStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? stock = freezed,
    Object? purchaseCount = freezed,
    Object? orderCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseCount: freezed == purchaseCount
          ? _value.purchaseCount
          : purchaseCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockImplCopyWith<$Res>
    implements $ProductStockCopyWith<$Res> {
  factory _$$ProductStockImplCopyWith(
          _$ProductStockImpl value, $Res Function(_$ProductStockImpl) then) =
      __$$ProductStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'purchase_count') int? purchaseCount,
      @JsonKey(name: 'order_count') int? orderCount});
}

/// @nodoc
class __$$ProductStockImplCopyWithImpl<$Res>
    extends _$ProductStockCopyWithImpl<$Res, _$ProductStockImpl>
    implements _$$ProductStockImplCopyWith<$Res> {
  __$$ProductStockImplCopyWithImpl(
      _$ProductStockImpl _value, $Res Function(_$ProductStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? productName = freezed,
    Object? stock = freezed,
    Object? purchaseCount = freezed,
    Object? orderCount = freezed,
  }) {
    return _then(_$ProductStockImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      purchaseCount: freezed == purchaseCount
          ? _value.purchaseCount
          : purchaseCount // ignore: cast_nullable_to_non_nullable
              as int?,
      orderCount: freezed == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockImpl implements _ProductStock {
  _$ProductStockImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'product_name') this.productName = null,
      @JsonKey(name: 'stock') this.stock = null,
      @JsonKey(name: 'purchase_count') this.purchaseCount = null,
      @JsonKey(name: 'order_count') this.orderCount = null});

  factory _$ProductStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'product_name')
  String? productName;
  @override
  @JsonKey(name: 'stock')
  int? stock;
  @override
  @JsonKey(name: 'purchase_count')
  int? purchaseCount;
  @override
  @JsonKey(name: 'order_count')
  int? orderCount;

  @override
  String toString() {
    return 'ProductStock(id: $id, productName: $productName, stock: $stock, purchaseCount: $purchaseCount, orderCount: $orderCount)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      __$$ProductStockImplCopyWithImpl<_$ProductStockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockImplToJson(
      this,
    );
  }
}

abstract class _ProductStock implements ProductStock {
  factory _ProductStock(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'purchase_count') int? purchaseCount,
      @JsonKey(name: 'order_count') int? orderCount}) = _$ProductStockImpl;

  factory _ProductStock.fromJson(Map<String, dynamic> json) =
      _$ProductStockImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @JsonKey(name: 'id')
  set id(int? value);
  @override
  @JsonKey(name: 'product_name')
  String? get productName;
  @JsonKey(name: 'product_name')
  set productName(String? value);
  @override
  @JsonKey(name: 'stock')
  int? get stock;
  @JsonKey(name: 'stock')
  set stock(int? value);
  @override
  @JsonKey(name: 'purchase_count')
  int? get purchaseCount;
  @JsonKey(name: 'purchase_count')
  set purchaseCount(int? value);
  @override
  @JsonKey(name: 'order_count')
  int? get orderCount;
  @JsonKey(name: 'order_count')
  set orderCount(int? value);
  @override
  @JsonKey(ignore: true)
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
