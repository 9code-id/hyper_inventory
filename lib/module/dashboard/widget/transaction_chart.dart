// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module/dashboard/widget/transaction_statistic_card.dart';
import 'package:hyper_supabase/shared_app/widget/stream/stream_list.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TransactionChart extends StatefulWidget {
  final String mode;
  const TransactionChart({
    Key? key,
    this.mode = "today",
  }) : super(key: key);

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  List<Map<dynamic, dynamic>> chartData = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    loading = true;
    if (mounted) setState(() {});

    chartData =
        await OrderTransactionService().getOrderTransactionMonthlyChart();

    loading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return Container();

    return Builder(
      builder: (context) {
        return Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(12.0),
          child: SfCartesianChart(
            isTransposed: true,
            primaryXAxis: CategoryAxis(
              labelRotation: 45,
            ),
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.compact(),
            ),
            series: <CartesianSeries>[
              BarSeries<Map, String>(
                dataSource: chartData,
                xValueMapper: (Map data, _) => data["label"],
                yValueMapper: (Map data, _) => data["value"],
              )
            ],
          ),
        );
      },
    );
  }
}
