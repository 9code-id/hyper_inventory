import 'package:hyper_supabase/core.dart';

extension LessonServiceExtension on LessonService {
  Future<void> createDummies() async {
    await LessonService().create(
      imageUrl: r.randomImageUrl(),
      lessonCategoryId: await r.randomId('lesson_category'),
      lessonName: r.randomName(),
      description: r.randomDescription(),
      lessonType: r.firstValueFromList(["Video", "Audio", "PDF"]),
      url: r.randomUrl(),
      userProfileId: currentUser!.id,
      sortIndex: r.randomInt(),
    );
  }
}
