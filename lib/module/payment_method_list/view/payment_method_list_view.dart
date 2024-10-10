import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class PaymentMethodListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  PaymentMethodListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, PaymentMethodListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method List"),
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
                label: "Payment Method Name",
                validator: Validator.required,
                value: controller.paymentMethodName,
                onChanged: (value) {
                  controller.paymentMethodName = value;
                },
              ),
              QTextField(
                label: "Account Number",
                validator: Validator.required,
                value: controller.accountNumber,
                onChanged: (value) {
                  controller.accountNumber = value;
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
              key: Key("payment_method_list"), //@UNIQUE_KEY
              stream: PaymentMethodService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                paymentMethodName: controller.paymentMethodName,
                accountNumber: controller.accountNumber,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Payment Method Name",
                ),
                ListRowHeaderItem(
                  label: "Account Number",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                PaymentMethod item = PaymentMethod.fromJson(itemMap);

                return ListTileRow(
                  key: Key("payment_method_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(PaymentMethodFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Payment Method Name",
                      value: item.paymentMethodName,
                    ),
                    ListRowItem(
                      label: "Account Number",
                      value: item.accountNumber,
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
              await Get.to(PaymentMethodFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<PaymentMethodListView> createState() => PaymentMethodListController();
}
