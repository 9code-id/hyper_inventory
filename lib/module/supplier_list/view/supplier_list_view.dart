import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class SupplierListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  SupplierListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, SupplierListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Supplier List"),
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
                label: "Supplier Name",
                validator: Validator.required,
                value: controller.supplierName,
                onChanged: (value) {
                  controller.supplierName = value;
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
              key: Key("supplier_list"), //@UNIQUE_KEY
              stream: SupplierService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                supplierName: controller.supplierName,
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
                  label: "Supplier Name",
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
                Supplier item = Supplier.fromJson(itemMap);

                return ListTileRow(
                  key: Key("supplier_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(SupplierFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Supplier Name",
                      value: item.supplierName,
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
              await Get.to(SupplierFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<SupplierListView> createState() => SupplierListController();
}
