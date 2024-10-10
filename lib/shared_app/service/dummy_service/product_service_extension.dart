import 'package:hyper_supabase/core.dart';

extension ProductServiceExtension on ProductService {
  Future<void> createDummies() async {
    await ProductService().create(
      imageUrl: r.randomImageUrl(),
      productName: r.randomProductName(),
      productCategoryId: await r.randomId('product_category'),
      description: r.randomDescription(),
      sku: Uuid().v4(),
      qrcode: Uuid().v4(),
      purchasePrice: r.randomDouble(),
      sellingPrice: r.randomDouble(),
      stock: 0,
    );
  }
}
