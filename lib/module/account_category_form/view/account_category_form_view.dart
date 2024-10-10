import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountCategoryFormView extends StatefulWidget {
  final AccountCategory? item;
  const AccountCategoryFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, AccountCategoryFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Category Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("account_category_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QTextField(
            label: "Account Category Name",
            validator: Validator.required,
            value: controller.accountCategoryName,
            onChanged: (value) {
              controller.accountCategoryName = value;
            },
          ),
          QDropdownField(
            label: "Account Type",
            validator: Validator.required,
            items: [
              {"label": "Asset", "value": "Asset"},
              {"label": "Liability", "value": "Liability"},
              {"label": "Equity", "value": "Equity"},
              {"label": "Revenue", "value": "Revenue"},
              {"label": "Expense", "value": "Expense"}
            ],
            value: controller.accountType,
            onChanged: (value, label) {
              controller.accountType = value;
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
  State<AccountCategoryFormView> createState() =>
      AccountCategoryFormController();
}
