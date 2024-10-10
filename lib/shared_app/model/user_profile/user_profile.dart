import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@unfreezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'image_url') String? imageUrl,
    @Default(null) @JsonKey(name: 'user_profile_name') String? userProfileName,
    @Default(null) @JsonKey(name: 'gender') String? gender,
    @Default(null) @JsonKey(name: 'email') String? email,
    @Default(null) @JsonKey(name: 'password') String? password,
    @Default(null) @JsonKey(name: 'role') String? role,
    @Default(null) @JsonKey(name: 'is_active') bool? isActive,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
