import 'package:hyper_supabase/core.dart';

extension SupplierServiceExtension on SupplierService {
  Future<void> createDummies() async {
    await SupplierService().create(
      imageUrl: r.randomImageUrl(),
      supplierName: r.randomName(),
      email: r.randomEmail(),
      phone: r.randomPhone(),
      address: r.randomAddress(),
    );
  }
}
