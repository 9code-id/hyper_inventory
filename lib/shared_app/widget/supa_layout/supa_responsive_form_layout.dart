// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/form/image_picker/multi_image_picker.dart';

class SupaResponsiveFormLayout extends StatelessWidget {
  final List<Widget> children;
  const SupaResponsiveFormLayout({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool isTablet = MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;
      bool isDesktop = MediaQuery.of(context).size.width >= 1100;
      bool isMobile = MediaQuery.of(context).size.width < 850;

      var forms = children;

      double spacing = 12;
      int column = 1;
      if (!isMobile) {
        column = 2;
      }

      if (children.length == 2) {
        column = 1;
      }

      return Wrap(
        spacing: spacing,
        runSpacing: spacing / 2,
        children: List.generate(forms.length, (index) {
          var form = forms[index];
          var width = (constraints.biggest.width / column) - (spacing / 2);

          if (form is QMemoField) {
            width = constraints.biggest.width;
          }
          if (form is QFilesPicker) {
            width = constraints.biggest.width;
          }
          if (form is QFilePicker) {
            width = constraints.biggest.width;
          }
          if (form is QImagePicker) {
            width = constraints.biggest.width;
          }
          return SizedBox(
            width: width,
            child: form,
          );
        }),
      );
    });
  }
}
