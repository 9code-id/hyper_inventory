import 'package:freezed_annotation/freezed_annotation.dart';
import '../product_category/product_category.dart';

part 'product_stock.freezed.dart';
part 'product_stock.g.dart';

@unfreezed
class ProductStock with _$ProductStock {
  factory ProductStock({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'product_name') String? productName,
    @Default(null) @JsonKey(name: 'stock') int? stock,
    @Default(null) @JsonKey(name: 'purchase_count') int? purchaseCount,
    @Default(null) @JsonKey(name: 'order_count') int? orderCount,
  }) = _ProductStock;

  factory ProductStock.fromJson(Map<String, dynamic> json) =>
      _$ProductStockFromJson(json);
}
