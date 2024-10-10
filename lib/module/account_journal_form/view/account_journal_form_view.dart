import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountJournalFormView extends StatefulWidget {
  final AccountJournal? item;
  final int? accountCategoryId;
  const AccountJournalFormView({
    Key? key,
    this.accountCategoryId,
    this.item,
  }) : super(key: key);

  Widget build(context, AccountJournalFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Journal Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("account_journal_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          AccountCategoryAutocompleteField(
            label: "Account Category",
            enabled: accountCategoryId == null,
            validator: Validator.required,
            value: controller.accountCategoryId?.toString(),
            onChanged: (value, label, mapValue) {
              controller.accountCategoryId = value;
            },
          ),
          QNumberField(
            label: "Amount",
            validator: Validator.required,
            value: controller.amount?.toString(),
            onChanged: (value) {
              controller.amount = double.tryParse(value) ?? 0;
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
          QDatePicker(
            label: "Created At",
            validator: Validator.required,
            value: controller.createdAt,
            onChanged: (value) {
              controller.createdAt = value;
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
  State<AccountJournalFormView> createState() => AccountJournalFormController();
}
