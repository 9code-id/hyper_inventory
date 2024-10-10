// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductStockImpl _$$ProductStockImplFromJson(Map<String, dynamic> json) =>
    _$ProductStockImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      productName: json['product_name'] as String? ?? null,
      stock: (json['stock'] as num?)?.toInt() ?? null,
      purchaseCount: (json['purchase_count'] as num?)?.toInt() ?? null,
      orderCount: (json['order_count'] as num?)?.toInt() ?? null,
    );

Map<String, dynamic> _$$ProductStockImplToJson(_$ProductStockImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_name': instance.productName,
      'stock': instance.stock,
      'purchase_count': instance.purchaseCount,
      'order_count': instance.orderCount,
    };
