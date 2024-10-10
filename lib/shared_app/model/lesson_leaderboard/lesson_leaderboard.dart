import 'package:freezed_annotation/freezed_annotation.dart';
import './../user_profile/user_profile.dart';

part 'lesson_leaderboard.freezed.dart';
part 'lesson_leaderboard.g.dart';

@unfreezed
class LessonLeaderboard with _$LessonLeaderboard {
  factory LessonLeaderboard({
    @Default(null) @JsonKey(name: 'id') int? id,
    @Default(null) @JsonKey(name: 'user_profile_id') int? userProfileId,
    @Default(null) @JsonKey(name: 'current_streak') int? currentStreak,
    @Default(null) @JsonKey(name: 'longest_streak') int? longestStreak,
    @Default(null) @JsonKey(name: 'total_minutes') int? totalMinutes,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @Default(null) @JsonKey(name: 'user_profile') UserProfile? userProfile,
  }) = _LessonLeaderboard;

  factory LessonLeaderboard.fromJson(Map<String, dynamic> json) =>
      _$LessonLeaderboardFromJson(json);
}
