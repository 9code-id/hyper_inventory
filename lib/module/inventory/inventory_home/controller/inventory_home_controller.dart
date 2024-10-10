
import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/inventory_home_view.dart';

class InventoryHomeController extends State<InventoryHomeView> {
  static late InventoryHomeController instance;
  late InventoryHomeView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    