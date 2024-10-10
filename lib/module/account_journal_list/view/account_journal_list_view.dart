import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountJournalListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  AccountJournalListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, AccountJournalListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Account Journal List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              AccountCategoryAutocompleteField(
                label: "Account Category",
                validator: Validator.required,
                value: controller.accountCategoryId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.accountCategoryId = value;
                },
              ),
              QNumberFilterField(
                label: "Amount",
                validator: Validator.required,
                value: controller.amountOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.amountOperatorAndValue = operatorAndValue;
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
              QDateRangePicker(
                label: "Created At",
                validator: Validator.required,
                fromValue: controller.createdAtFrom,
                toValue: controller.createdAtTo,
                onChanged: (from, to) {
                  controller.createdAtFrom = from;
                  controller.createdAtTo = to;
                },
              ),
              QDateRangePicker(
                label: "Updated At",
                validator: Validator.required,
                fromValue: controller.updatedAtFrom,
                toValue: controller.updatedAtTo,
                onChanged: (from, to) {
                  controller.updatedAtFrom = from;
                  controller.updatedAtTo = to;
                },
              ),
            ],
          ),
          //@:SEARCH
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamList(
              key: Key("account_journal_list"), //@UNIQUE_KEY
              stream: AccountJournalService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                accountCategoryId: controller.accountCategoryId,
                amountOperatorAndValue: controller.amountOperatorAndValue,
                description: controller.description,
                userProfileId: controller.userProfileId,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Account Category",
                ),
                ListRowHeaderItem(
                  label: "Amount",
                ),
                ListRowHeaderItem(
                  label: "User Profile",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                AccountJournal item = AccountJournal.fromJson(itemMap);

                return ListTileRow(
                  key: Key("account_journal_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(AccountJournalFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Account Category",
                      value: item.accountCategory?.accountCategoryName,
                    ),
                    ListRowItem(
                      label: "Amount",
                      value: item.amount,
                    ),
                    ListRowItem(
                      label: "User Profile",
                      value: item.userProfile?.userProfileName,
                    ),
                    ListRowItem(
                      label: "Created At",
                      value: item.createdAt,
                    ),
                  ],
                  actions: [
                    //::LIST_VIEW_ACTIONS
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActions(
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              await Get.to(AccountJournalFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<AccountJournalListView> createState() => AccountJournalListController();
}
