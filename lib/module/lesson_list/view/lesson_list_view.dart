import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonListView extends StatefulWidget {
  final int? lessonCategoryId;
  LessonListView({
    Key? key,
    this.lessonCategoryId,
  }) : super(key: key);

  Widget build(context, LessonListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              LessonCategoryAutocompleteField(
                label: "Lesson Category",
                validator: Validator.required,
                value: controller.lessonCategoryId?.toString(),
                onChanged: (value, label, mapValue) {
                  controller.lessonCategoryId = value;
                },
              ),
              QTextField(
                label: "Lesson Name",
                validator: Validator.required,
                value: controller.lessonName,
                onChanged: (value) {
                  controller.lessonName = value;
                },
              ),
              QMemoField(
                label: "Description",
                validator: Validator.required,
                value: controller.description,
                onChanged: (value) {
                  controller.description = value;
                },
              ),
              QDropdownField(
                label: "Lesson Type",
                validator: Validator.required,
                items: [
                  {"label": "Video", "value": "Video"},
                  {"label": "Audio", "value": "Audio"},
                  {"label": "PDF", "value": "PDF"}
                ],
                value: controller.lessonType,
                onChanged: (value, label) {
                  controller.lessonType = value;
                },
              ),
              QTextField(
                label: "Url",
                validator: Validator.required,
                value: controller.url,
                onChanged: (value) {
                  controller.url = value;
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
              key: Key("lesson_list"), //@UNIQUE_KEY
              stream: LessonService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                imageUrl: controller.imageUrl,
                lessonCategoryId: controller.lessonCategoryId,
                lessonName: controller.lessonName,
                description: controller.description,
                lessonType: controller.lessonType,
                url: controller.url,
                userProfileId: controller.userProfileId,
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
                  label: "Image Url",
                ),
                ListRowHeaderItem(
                  label: "Lesson Category",
                ),
                ListRowHeaderItem(
                  label: "Lesson Name",
                ),
                ListRowHeaderItem(
                  label: "Lesson Type",
                ),
                ListRowHeaderItem(
                  label: "Url",
                ),
                ListRowHeaderItem(
                  label: "User Profile",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                Lesson item = Lesson.fromJson(itemMap);

                return ListTileRow(
                  key: Key("lesson_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(LessonFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowImageItem(
                      label: "Image Url",
                      value: item.imageUrl,
                    ),
                    ListRowItem(
                      label: "Lesson Category",
                      value: item.lessonCategory?.lessonCategoryName,
                    ),
                    ListRowItem(
                      label: "Lesson Name",
                      value: item.lessonName,
                    ),
                    ListRowItem(
                      label: "Lesson Type",
                      value: item.lessonType,
                    ),
                    ListRowItem(
                      label: "Url",
                      value: item.url,
                    ),
                    ListRowItem(
                      label: "User Profile",
                      value: item.userProfile?.userProfileName,
                    ),
                    ListRowItem(
                      label: "Created At",
                      value: item.createdAt,
                    ),
                  ],
                  actions: [
                    //::LIST_VIEW_ACTIONS
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
              await Get.to(LessonSorterView());
              controller.refresh();
            },
            child: const Icon(Icons.sort),
          ),
          //:@WITH_SORT_INDEX_ONLY
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              await Get.to(LessonFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<LessonListView> createState() => LessonListController();
}
