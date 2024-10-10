import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionItemFormView extends StatefulWidget {
  final PurchaseTransactionItem? item;
  const PurchaseTransactionItemFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, PurchaseTransactionItemFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Transaction Item Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("purchase_transaction_item_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          ProductAutocompleteField(
            label: "Product",
            enabled: !controller.isEditMode,
            validator: Validator.required,
            value: controller.productId?.toString(),
            onChanged: (value, label, mapValue) {
              controller.productId = value;
              //@BEGIN_FORM_MODE_ONLY
              if (mapValue != null) {
                controller.purchasePrice =
                    double.tryParse(mapValue['purchase_price'].toString()) ?? 0;
              } else {
                controller.purchasePrice = 0;
              }
              controller.refresh();
              //:@END_FORM_MODE_ONLY
            },
          ),
          QNumberField(
            label: "Qty",
            validator: Validator.required,
            value: controller.qty?.toString(),
            onChanged: (value) {
              controller.qty = int.tryParse(value) ?? 0;
            },
          ),
          QNumberField(
            key: Key("purchase_price_${controller.productId}"),
            label: "Purchase Price",
            validator: Validator.required,
            value: controller.purchasePrice?.toString(),
            onChanged: (value) {
              controller.purchasePrice = double.tryParse(value) ?? 0;
            },
          ),
        ],
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<PurchaseTransactionItemFormView> createState() =>
      PurchaseTransactionItemFormController();
}
