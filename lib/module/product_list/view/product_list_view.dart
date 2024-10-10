import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  ProductListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, ProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
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
                label: "Product Name",
                validator: Validator.required,
                value: controller.productName,
                onChanged: (value) {
                  controller.productName = value;
                },
              ),
              ProductCategoryAutocompleteField(
                label: "Product Category",
                validator: Validator.required,
                value: controller.productCategoryId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.productCategoryId = value;
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
              QTextField(
                label: "Sku",
                validator: Validator.required,
                value: controller.sku,
                onChanged: (value) {
                  controller.sku = value;
                },
              ),
              QTextField(
                label: "Qrcode",
                validator: Validator.required,
                value: controller.qrcode,
                onChanged: (value) {
                  controller.qrcode = value;
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
                label: "Stock",
                validator: Validator.required,
                value: controller.stockOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.stockOperatorAndValue = operatorAndValue;
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
              key: Key("product_list"), //@UNIQUE_KEY
              stream: ProductService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                productName: controller.productName,
                productCategoryId: controller.productCategoryId,
                description: controller.description,
                sku: controller.sku,
                qrcode: controller.qrcode,
                purchasePriceOperatorAndValue:
                    controller.purchasePriceOperatorAndValue,
                sellingPriceOperatorAndValue:
                    controller.sellingPriceOperatorAndValue,
                stockOperatorAndValue: controller.stockOperatorAndValue,
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
                  label: "Product Name",
                ),
                ListRowHeaderItem(
                  label: "Product Category",
                ),
                ListRowHeaderItem(
                  label: "Sku",
                ),
                ListRowHeaderItem(
                  label: "Qrcode",
                ),
                ListRowHeaderItem(
                  label: "Purchase Price",
                ),
                ListRowHeaderItem(
                  label: "Selling Price",
                ),
                ListRowHeaderItem(
                  label: "Stock",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                Product item = Product.fromJson(itemMap);

                return ListTileRow(
                  key: Key("product_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(ProductFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Product Name",
                      value: item.productName,
                    ),
                    ListRowItem(
                      label: "Product Category",
                      value: item.productCategory?.productCategoryName,
                    ),
                    ListRowItem(
                      label: "Sku",
                      value: item.sku,
                    ),
                    ListRowItem(
                      label: "Qrcode",
                      value: item.qrcode,
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
                      label: "Stock",
                      value: item.stock,
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
              await Get.to(ProductFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<ProductListView> createState() => ProductListController();
}
