import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductCategoryFormView extends StatefulWidget {
  final ProductCategory? item;
  const ProductCategoryFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, ProductCategoryFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Category Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("product_category_form"),
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
            label: "Product Category Name",
            validator: Validator.required,
            value: controller.productCategoryName,
            onChanged: (value) {
              controller.productCategoryName = value;
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
  State<ProductCategoryFormView> createState() =>
      ProductCategoryFormController();
}
