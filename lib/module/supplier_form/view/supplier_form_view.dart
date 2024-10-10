import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class SupplierFormView extends StatefulWidget {
  final Supplier? item;
  const SupplierFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, SupplierFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Supplier Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("supplier_form"),
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
            label: "Supplier Name",
            validator: Validator.required,
            value: controller.supplierName,
            onChanged: (value) {
              controller.supplierName = value;
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
  State<SupplierFormView> createState() => SupplierFormController();
}
