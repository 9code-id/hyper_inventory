// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_supabase/shared_app/util/type_extension/key_extension.dart';
import 'package:hyper_supabase/shared_app/widget/supa_layout/supa_responsive_form_layout.dart';
import 'package:hyper_ui/shared/util/log/log.dart';

class SupaFormColumn extends StatelessWidget {
  const SupaFormColumn({
    super.key,
    this.isEditMode = false,
    required this.children,
    this.itemDetailListView = const [],
    this.formKey,
    this.padding,
  });
  final bool isEditMode;
  final List<Widget> children;
  final List<Widget>? itemDetailListView;
  final GlobalKey<FormState>? formKey;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    var tableName = key!.getTableName("_form");

    if (itemDetailListView!.isNotEmpty) {
      List<Widget> visibleChildren = children;
      List<Widget> visibleFooter = itemDetailListView ?? [];

      return Container(
        padding: padding ?? const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SupaResponsiveFormLayout(
                children: [
                  ...visibleChildren,
                ],
              ),
              Expanded(
                child: Column(
                  children: visibleFooter ?? [],
                ),
              ),
            ],
          ),
        ),
      );
    }

    var formChildren = children;

    return SingleChildScrollView(
      child: Container(
        padding: padding ?? const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SupaResponsiveFormLayout(
                children: [
                  ...formChildren,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
