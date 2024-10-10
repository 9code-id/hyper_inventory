import 'package:freezed_annotation/freezed_annotation.dart';
import './../account_category/account_category.dart';
import './../user_profile/user_profile.dart';

part 'account_journal.freezed.dart';
part 'account_journal.g.dart';

@unfreezed
class AccountJournal with _$AccountJournal {
  factory AccountJournal({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'account_category_id') int? accountCategoryId,
    @Default(null) @JsonKey(name: 'amount') double? amount,
    @Default(null) @JsonKey(name: 'description') String? description,
    @Default(null) @JsonKey(name: 'user_profile_id') int? userProfileId,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null)
    @JsonKey(name: 'account_category')
    AccountCategory? accountCategory,
    @Default(null) @JsonKey(name: 'user_profile') UserProfile? userProfile,
  }) = _AccountJournal;

  factory AccountJournal.fromJson(Map<String, dynamic> json) =>
      _$AccountJournalFromJson(json);
}
