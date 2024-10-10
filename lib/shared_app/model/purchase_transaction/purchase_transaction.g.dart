// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseTransactionImpl _$$PurchaseTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseTransactionImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userProfileId: (json['user_profile_id'] as num?)?.toInt() ?? null,
      supplierId: (json['supplier_id'] as num?)?.toInt() ?? null,
      paymentMethodId: (json['payment_method_id'] as num?)?.toInt() ?? null,
      orderStatus: json['order_status'] as String? ?? null,
      total: (json['total'] as num?)?.toDouble() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userProfile: json['user_profile'] == null
          ? null
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PurchaseTransactionImplToJson(
        _$PurchaseTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_profile_id': instance.userProfileId,
      'supplier_id': instance.supplierId,
      'payment_method_id': instance.paymentMethodId,
      'order_status': instance.orderStatus,
      'total': instance.total,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_profile': instance.userProfile,
      'supplier': instance.supplier,
      'payment_method': instance.paymentMethod,
    };
