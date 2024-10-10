import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonLeaderboardFormView extends StatefulWidget {
  final LessonLeaderboard? item;
  const LessonLeaderboardFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, LessonLeaderboardFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Leaderboard Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("lesson_leaderboard_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QNumberField(
            label: "Current Streak",
            validator: Validator.required,
            value: controller.currentStreak?.toString(),
            onChanged: (value) {
              controller.currentStreak = int.tryParse(value) ?? 0;
            },
          ),
          QNumberField(
            label: "Longest Streak",
            validator: Validator.required,
            value: controller.longestStreak?.toString(),
            onChanged: (value) {
              controller.longestStreak = int.tryParse(value) ?? 0;
            },
          ),
          QNumberField(
            label: "Total Minutes",
            validator: Validator.required,
            value: controller.totalMinutes?.toString(),
            onChanged: (value) {
              controller.totalMinutes = int.tryParse(value) ?? 0;
            },
          ),
        ],
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<LessonLeaderboardFormView> createState() =>
      LessonLeaderboardFormController();
}
