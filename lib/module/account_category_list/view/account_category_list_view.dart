import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountCategoryListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  AccountCategoryListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, AccountCategoryListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Account Category List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
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
              key: Key("account_category_list"), //@UNIQUE_KEY
              stream: AccountCategoryService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                accountCategoryName: controller.accountCategoryName,
                accountType: controller.accountType,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Account Category Name",
                ),
                ListRowHeaderItem(
                  label: "Account Type",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                AccountCategory item = AccountCategory.fromJson(itemMap);

                return ListTileRow(
                  key: Key("account_category_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(AccountCategoryFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Account Category Name",
                      value: item.accountCategoryName,
                    ),
                    ListRowItem(
                      label: "Account Type",
                      value: item.accountType,
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
              await Get.to(AccountCategoryFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<AccountCategoryListView> createState() =>
      AccountCategoryListController();
}
