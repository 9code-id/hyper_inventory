// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_journal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountJournalImpl _$$AccountJournalImplFromJson(Map<String, dynamic> json) =>
    _$AccountJournalImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      accountCategoryId: (json['account_category_id'] as num?)?.toInt() ?? null,
      amount: (json['amount'] as num?)?.toDouble() ?? null,
      description: json['description'] as String? ?? null,
      userProfileId: (json['user_profile_id'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      accountCategory: json['account_category'] == null
          ? null
          : AccountCategory.fromJson(
              json['account_category'] as Map<String, dynamic>),
      userProfile: json['user_profile'] == null
          ? null
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountJournalImplToJson(
        _$AccountJournalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_category_id': instance.accountCategoryId,
      'amount': instance.amount,
      'description': instance.description,
      'user_profile_id': instance.userProfileId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'account_category': instance.accountCategory,
      'user_profile': instance.userProfile,
    };
