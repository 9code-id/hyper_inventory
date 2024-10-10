import 'package:hyper_supabase/core.dart';

extension LessonLeaderboardServiceExtension on LessonLeaderboardService {
  Future<void> createDummies() async {
    await LessonLeaderboardService().create(
      userProfileId: currentUser!.id,
      currentStreak: r.randomInt(),
      longestStreak: r.randomInt(),
      totalMinutes: r.randomInt(),
    );
  }
}
