import 'package:freezed_annotation/freezed_annotation.dart';
import './../purchase_transaction/purchase_transaction.dart';
import './../order_transaction/order_transaction.dart';
import './../product/product.dart';

part 'product_stock_history.freezed.dart';
part 'product_stock_history.g.dart';

@unfreezed
class ProductStockHistory with _$ProductStockHistory {
  factory ProductStockHistory({
    @Default(null) @JsonKey(name: '_id') String? id,
    @Default(null)
    @JsonKey(name: 'purchase_transaction_id')
    String? purchaseTransactionId,
    @Default(null)
    @JsonKey(name: 'order_transaction_id')
    String? orderTransactionId,
    @Default(null) @JsonKey(name: 'product_id') String? productId,
    @Default(null) @JsonKey(name: 'qty') int? qty,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'purchase_transaction')
    PurchaseTransaction? purchaseTransaction,
    @Default(null)
    @JsonKey(name: 'order_transaction')
    OrderTransaction? orderTransaction,
    @Default(null) @JsonKey(name: 'product') Product? product,
  }) = _ProductStockHistory;

  factory ProductStockHistory.fromJson(Map<String, dynamic> json) =>
      _$ProductStockHistoryFromJson(json);
}
