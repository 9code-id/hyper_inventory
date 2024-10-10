import 'package:hyper_supabase/core.dart';

extension LessonCategoryServiceExtension on LessonCategoryService {
  Future<void> createDummies() async {
    await LessonCategoryService().create(
      lessonCategoryName: r.randomName(),
      sortIndex: r.randomInt(),
    );
  }
}
