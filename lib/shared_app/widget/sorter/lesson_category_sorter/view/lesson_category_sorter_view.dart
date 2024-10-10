import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonCategorySorterView extends StatefulWidget {
  const LessonCategorySorterView({Key? key}) : super(key: key);

  @override
  State<LessonCategorySorterView> createState() =>
      _LessonCategorySorterViewState();
}

class _LessonCategorySorterViewState extends State<LessonCategorySorterView> {
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
        title: const Text("LessonCategory Sorter"),
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
        children: List.generate(items.length, (index) {
          var itemMap = items[index];
          var item = LessonCategory.fromJson(itemMap);
          return ListTile(
            key: ValueKey(item.id.toString()),
            title: Text("${item.lessonCategoryName}"),
          );
        }),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () async {
          showLoading();
          for (var itemMap in items) {
            var item = LessonCategory.fromJson(itemMap);
            await LessonCategoryService().update(
              id: item.id!,
              lessonCategoryName: item.lessonCategoryName,
              sortIndex: item.sortIndex,
              createdAt: null,
            );
          }
          hideLoading();
          Get.back();
          ss("Sorted!");
        },
      ),
    );
  }
}
