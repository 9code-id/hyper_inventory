// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class ModuleSorterView extends StatefulWidget {
  const ModuleSorterView({Key? key}) : super(key: key);

  @override
  State<ModuleSorterView> createState() => _ModuleSorterViewState();
}

class _ModuleSorterViewState extends State<ModuleSorterView> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    items = await LessonCategoryService().getAll();
    //sort by sort_index field asc
    items.sort((a, b) => a["sort_index"].compareTo(b["sort_index"]));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sort: Lesson Category"),
        actions: const [],
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = items.removeAt(oldIndex);
          items.insert(newIndex, item);
          setState(() {});

          for (var i = 0; i < items.length; i++) {
            items[i]["sort_index"] = i;
          }
          setState(() {});
        },
        children: [
          for (final item in items)
            ListTile(
              key: ValueKey(item['id']),
              title: Text("${item["lesson_category_name"]}"),
              subtitle: Text("${item["sort_index"]}"),
            ),
        ],
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () async {
          for (var item in items) {
            await LessonCategoryService().update(
              id: item['id'],
              lessonCategoryName: item['lesson_category_name'],
              sortIndex: item['sort_index'],
              createdAt: null,
            );
          }
          ss("Sorted!");
          Get.back();
        },
      ),
    );
  }
}
