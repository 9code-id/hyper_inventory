/*
//#TEMPLATE scaffold_rpc_with_headers
return Scaffold(
  appBar: AppBar(
    title: const Text("Product Stock Report"),
    actions: const [],
  ),
  body: StreamList(
    key: Key("product_stock_report_list"),
    adaptiveMode: false,
    // stream: ProductService().snapshot(),
    stream: client.rpc('product_stock_report', params: {}).asStream(),
    padding: EdgeInsets.all(12.0),
    headers: [
      //::LIST_VIEW_HEADER
      ListRowHeaderItem(
        label: "Product Name",
      ),
      ListRowHeaderItem(
        label: "Purchase",
      ),
      ListRowHeaderItem(
        label: "Order",
      ),
      ListRowHeaderItem(
        label: "Stock",
      ),
    ],
    itemBuilder: (itemMap, index) {
      ProductStock item = ProductStock.fromJson(itemMap);

      return ListTileRow(
        key: Key("product_list_tile_row"),
        adaptiveMode: false,
        index: index,
        onDismiss: () {},
        onTap: () async {},
        children: [
          //::LIST_VIEW_ITEM
          ListRowItem(
            label: "Product Name",
            value: item.productName,
          ),
          ListRowItem(
            label: "Purchase",
            value: item.purchaseCount,
          ),
          ListRowItem(
            label: "Order",
            value: item.orderCount,
          ),
          ListRowItem(
            label: "Stock",
            value: item.stock,
          ),
        ],
      );
    },
  ),
);
//#END

//#TEMPLATE scaffold_rpc
return Scaffold(
  body: StreamList(
      key: Key("summary_report_list"),
  adaptiveMode: false,
  // stream: ProductService().snapshot(),
  stream: client.rpc('summary_report', params: {
    "start_date": DateTime(now.year, now.month, 1).yMd,
    "end_date": DateTime(now.year, now.month + 1, 1)
        .subtract(Duration(days: 1))
        .yMd,
  }).asStream(),
  padding: EdgeInsets.all(12.0),
  itemBuilder: (itemMap, index) {
    
  }),
);
//#END
*/