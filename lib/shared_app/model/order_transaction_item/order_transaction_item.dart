import 'package:freezed_annotation/freezed_annotation.dart';
import './../order_transaction/order_transaction.dart';
import './../product/product.dart';

part 'order_transaction_item.freezed.dart';
part 'order_transaction_item.g.dart';

@unfreezed
class OrderTransactionItem with _$OrderTransactionItem {
  factory OrderTransactionItem({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null)
    @JsonKey(name: 'order_transaction_id')
    int? orderTransactionId,
    @Default(null) @JsonKey(name: 'product_id') int? productId,
    @Default(null) @JsonKey(name: 'qty') int? qty,
    @Default(null) @JsonKey(name: 'purchase_price') double? purchasePrice,
    @Default(null) @JsonKey(name: 'selling_price') double? sellingPrice,
    @Default(null) @JsonKey(name: 'total') double? total,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'order_transaction')
    OrderTransaction? orderTransaction,
    @Default(null) @JsonKey(name: 'product') Product? product,
  }) = _OrderTransactionItem;

  factory OrderTransactionItem.fromJson(Map<String, dynamic> json) =>
      _$OrderTransactionItemFromJson(json);
}
