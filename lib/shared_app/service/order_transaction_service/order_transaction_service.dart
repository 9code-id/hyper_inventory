import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class OrderTransactionService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? userProfileId,
    String? userProfileIdOperatorAndValue,
    int? customerId,
    String? customerIdOperatorAndValue,
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
    var query = client.from('order_transaction').select(
      """
*,
user_profile!inner(*),
customer!inner(*),
payment_method!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (customerId != null) {
      query = query.eq('customer_id', customerId);
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
    int? customerId,
    String? customerIdOperatorAndValue,
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
    var query = client.from('order_transaction').select(
      """
*,
user_profile!inner(*),
customer!inner(*),
payment_method!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (userProfileId != null) {
      query = query.eq('user_profile_id', userProfileId);
    }
    if (customerId != null) {
      query = query.eq('customer_id', customerId);
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

  Future<Map<String, dynamic>?> getOrderTransactionById(int id) async {
    final response = await client
        .from('order_transaction')
        .select(
          """
*,
user_profile!inner(*),
customer!inner(*),
payment_method!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? userProfileId,
    int? customerId,
    int? paymentMethodId,
    String? orderStatus,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('order_transaction')
          .insert([
            {
              'user_profile_id': userProfileId ?? 0,
              'customer_id': customerId ?? 0,
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
    int? customerId,
    int? paymentMethodId,
    String? orderStatus,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getOrderTransactionById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('order_transaction')
          .update({
            'user_profile_id': userProfileId ?? current['user_profile_id'],
            'customer_id': customerId ?? current['customer_id'],
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
      await client.from('order_transaction').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('order_transaction').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<num> getOrderTransactionTotalToday() async {
    return await sumToday('order_transaction', 'total');
  }

  Future<num> getOrderTransactionTotalThisWeek() async {
    return await sumThisWeek('order_transaction', 'total');
  }

  Future<num> getOrderTransactionTotalThisMonth() async {
    return await sumThisMonth('order_transaction', 'total');
  }

  Future<num> getOrderTransactionTotalThisYear() async {
    return await sumThisYear('order_transaction', 'total');
  }

  Future<List<Map<String, dynamic>>> getOrderTransactionMonthlyChart() async {
    return await monthlyChart('order_transaction', 'total');
  }
}
