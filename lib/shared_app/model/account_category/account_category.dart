import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_category.freezed.dart';
part 'account_category.g.dart';

@unfreezed
class AccountCategory with _$AccountCategory {
  factory AccountCategory({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null)
    @JsonKey(name: 'account_category_name')
    String? accountCategoryName,
    @Default(null) @JsonKey(name: 'account_type') String? accountType,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _AccountCategory;

  factory AccountCategory.fromJson(Map<String, dynamic> json) =>
      _$AccountCategoryFromJson(json);
}
