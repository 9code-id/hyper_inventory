import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ProductCategoryListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  ProductCategoryListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, ProductCategoryListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Product Category List"),
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
                label: "Product Category Name",
                validator: Validator.required,
                value: controller.productCategoryName,
                onChanged: (value) {
                  controller.productCategoryName = value;
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
              key: Key("product_category_list"), //@UNIQUE_KEY
              stream: ProductCategoryService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                productCategoryName: controller.productCategoryName,
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
                  label: "Product Category Name",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                ProductCategory item = ProductCategory.fromJson(itemMap);

                return ListTileRow(
                  key: Key("product_category_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(ProductCategoryFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Product Category Name",
                      value: item.productCategoryName,
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
              await Get.to(ProductCategoryFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<ProductCategoryListView> createState() =>
      ProductCategoryListController();
}
