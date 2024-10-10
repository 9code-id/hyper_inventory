import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PaymentMethodDropdownField extends StatelessWidget {
  final String label;
  final dynamic value;
  final dynamic Function(dynamic, dynamic, dynamic) onChanged;
  final dynamic validator;

  const PaymentMethodDropdownField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.value,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamList(
      stream: PaymentMethodService().snapshot(),
      shrinkWrap: true,
      itemsBuilder: (items) {
        return QDropdownField(
          label: label,
          validator: validator,
          items: items.map((e) {
            var item = PaymentMethod.fromJson(e);
            return {
              "label": item.paymentMethodName,
              "value": item.id,
              "object_value": e,
            };
          }).toList(),
          value: value,
          onChanged: (value, label) {
            var mapValue =
                items.firstWhere((element) => element['id'] == value);
            onChanged(
              value,
              label,
              mapValue,
            );
          },
        );
      },
    );
  }
}
