// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      imageUrl: json['image_url'] as String? ?? null,
      productName: json['product_name'] as String? ?? null,
      productCategoryId: (json['product_category_id'] as num?)?.toInt() ?? null,
      description: json['description'] as String? ?? null,
      sku: json['sku'] as String? ?? null,
      qrcode: json['qrcode'] as String? ?? null,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble() ?? null,
      sellingPrice: (json['selling_price'] as num?)?.toDouble() ?? null,
      stock: (json['stock'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      productCategory: json['product_category'] == null
          ? null
          : ProductCategory.fromJson(
              json['product_category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'product_name': instance.productName,
      'product_category_id': instance.productCategoryId,
      'description': instance.description,
      'sku': instance.sku,
      'qrcode': instance.qrcode,
      'purchase_price': instance.purchasePrice,
      'selling_price': instance.sellingPrice,
      'stock': instance.stock,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'product_category': instance.productCategory,
    };
