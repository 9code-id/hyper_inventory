import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PaymentMethodFormView extends StatefulWidget {
  final PaymentMethod? item;
  const PaymentMethodFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, PaymentMethodFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment Method Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("payment_method_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QTextField(
            label: "Payment Method Name",
            validator: Validator.required,
            value: controller.paymentMethodName,
            onChanged: (value) {
              controller.paymentMethodName = value;
            },
          ),
          QTextField(
            label: "Account Number",
            validator: Validator.required,
            value: controller.accountNumber,
            onChanged: (value) {
              controller.accountNumber = value;
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
  State<PaymentMethodFormView> createState() => PaymentMethodFormController();
}
