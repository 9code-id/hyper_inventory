import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class CustomerListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  CustomerListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, CustomerListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Customer List"),
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
                label: "Customer Name",
                validator: Validator.required,
                value: controller.customerName,
                onChanged: (value) {
                  controller.customerName = value;
                },
              ),
              QTextField(
                label: "Email",
                validator: Validator.email,
                value: controller.email,
                onChanged: (value) {
                  controller.email = value;
                },
              ),
              QTextField(
                label: "Phone",
                validator: Validator.required,
                value: controller.phone,
                onChanged: (value) {
                  controller.phone = value;
                },
              ),
              QTextField(
                label: "Address",
                validator: Validator.required,
                value: controller.address,
                onChanged: (value) {
                  controller.address = value;
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
              key: Key("customer_list"), //@UNIQUE_KEY
              stream: CustomerService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                customerName: controller.customerName,
                email: controller.email,
                phone: controller.phone,
                address: controller.address,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Image Url",
                ),
                ListRowHeaderItem(
                  label: "Customer Name",
                ),
                ListRowHeaderItem(
                  label: "Email",
                ),
                ListRowHeaderItem(
                  label: "Phone",
                ),
                ListRowHeaderItem(
                  label: "Address",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                Customer item = Customer.fromJson(itemMap);

                return ListTileRow(
                  key: Key("customer_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(CustomerFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Customer Name",
                      value: item.customerName,
                    ),
                    ListRowItem(
                      label: "Email",
                      value: item.email,
                    ),
                    ListRowItem(
                      label: "Phone",
                      value: item.phone,
                    ),
                    ListRowItem(
                      label: "Address",
                      value: item.address,
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
              await Get.to(CustomerFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<CustomerListView> createState() => CustomerListController();
}
