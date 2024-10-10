import 'package:hyper_supabase/core.dart';
import 'package:hyper_ui/core.dart';

class DummyService {
  Future<void> deleteCurrentData() async {
    await LessonLeaderboardService().deleteAll();
    await LessonService().deleteAll();
    await LessonCategoryService().deleteAll();
    await AccountJournalService().deleteAll();
    await AccountCategoryService().deleteAll();
    await OrderTransactionItemService().deleteAll();
    await OrderTransactionService().deleteAll();
    await PurchaseTransactionItemService().deleteAll();
    await PurchaseTransactionService().deleteAll();
    await PaymentMethodService().deleteAll();
    await SupplierService().deleteAll();
    await CustomerService().deleteAll();
    await ProductService().deleteAll();
    await ProductCategoryService().deleteAll();
    await UserProfileService().deleteAll();
  }

  Future<void> generateDummies() async {
    for (var i = 0; i < 5; i++) {
      await UserProfileService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await ProductCategoryService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await ProductService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await CustomerService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await SupplierService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await PaymentMethodService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await PurchaseTransactionService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await PurchaseTransactionItemService().createDummies();
    }
    for (var i = 0; i < 2; i++) {
      await OrderTransactionService().createDummies();
    }
    for (var i = 0; i < 2; i++) {
      await OrderTransactionItemService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await AccountCategoryService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await AccountJournalService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await LessonCategoryService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await LessonService().createDummies();
    }
    for (var i = 0; i < 5; i++) {
      await LessonLeaderboardService().createDummies();
    }
  }
}
