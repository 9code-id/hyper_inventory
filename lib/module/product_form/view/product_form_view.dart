import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductFormView extends StatefulWidget {
  final Product? item;
  const ProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("product_form"),
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
            label: "Product Name",
            validator: Validator.required,
            value: controller.productName,
            onChanged: (value) {
              controller.productName = value;
            },
          ),
          ProductCategoryAutocompleteField(
            label: "Product Category",
            validator: Validator.required,
            value: controller.productCategoryId?.toString(),
            onChanged: (value, label, mapValue) {
              controller.productCategoryId = value;
            },
          ),
          QMemoField(
            label: "Description",
            validator: Validator.required,
            value: controller.description,
            onChanged: (value) {
              controller.description = value;
            },
          ),
          QTextField(
            label: "Sku",
            validator: Validator.required,
            value: controller.sku,
            onChanged: (value) {
              controller.sku = value;
            },
          ),
          QTextField(
            label: "Qrcode",
            validator: Validator.required,
            value: controller.qrcode,
            onChanged: (value) {
              controller.qrcode = value;
            },
          ),
          QNumberField(
            label: "Purchase Price",
            validator: Validator.required,
            value: controller.purchasePrice?.toString(),
            onChanged: (value) {
              controller.purchasePrice = double.tryParse(value) ?? 0;
            },
          ),
          QNumberField(
            label: "Selling Price",
            validator: Validator.required,
            value: controller.sellingPrice?.toString(),
            onChanged: (value) {
              controller.sellingPrice = double.tryParse(value) ?? 0;
            },
          ),
          QNumberField(
            label: "Stock",
            validator: Validator.required,
            enabled: false,
            value: controller.stock?.toString(),
            onChanged: (value) {
              controller.stock = int.tryParse(value) ?? 0;
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
  State<ProductFormView> createState() => ProductFormController();
}
