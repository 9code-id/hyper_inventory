import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class PaymentMethodService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? paymentMethodName,
    String? accountName,
    String? accountNumber,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('payment_method').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (paymentMethodName != null && paymentMethodName.isNotEmpty) {
      query = query.ilike('payment_method_name', '%$paymentMethodName%');
    }
    if (accountName != null && accountName.isNotEmpty) {
      query = query.ilike('account_name', '%$accountName%');
    }
    if (accountNumber != null) {
      query = query.eq('account_number', accountNumber);
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
    String? paymentMethodName,
    String? accountName,
    String? accountNumber,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('payment_method').select(
      """
*
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (paymentMethodName != null && paymentMethodName.isNotEmpty) {
      query = query.ilike('payment_method_name', '%$paymentMethodName%');
    }
    if (accountName != null && accountName.isNotEmpty) {
      query = query.ilike('account_name', '%$accountName%');
    }
    if (accountNumber != null) {
      query = query.eq('account_number', accountNumber);
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

  Future<Map<String, dynamic>?> getPaymentMethodById(int id) async {
    final response = await client
        .from('payment_method')
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
    String? paymentMethodName,
    String? accountName,
    String? accountNumber,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('payment_method')
          .insert([
            {
              'payment_method_name': paymentMethodName,
              'account_name': accountName,
              'account_number': accountNumber,
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
    String? paymentMethodName,
    String? accountName,
    String? accountNumber,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getPaymentMethodById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('payment_method')
          .update({
            'payment_method_name':
                paymentMethodName ?? current['payment_method_name'],
            'account_name': accountName ?? current['account_name'],
            'account_number': accountNumber ?? current['account_number'],
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
      await client.from('payment_method').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('payment_method').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
