import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonListController extends State<LessonListView> {
  static late LessonListController instance;
  late LessonListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    lessonCategoryId = widget.lessonCategoryId;
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  delete(Lesson item) async {
    try {
      showLoading();
      await LessonService().delete(item.id!);
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  deleteAll() async {
    try {
      showLoading();
      await LessonService().deleteAll();
      hideLoading();
    } on Exception catch (err) {
      hideLoading();
      se(err);
    }
    setState(() {});
  }

  //@SEARCH
  updateFilter() {
    setState(() {});
  }
  //@:SEARCH

  refresh() {
    setState(() {});
  }

  //::FILTER_VARIABLES
  //@FILTER_VARIABLES
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

  String? idOperatorAndValue;
  String? lessonCategoryIdOperatorAndValue;
  String? userProfileIdOperatorAndValue;
  String? sortIndexOperatorAndValue;
  DateTime? createdAtFrom;
  DateTime? createdAtTo;
  DateTime? updatedAtFrom;
  DateTime? updatedAtTo;
  //@:FILTER_VARIABLES

  //@CHECK_FILTER_MODE
  bool get isFilterMode {
    List values = [
      //::COMMA_VARIABLE
      id,
      imageUrl,
      lessonCategoryId,
      lessonName,
      description,
      lessonType,
      url,
      userProfileId,
      sortIndex,
      createdAt,
      updatedAt,
      idOperatorAndValue,
      lessonCategoryIdOperatorAndValue,
      userProfileIdOperatorAndValue,
      sortIndexOperatorAndValue,
      createdAtFrom,
      createdAtTo,
      updatedAtFrom,
      updatedAtTo,
    ];
    return values.indexWhere((i) =>
            (i != null && i != "") ||
            (i != null && i is String && i.isNotEmpty)) >
        -1;
  }
  //@:CHECK_FILTER_MODE

  resetFilter() {
    //@::ULL_VARIABLE
    id = null;
    imageUrl = null;
    lessonCategoryId = null;
    lessonName = null;
    description = null;
    lessonType = null;
    url = null;
    userProfileId = null;
    sortIndex = null;
    createdAt = null;
    updatedAt = null;
    idOperatorAndValue = null;
    lessonCategoryIdOperatorAndValue = null;
    userProfileIdOperatorAndValue = null;
    sortIndexOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    setState(() {});
  }
}
