//#TEMPLATE reuseable_number_field
import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/widget/form/dropdown/dropdown.dart';
import 'package:hyper_ui/shared/widget/form/number_field/numberfield.dart';
import 'package:intl/intl.dart';

class QNumberFilterField extends StatefulWidget {
  const QNumberFilterField({
    required this.label,
    required this.onChanged,
    super.key,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.onSubmitted,
    this.pattern,
    this.locale = 'en_US',
    this.maxLength,
  });
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final Function(String value, String operator, String valueAndOperator)
      onChanged;
  final Function(String)? onSubmitted;

  final String? pattern;
  final String? locale;
  final int? maxLength;

  @override
  State<QNumberFilterField> createState() => _QNumberFilterFieldState();
}

class _QNumberFilterFieldState extends State<QNumberFilterField> {
  String? operator = "==";
  String? value;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    var text = widget.value ?? "";
    if (text.contains(" ")) {
      var arr = text.split(" ");
      operator = arr[0];
      value = arr[1];
    }
    value = widget.value?.replaceAll(RegExp('[^0-9.]'), '');
    print('value: $value');
    print('value: ${widget.value}');
    controller = TextEditingController();
    controller.text = formattedValue?.toString() ?? '';
  }

  String? get formattedValue {
    if (widget.pattern != null) {
      final currencyFormat = NumberFormat(widget.pattern, widget.locale);
      final pValue = num.tryParse(value.toString()) ?? 0;
      return currencyFormat.format(pValue);
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: AbsorbPointer(
              child: QNumberField(
                label: widget.label,
                value: widget.label,
                hideSuffix: true,
                onChanged: (value) {},
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Container(
            width: 80,
            child: QDropdownField(
              key: UniqueKey(),
              label: "Operator",
              emptyMode: false,
              items: [
                {
                  "label": "==",
                  "value": "==",
                },
                {
                  "label": ">",
                  "value": ">",
                },
                {
                  "label": "<",
                  "value": "<",
                },
                {
                  "label": ">=",
                  "value": ">=",
                },
                {
                  "label": "<=",
                  "value": "<=",
                },
                {
                  "label": "!=",
                  "value": "!=",
                },
              ],
              value: operator,
              onChanged: (operatorValue, label) {
                operator = operatorValue;
                print("Operator changed $operator");
                setState(() {});
                if (value != null) {
                  widget.onChanged(value!, operator!, "$operator $value");
                }
              },
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: QNumberField(
              label: "Value",
              value: value,
              hideSuffix: true,
              onChanged: (inputValue) {
                value = inputValue;
                widget.onChanged(value!, operator!, "$operator $value");
              },
            ),
          ),
        ],
      ),
    );
  }
}

//#END
