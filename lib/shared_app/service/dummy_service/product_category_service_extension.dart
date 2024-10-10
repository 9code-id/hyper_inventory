import 'package:hyper_supabase/core.dart';

extension ProductCategoryServiceExtension on ProductCategoryService {
  Future<void> createDummies() async {
    await ProductCategoryService().create(
      imageUrl: r.randomImageUrl(),
      productCategoryName: r.randomProductCategoryName(),
    );
  }
}
