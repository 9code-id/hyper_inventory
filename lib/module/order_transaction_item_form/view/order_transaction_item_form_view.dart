import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class OrderTransactionItemFormView extends StatefulWidget {
  final OrderTransactionItem? item;
  const OrderTransactionItemFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, OrderTransactionItemFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Transaction Item Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("order_transaction_item_form"),
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
                controller.sellingPrice =
                    double.tryParse(mapValue['selling_price'].toString()) ?? 0;
              } else {
                controller.sellingPrice = 0;
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
          QNumberField(
            key: Key("selling_price_${controller.productId}"),
            label: "Selling Price",
            validator: Validator.required,
            value: controller.sellingPrice?.toString(),
            onChanged: (value) {
              controller.sellingPrice = double.tryParse(value) ?? 0;
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
  State<OrderTransactionItemFormView> createState() =>
      OrderTransactionItemFormController();
}
