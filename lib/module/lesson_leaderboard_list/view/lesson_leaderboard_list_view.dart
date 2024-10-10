import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonLeaderboardListView extends StatefulWidget {
  //@EXTRA_VARIABLE_DECLARATIONS
  LessonLeaderboardListView({
    Key? key,

    //@EXTRA_CONSTRUCTOR_DECLARATIONS
  }) : super(key: key);

  Widget build(context, LessonLeaderboardListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lesson Leaderboard List"),
        actions: [
          //@SEARCH
          StreamSearch(
            onFilter: () => controller.updateFilter(),
            onReset: () => controller.resetFilter(),
            onDeleteAll: () => controller.deleteAll(),
            filterMode: controller.isFilterMode,
            widgets: [
              //::FILTER_FORM
              QNumberFilterField(
                label: "Current Streak",
                validator: Validator.required,
                value: controller.currentStreakOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.currentStreakOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Longest Streak",
                validator: Validator.required,
                value: controller.longestStreakOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.longestStreakOperatorAndValue = operatorAndValue;
                },
              ),
              QNumberFilterField(
                label: "Total Minutes",
                validator: Validator.required,
                value: controller.totalMinutesOperatorAndValue?.toString(),
                onChanged: (value, operator, operatorAndValue) {
                  controller.totalMinutesOperatorAndValue = operatorAndValue;
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
              key: Key("lesson_leaderboard_list"), //@UNIQUE_KEY
              stream: LessonLeaderboardService().snapshot(
                //::FILTER_SNAPSHOT_PARAMS
                idOperatorAndValue: controller.idOperatorAndValue,
                userProfileId: controller.userProfileId,
                currentStreakOperatorAndValue:
                    controller.currentStreakOperatorAndValue,
                longestStreakOperatorAndValue:
                    controller.longestStreakOperatorAndValue,
                totalMinutesOperatorAndValue:
                    controller.totalMinutesOperatorAndValue,
                createdAtFrom: controller.createdAtFrom,
                createdAtTo: controller.createdAtTo,
                updatedAtFrom: controller.updatedAtFrom,
                updatedAtTo: controller.updatedAtTo,
              ),
              padding: EdgeInsets.all(0.0),
              headers: [
                //::LIST_VIEW_HEADER
                ListRowHeaderItem(
                  label: "User Profile",
                ),
                ListRowHeaderItem(
                  label: "Current Streak",
                ),
                ListRowHeaderItem(
                  label: "Longest Streak",
                ),
                ListRowHeaderItem(
                  label: "Total Minutes",
                ),
                ListRowHeaderItem(
                  label: "Created At",
                ),
              ],
              actionButton: false,
              itemBuilder: (itemMap, index) {
                LessonLeaderboard item = LessonLeaderboard.fromJson(itemMap);

                return ListTileRow(
                  key: Key("lesson_leaderboard_list_tile_row"),
                  index: index,
                  onDismiss: () => controller.delete(item),
                  onTap: () async {
                    await Get.to(LessonLeaderboardFormView(item: item));
                    controller.refresh();
                  },
                  children: [
                    //::LIST_VIEW_ITEM
                    ListRowItem(
                      label: "User Profile",
                      value: item.userProfile?.userProfileName,
                    ),
                    ListRowItem(
                      label: "Current Streak",
                      value: item.currentStreak,
                    ),
                    ListRowItem(
                      label: "Longest Streak",
                      value: item.longestStreak,
                    ),
                    ListRowItem(
                      label: "Total Minutes",
                      value: item.totalMinutes,
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
          FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () async {
              await Get.to(LessonLeaderboardFormView());
              controller.refresh();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  @override
  State<LessonLeaderboardListView> createState() =>
      LessonLeaderboardListController();
}
