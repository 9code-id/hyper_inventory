import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonFormView extends StatefulWidget {
  final Lesson? item;
  const LessonFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, LessonFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lesson Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("lesson_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QImagePicker(
            label: "Image Url",
            validator: Validator.required,
            extensions: ['png', 'jpg'],
            value: controller.imageUrl,
            onChanged: (value) {
              controller.imageUrl = value;
            },
          ),
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
        ],
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<LessonFormView> createState() => LessonFormController();
}
