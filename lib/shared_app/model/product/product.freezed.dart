// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  set id(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  set imageUrl(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String? get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  set productName(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category_id')
  int? get productCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category_id')
  set productCategoryId(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  set description(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'sku')
  String? get sku => throw _privateConstructorUsedError;
  @JsonKey(name: 'sku')
  set sku(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrcode')
  String? get qrcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrcode')
  set qrcode(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_price')
  double? get purchasePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_price')
  set purchasePrice(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  double? get sellingPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'selling_price')
  set sellingPrice(double? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock')
  int? get stock => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock')
  set stock(int? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  set updatedAt(DateTime? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category')
  ProductCategory? get productCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_category')
  set productCategory(ProductCategory? value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'product_category_id') int? productCategoryId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'sku') String? sku,
      @JsonKey(name: 'qrcode') String? qrcode,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'product_category') ProductCategory? productCategory});

  $ProductCategoryCopyWith<$Res>? get productCategory;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? productName = freezed,
    Object? productCategoryId = freezed,
    Object? description = freezed,
    Object? sku = freezed,
    Object? qrcode = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? stock = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? productCategory = freezed,
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
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategoryId: freezed == productCategoryId
          ? _value.productCategoryId
          : productCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCategoryCopyWith<$Res>? get productCategory {
    if (_value.productCategory == null) {
      return null;
    }

    return $ProductCategoryCopyWith<$Res>(_value.productCategory!, (value) {
      return _then(_value.copyWith(productCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'product_category_id') int? productCategoryId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'sku') String? sku,
      @JsonKey(name: 'qrcode') String? qrcode,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'product_category') ProductCategory? productCategory});

  @override
  $ProductCategoryCopyWith<$Res>? get productCategory;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? productName = freezed,
    Object? productCategoryId = freezed,
    Object? description = freezed,
    Object? sku = freezed,
    Object? qrcode = freezed,
    Object? purchasePrice = freezed,
    Object? sellingPrice = freezed,
    Object? stock = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? productCategory = freezed,
  }) {
    return _then(_$ProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      productName: freezed == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productCategoryId: freezed == productCategoryId
          ? _value.productCategoryId
          : productCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      sku: freezed == sku
          ? _value.sku
          : sku // ignore: cast_nullable_to_non_nullable
              as String?,
      qrcode: freezed == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String?,
      purchasePrice: freezed == purchasePrice
          ? _value.purchasePrice
          : purchasePrice // ignore: cast_nullable_to_non_nullable
              as double?,
      sellingPrice: freezed == sellingPrice
          ? _value.sellingPrice
          : sellingPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productCategory: freezed == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as ProductCategory?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  _$ProductImpl(
      {@JsonKey(name: 'id') this.id = null,
      @JsonKey(name: 'image_url') this.imageUrl = null,
      @JsonKey(name: 'product_name') this.productName = null,
      @JsonKey(name: 'product_category_id') this.productCategoryId = null,
      @JsonKey(name: 'description') this.description = null,
      @JsonKey(name: 'sku') this.sku = null,
      @JsonKey(name: 'qrcode') this.qrcode = null,
      @JsonKey(name: 'purchase_price') this.purchasePrice = null,
      @JsonKey(name: 'selling_price') this.sellingPrice = null,
      @JsonKey(name: 'stock') this.stock = null,
      @JsonKey(name: 'created_at') this.createdAt = null,
      @JsonKey(name: 'updated_at') this.updatedAt = null,
      @JsonKey(name: 'product_category') this.productCategory = null});

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  int? id;
  @override
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @override
  @JsonKey(name: 'product_name')
  String? productName;
  @override
  @JsonKey(name: 'product_category_id')
  int? productCategoryId;
  @override
  @JsonKey(name: 'description')
  String? description;
  @override
  @JsonKey(name: 'sku')
  String? sku;
  @override
  @JsonKey(name: 'qrcode')
  String? qrcode;
  @override
  @JsonKey(name: 'purchase_price')
  double? purchasePrice;
  @override
  @JsonKey(name: 'selling_price')
  double? sellingPrice;
  @override
  @JsonKey(name: 'stock')
  int? stock;
  @override
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @override
  @JsonKey(name: 'product_category')
  ProductCategory? productCategory;

  @override
  String toString() {
    return 'Product(id: $id, imageUrl: $imageUrl, productName: $productName, productCategoryId: $productCategoryId, description: $description, sku: $sku, qrcode: $qrcode, purchasePrice: $purchasePrice, sellingPrice: $sellingPrice, stock: $stock, createdAt: $createdAt, updatedAt: $updatedAt, productCategory: $productCategory)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  factory _Product(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'product_name') String? productName,
      @JsonKey(name: 'product_category_id') int? productCategoryId,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'sku') String? sku,
      @JsonKey(name: 'qrcode') String? qrcode,
      @JsonKey(name: 'purchase_price') double? purchasePrice,
      @JsonKey(name: 'selling_price') double? sellingPrice,
      @JsonKey(name: 'stock') int? stock,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'product_category')
      ProductCategory? productCategory}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

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
  @JsonKey(name: 'product_name')
  String? get productName;
  @JsonKey(name: 'product_name')
  set productName(String? value);
  @override
  @JsonKey(name: 'product_category_id')
  int? get productCategoryId;
  @JsonKey(name: 'product_category_id')
  set productCategoryId(int? value);
  @override
  @JsonKey(name: 'description')
  String? get description;
  @JsonKey(name: 'description')
  set description(String? value);
  @override
  @JsonKey(name: 'sku')
  String? get sku;
  @JsonKey(name: 'sku')
  set sku(String? value);
  @override
  @JsonKey(name: 'qrcode')
  String? get qrcode;
  @JsonKey(name: 'qrcode')
  set qrcode(String? value);
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
  @JsonKey(name: 'stock')
  int? get stock;
  @JsonKey(name: 'stock')
  set stock(int? value);
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
  @JsonKey(name: 'product_category')
  ProductCategory? get productCategory;
  @JsonKey(name: 'product_category')
  set productCategory(ProductCategory? value);
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
