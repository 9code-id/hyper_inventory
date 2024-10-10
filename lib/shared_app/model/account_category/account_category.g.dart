// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountCategoryImpl _$$AccountCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountCategoryImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      accountCategoryName: json['account_category_name'] as String? ?? null,
      accountType: json['account_type'] as String? ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$AccountCategoryImplToJson(
        _$AccountCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_category_name': instance.accountCategoryName,
      'account_type': instance.accountType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
