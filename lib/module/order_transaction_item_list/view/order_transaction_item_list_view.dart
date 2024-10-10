import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class OrderTransactionItemListView extends StatefulWidget {
  //@DETAIL_PARENT_DECLARATION_ID
  final int? orderTransactionId;
  //@:DETAIL_PARENT_DECLARATION_ID
  //@EXTRA_VARIABLE_DECLARATIONS
  OrderTransactionItemListView({
    Key? key,
    //@DETAIL_PARENT_CONSTRUCTOR_ID
    this.orderTransactionId,
    //@:DETAIL_PARENT_CONSTRUCTOR_ID
    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, OrderTransactionItemListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        //@HAS_PARENT_SCOPE
        leading: controller.isSubEditMode ? Container() : null,
        leadingWidth: controller.isSubEditMode ? 0 : null,
        //@:HAS_PARENT_SCOPE
        title: Text("Order Transaction Item List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              ProductAutocompleteField(
                label: "Product",
                validator: Validator.required,
                value: controller.productId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.productId = value;
                },
              ),
              QNumberFilterField(
                label: "Qty",
                validator: Validator.required,
                value: controller.qtyOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.qtyOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Purchase Price",
                validator: Validator.required,
                value: controller.purchasePriceOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.purchasePriceOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Selling Price",
                validator: Validator.required,
                value: controller.sellingPriceOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.sellingPriceOperatorAndValue = operatorAndValue;
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
              key: Key("order_transaction_item_list"), //@UNIQUE_KEY
              stream: OrderTransactionItemService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                orderTransactionId: orderTransactionId,
                productId: controller.productId,
                qtyOperatorAndValue: controller.qtyOperatorAndValue,
                purchasePriceOperatorAndValue:
                    controller.purchasePriceOperatorAndValue,
                sellingPriceOperatorAndValue:
                    controller.sellingPriceOperatorAndValue,
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
                  label: "Product",
                ),
                ListRowHeaderItem(
                  label: "Qty",
                ),
                ListRowHeaderItem(
                  label: "Purchase Price",
                ),
                ListRowHeaderItem(
                  label: "Selling Price",
                ),
                ListRowHeaderItem(
                  label: "Total",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                OrderTransactionItem item =
                    OrderTransactionItem.fromJson(itemMap);

                return ListTileRow(
                  key: Key("order_transaction_item_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(OrderTransactionItemFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Product",
                      value: item.product?.productName,
                    ),
                    ListRowItem(
                      label: "Qty",
                      value: item.qty,
                    ),
                    ListRowItem(
                      label: "Purchase Price",
                      value: item.purchasePrice,
                    ),
                    ListRowItem(
                      label: "Selling Price",
                      value: item.sellingPrice,
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
              await Get.to(OrderTransactionItemFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<OrderTransactionItemListView> createState() =>
      OrderTransactionItemListController();
}
