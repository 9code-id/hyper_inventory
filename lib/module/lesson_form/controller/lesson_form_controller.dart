import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonFormController extends State<LessonFormView> {
  static late LessonFormController instance;
  late LessonFormView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    initializeData();
  }

  initializeData() async {
    loading = true;
    setState(() {});

    if (isEditMode) {
      //::CURRENT_DATA
      id = current!.id;
      imageUrl = current!.imageUrl;
      lessonCategoryId = current!.lessonCategoryId;
      lessonName = current!.lessonName;
      description = current!.description;
      lessonType = current!.lessonType;
      url = current!.url;
      userProfileId = current!.userProfileId;
      sortIndex = current!.sortIndex;
      createdAt = current!.createdAt;
      updatedAt = current!.updatedAt;
    } else {
      if (isDevMode) {
        //@BEGIN_RANDOM_INITIAL_DATA
        imageUrl = r.randomImageUrl();
        lessonCategoryId = await r.randomId('lesson_category');
        lessonName = r.randomName();
        description = r.randomDescription();
        lessonType = r.firstValueFromList(["Video", "Audio", "PDF"]);
        url = r.randomUrl();
        userProfileId = currentUser!.id;
        sortIndex = r.randomInt();
        createdAt = createdAt ?? DateTime.now();
        updatedAt = DateTime.now();
        //@END_RANDOM_INITIAL_DATA
      }
      if (LessonListController.instance.widget.lessonCategoryId != null) {
        lessonCategoryId =
            LessonListController.instance.widget.lessonCategoryId ??
                current!.lessonCategoryId;
      }
    }

    loading = false;
    setState(() {});
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loading = false;

  bool get isNotValid {
    bool isValid = formKey.currentState!.validate();
    return !isValid;
  }

  bool get isValid {
    bool isValid = formKey.currentState!.validate();
    return isValid;
  }

  Lesson? get current => widget.item;
  bool get isEditMode => current != null;
  bool get isCreateMode => current == null;

  //::VARIABLE
  int? id;
  String? imageUrl;
  int? lessonCategoryId;
  String? lessonName;
  String? description;
  String? lessonType;
  String? url;
  int? userProfileId;
  int? sortIndex;
  DateTime? createdAt;
  DateTime? updatedAt;

  save() {
    if (isNotValid) return;
    if (isCreateMode) create();
    if (isEditMode) update();
  }

  create() async {
    try {
      showLoading();
      await LessonService().create(
        //@BEGIN_FORM_CREATE
        imageUrl: imageUrl,
        lessonCategoryId: lessonCategoryId,
        lessonName: lessonName,
        description: description,
        lessonType: lessonType,
        url: url,
        userProfileId: currentUser!.id,
        sortIndex: sortIndex,
        createdAt: createdAt,
        //@END_FORM_CREATE
      );
      hideLoading();
      Get.back();
      ss("Data created");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  update() async {
    try {
      showLoading();
      await LessonService().update(
        id: id!,
        //@BEGIN_FORM_UPDATE
        imageUrl: imageUrl,
        lessonCategoryId: lessonCategoryId,
        lessonName: lessonName,
        description: description,
        lessonType: lessonType,
        url: url,
        userProfileId: currentUser!.id,
        sortIndex: sortIndex,
        createdAt: createdAt,
        //@END_FORM_UPDATE
      );
      hideLoading();
      Get.back();
      ss("Data updated");
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
  }

  refresh() {
    setState(() {});
  }
}
