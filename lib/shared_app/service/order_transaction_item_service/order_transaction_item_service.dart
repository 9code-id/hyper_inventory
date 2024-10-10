import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class OrderTransactionItemService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? orderTransactionId,
    String? orderTransactionIdOperatorAndValue,
    int? productId,
    String? productIdOperatorAndValue,
    int? qty,
    String? qtyOperatorAndValue,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? sellingPrice,
    String? sellingPriceOperatorAndValue,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('order_transaction_item').select(
      """
*,
order_transaction!inner(*,user_profile!inner(*),customer!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (orderTransactionId != null) {
      query = query.eq('order_transaction_id', orderTransactionId);
    }
    if (productId != null) {
      query = query.eq('product_id', productId);
    }
    if (qtyOperatorAndValue != null) {
      query = query.eqo('qty', qtyOperatorAndValue);
    }
    if (purchasePriceOperatorAndValue != null) {
      query = query.eqo('purchase_price', purchasePriceOperatorAndValue);
    }
    if (sellingPriceOperatorAndValue != null) {
      query = query.eqo('selling_price', sellingPriceOperatorAndValue);
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
    int? orderTransactionId,
    String? orderTransactionIdOperatorAndValue,
    int? productId,
    String? productIdOperatorAndValue,
    int? qty,
    String? qtyOperatorAndValue,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? sellingPrice,
    String? sellingPriceOperatorAndValue,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('order_transaction_item').select(
      """
*,
order_transaction!inner(*,user_profile!inner(*),customer!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (orderTransactionId != null) {
      query = query.eq('order_transaction_id', orderTransactionId);
    }
    if (productId != null) {
      query = query.eq('product_id', productId);
    }
    if (qtyOperatorAndValue != null) {
      query = query.eqo('qty', qtyOperatorAndValue);
    }
    if (purchasePriceOperatorAndValue != null) {
      query = query.eqo('purchase_price', purchasePriceOperatorAndValue);
    }
    if (sellingPriceOperatorAndValue != null) {
      query = query.eqo('selling_price', sellingPriceOperatorAndValue);
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

  Future<Map<String, dynamic>?> getOrderTransactionItemById(int id) async {
    final response = await client
        .from('order_transaction_item')
        .select(
          """
*,
order_transaction!inner(*,user_profile!inner(*),customer!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? orderTransactionId,
    int? productId,
    int? qty,
    double? purchasePrice,
    double? sellingPrice,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      if (await checkProductExist(
        orderTransactionId: orderTransactionId!,
        productId: productId!,
      )) {
        throw Exception("Product already added");
      }

      var values = await client
          .from('order_transaction_item')
          .insert([
            {
              'order_transaction_id': orderTransactionId ?? 0,
              'product_id': productId ?? 0,
              'qty': qty ?? 0,
              'purchase_price': purchasePrice ?? 0,
              'selling_price': sellingPrice ?? 0,
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
    int? orderTransactionId,
    int? productId,
    int? qty,
    double? purchasePrice,
    double? sellingPrice,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getOrderTransactionItemById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('order_transaction_item')
          .update({
            'order_transaction_id':
                orderTransactionId ?? current['order_transaction_id'],
            'product_id': productId ?? current['product_id'],
            'qty': qty ?? current['qty'],
            'purchase_price': purchasePrice ?? current['purchase_price'],
            'selling_price': sellingPrice ?? current['selling_price'],
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
      var current = await getOrderTransactionItemById(id);

      await client.from('order_transaction_item').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('order_transaction_item').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> checkProductExist({
    required int orderTransactionId,
    required int productId,
  }) async {
    final response = await client
        .from('order_transaction_item')
        .select()
        .eq("order_transaction_id", orderTransactionId)
        .eq("product_id", productId)
        .exec();
    return response.isNotEmpty;
  }
}
