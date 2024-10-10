import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class CustomerFormView extends StatefulWidget {
  final Customer? item;
  const CustomerFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, CustomerFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("customer_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QImagePicker(
            label: "Image Url",
            validator: Validator.required,
            extensions: ['png', 'jpg'],
            value: controller.imageUrl,
            onChanged: (value) {
              controller.imageUrl = value;
            },
          ),
          QTextField(
            label: "Customer Name",
            validator: Validator.required,
            value: controller.customerName,
            onChanged: (value) {
              controller.customerName = value;
            },
          ),
          QTextField(
            label: "Email",
            validator: Validator.email,
            value: controller.email,
            onChanged: (value) {
              controller.email = value;
            },
          ),
          QTextField(
            label: "Phone",
            validator: Validator.required,
            value: controller.phone,
            onChanged: (value) {
              controller.phone = value;
            },
          ),
          QTextField(
            label: "Address",
            validator: Validator.required,
            value: controller.address,
            onChanged: (value) {
              controller.address = value;
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
  State<CustomerFormView> createState() => CustomerFormController();
}
