import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

List<MenuItem> developerMenus = [
  MenuItem(
    label: "Developer",
    icon: Icons.developer_mode,
    view: DeveloperView(),
  ),
];
