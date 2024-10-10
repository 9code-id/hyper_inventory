import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? supplierId,
    String? supplierIdOperatorAndValue,
    int? paymentMethodId,
    String? paymentMethodIdOperatorAndValue,
    String? orderStatus,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('purchase_transaction').select(
      """
*,
user_profile!inner(*),
supplier!inner(*),
payment_method!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (supplierId != null) {
      query = query.eq('supplier_id', supplierId);
    }
    if (paymentMethodId != null) {
      query = query.eq('payment_method_id', paymentMethodId);
    }
    if (orderStatus != null) {
      query = query.eq('order_status', orderStatus);
    }
    if (totalOperatorAndValue != null) {
      query = query.eqo('total', totalOperatorAndValue);
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
    int? supplierId,
    String? supplierIdOperatorAndValue,
    int? paymentMethodId,
    String? paymentMethodIdOperatorAndValue,
    String? orderStatus,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('purchase_transaction').select(
      """
*,
user_profile!inner(*),
supplier!inner(*),
payment_method!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (supplierId != null) {
      query = query.eq('supplier_id', supplierId);
    }
    if (paymentMethodId != null) {
      query = query.eq('payment_method_id', paymentMethodId);
    }
    if (orderStatus != null) {
      query = query.eq('order_status', orderStatus);
    }
    if (totalOperatorAndValue != null) {
      query = query.eqo('total', totalOperatorAndValue);
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

  Future<Map<String, dynamic>?> getPurchaseTransactionById(int id) async {
    final response = await client
        .from('purchase_transaction')
        .select(
          """
*,
user_profile!inner(*),
supplier!inner(*),
payment_method!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? userProfileId,
    int? supplierId,
    int? paymentMethodId,
    String? orderStatus,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('purchase_transaction')
          .insert([
            {
              'user_profile_id': userProfileId ?? 0,
              'supplier_id': supplierId ?? 0,
              'payment_method_id': paymentMethodId ?? 0,
              'order_status': orderStatus,
              'total': total ?? 0,
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
    int? supplierId,
    int? paymentMethodId,
    String? orderStatus,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getPurchaseTransactionById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('purchase_transaction')
          .update({
            'user_profile_id': userProfileId ?? current['user_profile_id'],
            'supplier_id': supplierId ?? current['supplier_id'],
            'payment_method_id':
                paymentMethodId ?? current['payment_method_id'],
            'order_status': orderStatus ?? current['order_status'],
            'total': total ?? current['total'],
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
      await client.from('purchase_transaction').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('purchase_transaction').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<num> getPurchaseTransactionTotalToday() async {
    return await sumToday('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisWeek() async {
    return await sumThisWeek('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisMonth() async {
    return await sumThisMonth('purchase_transaction', 'total');
  }

  Future<num> getPurchaseTransactionTotalThisYear() async {
    return await sumThisYear('purchase_transaction', 'total');
  }

  Future<List<Map<String, dynamic>>>
      getPurchaseTransactionMonthlyChart() async {
    return await monthlyChart('purchase_transaction', 'total');
  }
}
