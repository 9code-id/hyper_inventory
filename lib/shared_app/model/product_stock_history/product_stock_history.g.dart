// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockHistoryImpl _$$ProductStockHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductStockHistoryImpl(
      id: json['_id'] as String? ?? null,
      purchaseTransactionId: json['purchase_transaction_id'] as String? ?? null,
      orderTransactionId: json['order_transaction_id'] as String? ?? null,
      productId: json['product_id'] as String? ?? null,
      qty: (json['qty'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      purchaseTransaction: json['purchase_transaction'] == null
          ? null
          : PurchaseTransaction.fromJson(
              json['purchase_transaction'] as Map<String, dynamic>),
      orderTransaction: json['order_transaction'] == null
          ? null
          : OrderTransaction.fromJson(
              json['order_transaction'] as Map<String, dynamic>),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductStockHistoryImplToJson(
        _$ProductStockHistoryImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'purchase_transaction_id': instance.purchaseTransactionId,
      'order_transaction_id': instance.orderTransactionId,
      'product_id': instance.productId,
      'qty': instance.qty,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'purchase_transaction': instance.purchaseTransaction,
      'order_transaction': instance.orderTransaction,
      'product': instance.product,
    };
