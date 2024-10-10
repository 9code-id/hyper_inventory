import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/shared_app/model/product_stock/product_stock.dart';
import 'package:hyper_supabase/shared_app/service/order_transaction_service/order_transaction_service.dart';
import '../controller/product_stock_report_controller.dart';

class ProductStockReportView extends StatefulWidget {
  const ProductStockReportView({Key? key}) : super(key: key);

  Widget build(context, ProductStockReportController controller) {
    controller.view = this;
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
  }

  @override
  State<ProductStockReportView> createState() => ProductStockReportController();
}
