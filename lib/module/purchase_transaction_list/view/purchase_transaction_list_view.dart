import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PurchaseTransactionListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  PurchaseTransactionListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, PurchaseTransactionListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Purchase Transaction List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              SupplierAutocompleteField(
                label: "Supplier",
                validator: Validator.required,
                value: controller.supplierId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.supplierId = value;
                },
              ),
              PaymentMethodAutocompleteField(
                label: "Payment Method",
                validator: Validator.required,
                value: controller.paymentMethodId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.paymentMethodId = value;
                },
              ),
              QDropdownField(
                label: "Order Status",
                validator: Validator.required,
                items: [
                  {"label": "Order created", "value": "Order created"},
                  {"label": "Order packed", "value": "Order packed"},
                  {
                    "label": "Handed over to driver",
                    "value": "Handed over to driver"
                  },
                  {"label": "In transit", "value": "In transit"},
                  {"label": "Received", "value": "Received"},
                  {"label": "Completed", "value": "Completed"}
                ],
                value: controller.orderStatus,
                onChanged: (value, label) {
                  controller.orderStatus = value;
                },
              ),
              QNumberFilterField(
                label: "Total",
                validator: Validator.required,
                value: controller.totalOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.totalOperatorAndValue = operatorAndValue;
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
              key: Key("purchase_transaction_list"), //@UNIQUE_KEY
              stream: PurchaseTransactionService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                userProfileId: controller.userProfileId,
                supplierId: controller.supplierId,
                paymentMethodId: controller.paymentMethodId,
                orderStatus: controller.orderStatus,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
                totalOperatorAndValue: controller.totalOperatorAndValue,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "User Profile",
                ),
                ListRowHeaderItem(
                  label: "Supplier",
                ),
                ListRowHeaderItem(
                  label: "Payment Method",
                ),
                ListRowHeaderItem(
                  label: "Order Status",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
                ListRowHeaderItem(
                  label: "Total",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                PurchaseTransaction item =
                    PurchaseTransaction.fromJson(itemMap);

                return ListTileRow(
                  key: Key("purchase_transaction_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(PurchaseTransactionFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "User Profile",
                      value: item.userProfile?.userProfileName,
                    ),
                    ListRowItem(
                      label: "Supplier",
                      value: item.supplier?.supplierName,
                    ),
                    ListRowItem(
                      label: "Payment Method",
                      value: item.paymentMethod?.paymentMethodName,
                    ),
                    ListRowItem(
                      label: "Order Status",
                      value: item.orderStatus,
                    ),
                    ListRowItem(
                      label: "Created At",
                      value: item.createdAt,
                    ),
                    ListRowItem(
                      label: "Total",
                      value: item.total,
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
              await Get.to(PurchaseTransactionFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<PurchaseTransactionListView> createState() =>
      PurchaseTransactionListController();
}
