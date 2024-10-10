import 'package:hyper_ui/core.dart';
import 'package:hyper_supabase/core.dart';

class ProductService {
  static int? lastInsertID;
  Future<List<Map<String, dynamic>>> getAll({
    int? id,
    String? idOperatorAndValue,
    String? imageUrl,
    String? productName,
    int? productCategoryId,
    String? productCategoryIdOperatorAndValue,
    String? description,
    String? sku,
    String? qrcode,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? sellingPrice,
    String? sellingPriceOperatorAndValue,
    int? stock,
    String? stockOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) async {
    var query = client.from('product').select(
      """
*,
product_category!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (productName != null && productName.isNotEmpty) {
      query = query.ilike('product_name', '%$productName%');
    }
    if (productCategoryId != null) {
      query = query.eq('product_category_id', productCategoryId);
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (sku != null) {
      query = query.eq('sku', sku);
    }
    if (qrcode != null) {
      query = query.eq('qrcode', qrcode);
    }
    if (purchasePriceOperatorAndValue != null) {
      query = query.eqo('purchase_price', purchasePriceOperatorAndValue);
    }
    if (sellingPriceOperatorAndValue != null) {
      query = query.eqo('selling_price', sellingPriceOperatorAndValue);
    }
    if (stockOperatorAndValue != null) {
      query = query.eqo('stock', stockOperatorAndValue);
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
    String? productName,
    int? productCategoryId,
    String? productCategoryIdOperatorAndValue,
    String? description,
    String? sku,
    String? qrcode,
    double? purchasePrice,
    String? purchasePriceOperatorAndValue,
    double? sellingPrice,
    String? sellingPriceOperatorAndValue,
    int? stock,
    String? stockOperatorAndValue,
    DateTime? createdAtFrom,
    DateTime? createdAtTo,
    DateTime? updatedAtFrom,
    DateTime? updatedAtTo,
  }) {
    var query = client.from('product').select(
      """
*,
product_category!inner(*)
""",
    );

    if (idOperatorAndValue != null) {
      query = query.eqo('id', idOperatorAndValue);
    }
    if (imageUrl != null) {
      query = query.eq('image_url', imageUrl);
    }
    if (productName != null && productName.isNotEmpty) {
      query = query.ilike('product_name', '%$productName%');
    }
    if (productCategoryId != null) {
      query = query.eq('product_category_id', productCategoryId);
    }
    if (description != null) {
      query = query.eq('description', description);
    }
    if (sku != null) {
      query = query.eq('sku', sku);
    }
    if (qrcode != null) {
      query = query.eq('qrcode', qrcode);
    }
    if (purchasePriceOperatorAndValue != null) {
      query = query.eqo('purchase_price', purchasePriceOperatorAndValue);
    }
    if (sellingPriceOperatorAndValue != null) {
      query = query.eqo('selling_price', sellingPriceOperatorAndValue);
    }
    if (stockOperatorAndValue != null) {
      query = query.eqo('stock', stockOperatorAndValue);
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

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final response = await client
        .from('product')
        .select(
          """
*,
product_category!inner(*)
""",
        )
        .eq('id', id)
        .exec();
    return response.first;
  }

  Future<Map<String, dynamic>?> create({
    String? imageUrl,
    String? productName,
    int? productCategoryId,
    String? description,
    String? sku,
    String? qrcode,
    double? purchasePrice,
    double? sellingPrice,
    int? stock,
    DateTime? createdAt,
  }) async {
    try {
      var values = await client
          .from('product')
          .insert([
            {
              'image_url': imageUrl,
              'product_name': productName,
              'product_category_id': productCategoryId ?? 0,
              'description': description,
              'sku': sku,
              'qrcode': qrcode,
              'purchase_price': purchasePrice ?? 0,
              'selling_price': sellingPrice ?? 0,
              'stock': stock ?? 0,
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
    String? productName,
    int? productCategoryId,
    String? description,
    String? sku,
    String? qrcode,
    double? purchasePrice,
    double? sellingPrice,
    int? stock,
    DateTime? createdAt,
  }) async {
    try {
      var current = await getProductById(id);
      if (current == null) throw ("Data not found");
      final response = await client
          .from('product')
          .update({
            'image_url': imageUrl ?? current['image_url'],
            'product_name': productName ?? current['product_name'],
            'product_category_id':
                productCategoryId ?? current['product_category_id'],
            'description': description ?? current['description'],
            'sku': sku ?? current['sku'],
            'qrcode': qrcode ?? current['qrcode'],
            'purchase_price': purchasePrice ?? current['purchase_price'],
            'selling_price': sellingPrice ?? current['selling_price'],
            'stock': stock ?? current['stock'],
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
      await client.from('product').delete().eq('id', id).exec();
    } on Exception catch (err) {
      throw Exception(err);
    }
  }

  Future<void> deleteAll() async {
    try {
      await client.from('product').delete().neq('id', -1).exec();
      ;
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
