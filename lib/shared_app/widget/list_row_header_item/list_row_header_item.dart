// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hyper_ui/core.dart';

class ListRowHeaderItem {
  final dynamic label;
  const ListRowHeaderItem({
    Key? key,
    required this.label,
  }) : super();
}

class ListRowItem extends StatelessWidget {
  final dynamic label;
  final dynamic value;
  final String? type;
  final String? format;
  const ListRowItem({
    Key? key,
    required this.label,
    required this.value,
    this.format,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic getValue() {
      var key = label.toString().toLowerCase();
      if (key.contains("attachment")) {
        return Text(
          "$value",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.0,
            color: infoColor,
          ),
        );
      }

      if (value is double &&
          label.toString().toLowerCase().contains("percen")) {
        return (value as double).percentage;
      }
      if (label.toString().toLowerCase().contains("stock")) {
        return double.parse(value.toString()).number;
      }

      if (value is int) {
        return value.toString().number;
      }

      if (value is double) {
        return value.toString().number;
      }
      return "${value is DateTime ? (value as DateTime?)?.dMMMykkmmss : value}";
    }

    var widgetValue = getValue();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 16.0,
      ),
      child: GestureDetector(
        onDoubleTap: () {
          Clipboard.setData(
            ClipboardData(text: "$value"),
          );
          if (value.toString().startsWith("http")) {
            launchUrl(Uri.parse(value));
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                "$label",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: widgetValue is Widget
                  ? widgetValue
                  : Text(
                      widgetValue,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
