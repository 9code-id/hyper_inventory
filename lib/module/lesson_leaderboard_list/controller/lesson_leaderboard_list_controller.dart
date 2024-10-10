import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class LessonLeaderboardListController extends State<LessonLeaderboardListView> {
  static late LessonLeaderboardListController instance;
  late LessonLeaderboardListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    //@EXTRA_INIT_STATE_DECLARATION
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  delete(LessonLeaderboard item) async {
    try {
      showLoading();
      await LessonLeaderboardService().delete(item.id!);
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
      await LessonLeaderboardService().deleteAll();
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
  int? userProfileId;
  int? currentStreak;
  int? longestStreak;
  int? totalMinutes;
  DateTime? createdAt;
  DateTime? updatedAt;

  String? idOperatorAndValue;
  String? userProfileIdOperatorAndValue;
  String? currentStreakOperatorAndValue;
  String? longestStreakOperatorAndValue;
  String? totalMinutesOperatorAndValue;
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
      userProfileId,
      currentStreak,
      longestStreak,
      totalMinutes,
      createdAt,
      updatedAt,
      idOperatorAndValue,
      userProfileIdOperatorAndValue,
      currentStreakOperatorAndValue,
      longestStreakOperatorAndValue,
      totalMinutesOperatorAndValue,
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
    userProfileId = null;
    currentStreak = null;
    longestStreak = null;
    totalMinutes = null;
    createdAt = null;
    updatedAt = null;
    idOperatorAndValue = null;
    userProfileIdOperatorAndValue = null;
    currentStreakOperatorAndValue = null;
    longestStreakOperatorAndValue = null;
    totalMinutesOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    setState(() {});
  }
}