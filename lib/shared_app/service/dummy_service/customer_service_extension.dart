import 'package:hyper_supabase/core.dart';

extension CustomerServiceExtension on CustomerService {
  Future<void> createDummies() async {
    await CustomerService().create(
      imageUrl: r.randomImageUrl(),
      customerName: r.randomName(),
      email: r.randomEmail(),
      phone: r.randomPhone(),
      address: r.randomAddress(),
    );
  }
}
