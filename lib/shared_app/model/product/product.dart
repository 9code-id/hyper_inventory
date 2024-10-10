import 'package:freezed_annotation/freezed_annotation.dart';
import './../product_category/product_category.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@unfreezed
class Product with _$Product {
  factory Product({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'image_url') String? imageUrl,
    @Default(null) @JsonKey(name: 'product_name') String? productName,
    @Default(null) @JsonKey(name: 'product_category_id') int? productCategoryId,
    @Default(null) @JsonKey(name: 'description') String? description,
    @Default(null) @JsonKey(name: 'sku') String? sku,
    @Default(null) @JsonKey(name: 'qrcode') String? qrcode,
    @Default(null) @JsonKey(name: 'purchase_price') double? purchasePrice,
    @Default(null) @JsonKey(name: 'selling_price') double? sellingPrice,
    @Default(null) @JsonKey(name: 'stock') int? stock,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'product_category')
    ProductCategory? productCategory,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
