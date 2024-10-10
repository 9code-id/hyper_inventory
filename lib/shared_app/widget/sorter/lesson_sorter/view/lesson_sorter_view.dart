import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonSorterView extends StatefulWidget {
  const LessonSorterView({Key? key}) : super(key: key);

  @override
  State<LessonSorterView> createState() => _LessonSorterViewState();
}

class _LessonSorterViewState extends State<LessonSorterView> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    items = await LessonService().getAll();
    //sort by sort_index field asc
    items.sort((a, b) => a["sort_index"].compareTo(b["sort_index"]));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Sorter"),
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
          var item = Lesson.fromJson(itemMap);
          return ListTile(
            key: ValueKey(item.id.toString()),
            title: Text("${item.lessonName}"),
          );
        }),
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () async {
          showLoading();
          for (var itemMap in items) {
            var item = Lesson.fromJson(itemMap);
            await LessonService().update(
              id: item.id!,
              lessonName: item.lessonName,
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
