import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/product_stock_report_view.dart';

class ProductStockReportController extends State<ProductStockReportView> {
  static late ProductStockReportController instance;
  late ProductStockReportView view;

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
