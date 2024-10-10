import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class LessonLeaderboardService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? currentStreak,
    String? currentStreakOperatorAndValue,
    int? longestStreak,
    String? longestStreakOperatorAndValue,
    int? totalMinutes,
    String? totalMinutesOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('lesson_leaderboard').select(
      """
*,
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (currentStreakOperatorAndValue != null) {
      query = query.eqo('current_streak', currentStreakOperatorAndValue);
    }
    if (longestStreakOperatorAndValue != null) {
      query = query.eqo('longest_streak', longestStreakOperatorAndValue);
    }
    if (totalMinutesOperatorAndValue != null) {
      query = query.eqo('total_minutes', totalMinutesOperatorAndValue);
    }
    if (createdAtFrom != null && createdAtTo != null) {
      final startOfDayFrom =
          DateTime(createdAtFrom.year, createdAtFrom.month, createdAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(createdAtTo.year, createdAtTo.month, createdAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('created_at', startOfDayFrom.toIso8601String())
          .lt('created_at', startOfDayTo.toIso8601String());
    }
    if (updatedAtFrom != null && updatedAtTo != null) {
      final startOfDayFrom =
          DateTime(updatedAtFrom.year, updatedAtFrom.month, updatedAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(updatedAtTo.year, updatedAtTo.month, updatedAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('updated_at', startOfDayFrom.toIso8601String())
          .lt('updated_at', startOfDayTo.toIso8601String());
    }

    var response = await query.order('id', ascending: false).exec();
    return List.from(response);
  }

//@SUPABASE
  Stream snapshot({
    int? id,
    String? idOperatorAndValue,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? currentStreak,
    String? currentStreakOperatorAndValue,
    int? longestStreak,
    String? longestStreakOperatorAndValue,
    int? totalMinutes,
    String? totalMinutesOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('lesson_leaderboard').select(
      """
*,
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (currentStreakOperatorAndValue != null) {
      query = query.eqo('current_streak', currentStreakOperatorAndValue);
    }
    if (longestStreakOperatorAndValue != null) {
      query = query.eqo('longest_streak', longestStreakOperatorAndValue);
    }
    if (totalMinutesOperatorAndValue != null) {
      query = query.eqo('total_minutes', totalMinutesOperatorAndValue);
    }
    if (createdAtFrom != null && createdAtTo != null) {
      final startOfDayFrom =
          DateTime(createdAtFrom.year, createdAtFrom.month, createdAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(createdAtTo.year, createdAtTo.month, createdAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('created_at', startOfDayFrom.toIso8601String())
          .lt('created_at', startOfDayTo.toIso8601String());
    }
    if (updatedAtFrom != null && updatedAtTo != null) {
      final startOfDayFrom =
          DateTime(updatedAtFrom.year, updatedAtFrom.month, updatedAtFrom.day)
              .toUtc();
      final startOfDayTo =
          DateTime(updatedAtTo.year, updatedAtTo.month, updatedAtTo.day)
              .toUtc()
              .add(Duration(days: 1));
      query = query
          .gte('updated_at', startOfDayFrom.toIso8601String())
          .lt('updated_at', startOfDayTo.toIso8601String());
    }

    return query.order('id', ascending: false).snapshot();
  }
//:@SUPABASE

  Future<Map<String, dynamic>?> getLessonLeaderboardById(int id) async {
    final response = await client
        .from('lesson_leaderboard')
        .select(
          """
*,
user_profile!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? userProfileId,
    int? currentStreak,
    int? longestStreak,
    int? totalMinutes,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('lesson_leaderboard')
          .insert([
            {
              'user_profile_id': userProfileId ?? 0,
              'current_streak': currentStreak ?? 0,
              'longest_streak': longestStreak ?? 0,
              'total_minutes': totalMinutes ?? 0,
              'created_at': createdAt?.yMd,
            }
          ])
          .select() //@UNUSED_IN_MONGODB
          .exec();
      var id = values.first['id'];
      lastInsertID = id;

      return values.first;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>?> update({
    required int id,
    int? userProfileId,
    int? currentStreak,
    int? longestStreak,
    int? totalMinutes,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getLessonLeaderboardById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('lesson_leaderboard')
          .update({
            'user_profile_id': userProfileId ?? current['user_profile_id'],
            'current_streak': currentStreak ?? current['current_streak'],
            'longest_streak': longestStreak ?? current['longest_streak'],
            'total_minutes': totalMinutes ?? current['total_minutes'],
          })
          .eq('id', id)
          .exec();

      return response;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> delete(int id) async {
    try {
      await client.from('lesson_leaderboard').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('lesson_leaderboard').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
