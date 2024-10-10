import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonCategoryListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  LessonCategoryListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, LessonCategoryListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson Category List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              QTextField(
                label: "Lesson Category Name",
                validator: Validator.required,
                value: controller.lessonCategoryName,
                onChanged: (value) {
                  controller.lessonCategoryName = value;
                },
              ),
              QDateRangePicker(
                label: "Created At",
                validator: Validator.required,
                fromValue: controller.createdAtFrom,
                toValue: controller.createdAtTo,
                onChanged: (from, to) {
                  controller.createdAtFrom = from;
                  controller.createdAtTo = to;
                },
              ),
              QDateRangePicker(
                label: "Updated At",
                validator: Validator.required,
                fromValue: controller.updatedAtFrom,
                toValue: controller.updatedAtTo,
                onChanged: (from, to) {
                  controller.updatedAtFrom = from;
                  controller.updatedAtTo = to;
                },
              ),
            ],
          ),
          //@:SEARCH
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamList(
              key: Key("lesson_category_list"), //@UNIQUE_KEY
              stream: LessonCategoryService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                lessonCategoryName: controller.lessonCategoryName,
                sortIndexOperatorAndValue: controller.sortIndexOperatorAndValue,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "Lesson Category Name",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: true,
              itemBuilder: (itemMap, index) {
                LessonCategory item = LessonCategory.fromJson(itemMap);

                return ListTileRow(
                  key: Key("lesson_category_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(LessonCategoryFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "Lesson Category Name",
                      value: item.lessonCategoryName,
                    ),
                    ListRowItem(
                      label: "Created At",
                      value: item.createdAt,
                    ),
                  ],
                  actions: [
                    //::LIST_VIEW_ACTIONS
                    QButton(
                      label: "Manage",
                      size: xs,
                      width: 100.0,
                      onPressed: () {
                        Get.to(LessonListView(
                          lessonCategoryId: item.id,
                        ));
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActions(
        children: [
          //@WITH_SORT_INDEX_ONLY
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              await Get.to(LessonCategorySorterView());
              controller.refresh();
            },
            child: const Icon(Icons.sort),
          ),
          //:@WITH_SORT_INDEX_ONLY
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              await Get.to(LessonCategoryFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<LessonCategoryListView> createState() => LessonCategoryListController();
}
