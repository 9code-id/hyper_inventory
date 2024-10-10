import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class AccountJournalService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? accountCategoryId,
    String? accountCategoryIdOperatorAndValue,
    double? amount,
    String? amountOperatorAndValue,
    String? description,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('account_journal').select(
      """
*,
account_category!inner(*),
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (accountCategoryId != null) {
      query = query.eq('account_category_id', accountCategoryId);
    }
    if (amountOperatorAndValue != null) {
      query = query.eqo('amount', amountOperatorAndValue);
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
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
    int? accountCategoryId,
    String? accountCategoryIdOperatorAndValue,
    double? amount,
    String? amountOperatorAndValue,
    String? description,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('account_journal').select(
      """
*,
account_category!inner(*),
user_profile!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (accountCategoryId != null) {
      query = query.eq('account_category_id', accountCategoryId);
    }
    if (amountOperatorAndValue != null) {
      query = query.eqo('amount', amountOperatorAndValue);
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
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

  Future<Map<String, dynamic>?> getAccountJournalById(int id) async {
    final response = await client
        .from('account_journal')
        .select(
          """
*,
account_category!inner(*),
user_profile!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? accountCategoryId,
    double? amount,
    String? description,
    int? userProfileId,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('account_journal')
          .insert([
            {
              'account_category_id': accountCategoryId ?? 0,
              'amount': amount ?? 0,
              'description': description,
              'user_profile_id': userProfileId ?? 0,
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
    int? accountCategoryId,
    double? amount,
    String? description,
    int? userProfileId,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getAccountJournalById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('account_journal')
          .update({
            'account_category_id':
                accountCategoryId ?? current['account_category_id'],
            'amount': amount ?? current['amount'],
            'description': description ?? current['description'],
            'user_profile_id': userProfileId ?? current['user_profile_id'],
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
      await client.from('account_journal').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('account_journal').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
