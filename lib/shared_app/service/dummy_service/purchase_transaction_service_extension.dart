import 'package:hyper_supabase/core.dart';

extension PurchaseTransactionServiceExtension on PurchaseTransactionService {
  Future<void> createDummies() async {
    await PurchaseTransactionService().create(
      userProfileId: currentUser!.id,
      supplierId: await r.randomId('supplier'),
      paymentMethodId: await r.randomId('payment_method'),
      orderStatus: r.firstValueFromList([
        "Order created",
        "Order packed",
        "Handed over to driver",
        "In transit",
        "Received",
        "Completed"
      ]),
      total: r.randomDouble(),
    );
    await createDummiesWithUniqueProducts(
        PurchaseTransactionService.lastInsertID!);
  }

  Future<void> createDummiesWithUniqueProducts(
      int purchaseTransactionId) async {
    var products = await ProductService().getAll();
    for (var product in products) {
      await PurchaseTransactionItemService().create(
        purchaseTransactionId: purchaseTransactionId,
        productId: product['id'],
        qty: 1,
        purchasePrice: r.randomDoubleBetween(1000, 10000),
      );
    }
  }
}
