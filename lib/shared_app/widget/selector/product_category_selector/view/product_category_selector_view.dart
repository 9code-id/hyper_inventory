import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductCategorySelectorField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(dynamic, dynamic, dynamic, dynamic) onChanged;
  final dynamic validator;

  const ProductCategorySelectorField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamList(
      stream: ProductCategoryService().snapshot(),
      shrinkWrap: true,
      itemsBuilder: (items) {
        return QCategoryPicker(
          validator: validator,
          items: items.map((e) {
            var item = ProductCategory.fromJson(e);
            return {
              "label": item.productCategoryName,
              "value": item.id,
              "object_value": e,
            };
          }).toList(),
          value: value,
          onChanged: (index, label, value, item) {
            onChanged(index, value, label, item);
          },
        );
      },
    );
  }
}
