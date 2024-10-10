import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/shared_app/model/daily_report/daily_report.dart';
import '../controller/daily_report_controller.dart';

class DailyReportView extends StatefulWidget {
  const DailyReportView({Key? key}) : super(key: key);

  Widget build(context, DailyReportController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Report"),
        actions: const [],
      ),
      body: StreamList(
        key: Key("daily_report_list"),
        adaptiveMode: false,
        // stream: ProductService().snapshot(),
        stream: client.rpc('daily_report', params: {
          "start_date": DateTime(now.year, now.month, 1).yMd,
          "end_date": DateTime(now.year, now.month + 1, 1)
              .subtract(Duration(days: 1))
              .yMd,
        }).asStream(),
        padding: EdgeInsets.all(12.0),
        headers: [
          //::LIST_VIEW_HEADER
          ListRowHeaderItem(
            label: "Report Date",
          ),
          ListRowHeaderItem(
            label: "Purchase",
          ),
          ListRowHeaderItem(
            label: "Sales",
          ),
        ],
        itemBuilder: (itemMap, index) {
          DailyReport item = DailyReport.fromJson(itemMap);

          return ListTileRow(
            key: Key("product_list_tile_row"),
            adaptiveMode: false,
            index: index,
            onDismiss: () {},
            onTap: () async {},
            children: [
              //::LIST_VIEW_ITEM
              ListRowItem(
                label: "Report Date",
                value: item.reportDate,
                format: "EEE, dd MMMM yyyy",
                type: "date",
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
  State<DailyReportView> createState() => DailyReportController();
}
