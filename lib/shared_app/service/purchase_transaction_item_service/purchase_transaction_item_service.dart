import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionItemService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    int? purchaseTransactionId,
    String? purchaseTransactionIdOperatorAndValue,
    int? productId,
    String? productIdOperatorAndValue,
    int? qty,
    String? qtyOperatorAndValue,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('purchase_transaction_item').select(
      """
*,
purchase_transaction!inner(*,user_profile!inner(*),supplier!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (purchaseTransactionId != null) {
      query = query.eq('purchase_transaction_id', purchaseTransactionId);
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
    int? purchaseTransactionId,
    String? purchaseTransactionIdOperatorAndValue,
    int? productId,
    String? productIdOperatorAndValue,
    int? qty,
    String? qtyOperatorAndValue,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? total,
    String? totalOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('purchase_transaction_item').select(
      """
*,
purchase_transaction!inner(*,user_profile!inner(*),supplier!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (purchaseTransactionId != null) {
      query = query.eq('purchase_transaction_id', purchaseTransactionId);
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

  Future<Map<String, dynamic>?> getPurchaseTransactionItemById(int id) async {
    final response = await client
        .from('purchase_transaction_item')
        .select(
          """
*,
purchase_transaction!inner(*,user_profile!inner(*),supplier!inner(*),payment_method!inner(*)),
product!inner(*,product_category!inner(*))
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    int? purchaseTransactionId,
    int? productId,
    int? qty,
    double? purchasePrice,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      if (await checkProductExist(
        purchaseTransactionId: purchaseTransactionId!,
        productId: productId!,
      )) {
        throw Exception("Product already added");
      }

      var values = await client
          .from('purchase_transaction_item')
          .insert([
            {
              'purchase_transaction_id': purchaseTransactionId ?? 0,
              'product_id': productId ?? 0,
              'qty': qty ?? 0,
              'purchase_price': purchasePrice ?? 0,
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
    int? purchaseTransactionId,
    int? productId,
    int? qty,
    double? purchasePrice,
    double? total,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getPurchaseTransactionItemById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('purchase_transaction_item')
          .update({
            'purchase_transaction_id':
                purchaseTransactionId ?? current['purchase_transaction_id'],
            'product_id': productId ?? current['product_id'],
            'qty': qty ?? current['qty'],
            'purchase_price': purchasePrice ?? current['purchase_price'],
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
      var current = await getPurchaseTransactionItemById(id);

      await client
          .from('purchase_transaction_item')
          .delete()
          .eq('id', id)
          .exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client
          .from('purchase_transaction_item')
          .delete()
          .neq('id', -1)
          .exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<bool> checkProductExist({
    required int purchaseTransactionId,
    required int productId,
  }) async {
    final response = await client
        .from('purchase_transaction_item')
        .select()
        .eq("purchase_transaction_id", purchaseTransactionId)
        .eq("product_id", productId)
        .exec();
    return response.isNotEmpty;
  }
}
