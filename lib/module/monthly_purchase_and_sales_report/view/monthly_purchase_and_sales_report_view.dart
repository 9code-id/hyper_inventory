import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/shared_app/model/monthly_report/monthly_report.dart';
import '../controller/monthly_purchase_and_sales_report_controller.dart';

class MonthlyPurchaseAndSalesReportView extends StatefulWidget {
  const MonthlyPurchaseAndSalesReportView({Key? key}) : super(key: key);

  Widget build(context, MonthlyPurchaseAndSalesReportController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Purchase And Sales Report"),
        actions: const [],
      ),
      body: StreamList(
        key: Key("monthly_report_list"),
        adaptiveMode: false,
        // stream: ProductService().snapshot(),
        stream: client.rpc('monthly_report', params: {}).asStream(),
        padding: EdgeInsets.all(12.0),
        headers: [
          //::LIST_VIEW_HEADER
          ListRowHeaderItem(
            label: "Month",
          ),
          ListRowHeaderItem(
            label: "Purchase",
          ),
          ListRowHeaderItem(
            label: "Sales",
          ),
        ],
        itemBuilder: (itemMap, index) {
          MonthlyReport item = MonthlyReport.fromJson(itemMap);

          return ListTileRow(
            key: Key("product_list_tile_row"),
            adaptiveMode: false,
            index: index,
            onDismiss: () {},
            onTap: () async {},
            children: [
              //::LIST_VIEW_ITEM
              ListRowItem(
                label: "Month",
                value: item.monthName,
              ),
              ListRowItem(
                label: "Purchase",
                value: item.purchase,
              ),
              ListRowItem(
                label: "Sales",
                value: item.sales,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  State<MonthlyPurchaseAndSalesReportView> createState() =>
      MonthlyPurchaseAndSalesReportController();
}
