import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class LessonCategoryService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? lessonCategoryName,
    int? sortIndex,
    String? sortIndexOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('lesson_category').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (lessonCategoryName != null && lessonCategoryName.isNotEmpty) {
      query = query.ilike('lesson_category_name', '%$lessonCategoryName%');
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

    var response = await query.order('sort_index', ascending: true).exec();
    return List.from(response);
  }

//@SUPABASE
  Stream snapshot({
    int? id,
    String? idOperatorAndValue,
    String? lessonCategoryName,
    int? sortIndex,
    String? sortIndexOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('lesson_category').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (lessonCategoryName != null && lessonCategoryName.isNotEmpty) {
      query = query.ilike('lesson_category_name', '%$lessonCategoryName%');
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

    return query.order('sort_index', ascending: true).snapshot();
  }
//:@SUPABASE

  Future<Map<String, dynamic>?> getLessonCategoryById(int id) async {
    final response = await client
        .from('lesson_category')
        .select(
          """
*
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? lessonCategoryName,
    int? sortIndex,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('lesson_category')
          .insert([
            {
              'lesson_category_name': lessonCategoryName,
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
    String? lessonCategoryName,
    int? sortIndex,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getLessonCategoryById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('lesson_category')
          .update({
            'lesson_category_name':
                lessonCategoryName ?? current['lesson_category_name'],
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
      await client.from('lesson_category').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('lesson_category').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
