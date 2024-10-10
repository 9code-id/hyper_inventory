// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import 'package:hyper_supabase/module/dashboard/widget/transaction_statistic_card.dart';
import 'package:hyper_supabase/shared_app/widget/stream/stream_list.dart';

class TransactionCard extends StatefulWidget {
  final String mode;
  const TransactionCard({
    Key? key,
    this.mode = "today",
  }) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  num total = 0;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    loading = true;
    setState(() {});

    if (widget.mode == "today") {
      total = await OrderTransactionService().getOrderTransactionTotalToday();
    } else if (widget.mode == "this_week") {
      total =
          await OrderTransactionService().getOrderTransactionTotalThisWeek();
    } else if (widget.mode == "this_month") {
      total =
          await OrderTransactionService().getOrderTransactionTotalThisMonth();
    } else if (widget.mode == "this_year") {
      total =
          await OrderTransactionService().getOrderTransactionTotalThisYear();
    }

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return Container();
    var label = "";

    if (widget.mode == "today") {
      label = "Today";
    } else if (widget.mode == "this_week") {
      label = "This Week";
    } else if (widget.mode == "this_month") {
      label = "This Month";
    } else if (widget.mode == "this_year") {
      label = "This Year";
    }
    return TransactionStatisticCard(
      label: "$label sales",
      value: total.toDouble().currency,
    );
  }
}
