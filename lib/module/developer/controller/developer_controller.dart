import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';
import '../view/developer_view.dart';

class DeveloperController extends State<DeveloperView> {
  static late DeveloperController instance;
  late DeveloperView view;

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
