// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LessonLeaderboardImpl _$$LessonLeaderboardImplFromJson(
        Map<String, dynamic> json) =>
    _$LessonLeaderboardImpl(
      id: (json['id'] as num?)?.toInt() ?? null,
      userProfileId: (json['user_profile_id'] as num?)?.toInt() ?? null,
      currentStreak: (json['current_streak'] as num?)?.toInt() ?? null,
      longestStreak: (json['longest_streak'] as num?)?.toInt() ?? null,
      totalMinutes: (json['total_minutes'] as num?)?.toInt() ?? null,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userProfile: json['user_profile'] == null
          ? null
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LessonLeaderboardImplToJson(
        _$LessonLeaderboardImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_profile_id': instance.userProfileId,
      'current_streak': instance.currentStreak,
      'longest_streak': instance.longestStreak,
      'total_minutes': instance.totalMinutes,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_profile': instance.userProfile,
    };
