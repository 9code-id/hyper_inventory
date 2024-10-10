import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/daily_report_view.dart';

class DailyReportController extends State<DailyReportView> {
  static late DailyReportController instance;
  late DailyReportView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
