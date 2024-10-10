import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class LessonService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? imageUrl,
    int? lessonCategoryId,
    String? lessonCategoryIdOperatorAndValue,
    String? lessonName,
    String? description,
    String? lessonType,
    String? url,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? sortIndex,
    String? sortIndexOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('lesson').select(
      """
*,
lesson_category!inner(*),
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (lessonCategoryId != null) {
      query = query.eq('lesson_category_id', lessonCategoryId);
    }
    if (lessonName != null && lessonName.isNotEmpty) {
      query = query.ilike('lesson_name', '%$lessonName%');
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (lessonType != null) {
      query = query.eq('lesson_type', lessonType);
    }
    if (url != null) {
      query = query.eq('url', url);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (sortIndexOperatorAndValue != null) {
      query = query.eqo('sort_index', sortIndexOperatorAndValue);
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
    String? imageUrl,
    int? lessonCategoryId,
    String? lessonCategoryIdOperatorAndValue,
    String? lessonName,
    String? description,
    String? lessonType,
    String? url,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? sortIndex,
    String? sortIndexOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('lesson').select(
      """
*,
lesson_category!inner(*),
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (lessonCategoryId != null) {
      query = query.eq('lesson_category_id', lessonCategoryId);
    }
    if (lessonName != null && lessonName.isNotEmpty) {
      query = query.ilike('lesson_name', '%$lessonName%');
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (lessonType != null) {
      query = query.eq('lesson_type', lessonType);
    }
    if (url != null) {
      query = query.eq('url', url);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (sortIndexOperatorAndValue != null) {
      query = query.eqo('sort_index', sortIndexOperatorAndValue);
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

  Future<Map<String, dynamic>?> getLessonById(int id) async {
    final response = await client
        .from('lesson')
        .select(
          """
*,
lesson_category!inner(*),
user_profile!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? imageUrl,
    int? lessonCategoryId,
    String? lessonName,
    String? description,
    String? lessonType,
    String? url,
    int? userProfileId,
    int? sortIndex,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('lesson')
          .insert([
            {
              'image_url': imageUrl,
              'lesson_category_id': lessonCategoryId ?? 0,
              'lesson_name': lessonName,
              'description': description,
              'lesson_type': lessonType,
              'url': url,
              'user_profile_id': userProfileId ?? 0,
              'sort_index': sortIndex ?? 0,
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
    String? imageUrl,
    int? lessonCategoryId,
    String? lessonName,
    String? description,
    String? lessonType,
    String? url,
    int? userProfileId,
    int? sortIndex,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getLessonById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('lesson')
          .update({
            'image_url': imageUrl ?? current['image_url'],
            'lesson_category_id':
                lessonCategoryId ?? current['lesson_category_id'],
            'lesson_name': lessonName ?? current['lesson_name'],
            'description': description ?? current['description'],
            'lesson_type': lessonType ?? current['lesson_type'],
            'url': url ?? current['url'],
            'user_profile_id': userProfileId ?? current['user_profile_id'],
            'sort_index': sortIndex ?? current['sort_index'],
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
      await client.from('lesson').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('lesson').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
