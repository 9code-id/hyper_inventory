import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonCategoryFormView extends StatefulWidget {
  final LessonCategory? item;
  const LessonCategoryFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, LessonCategoryFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Category Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("lesson_category_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QTextField(
            label: "Lesson Category Name",
            validator: Validator.required,
            value: controller.lessonCategoryName,
            onChanged: (value) {
              controller.lessonCategoryName = value;
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
  State<LessonCategoryFormView> createState() => LessonCategoryFormController();
}
