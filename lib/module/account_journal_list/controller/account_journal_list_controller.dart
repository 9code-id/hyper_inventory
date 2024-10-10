import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class AccountJournalListController extends State<AccountJournalListView> {
  static late AccountJournalListController instance;
  late AccountJournalListView view;

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

  delete(AccountJournal item) async {
    try {
      showLoading();
      await AccountJournalService().delete(item.id!);
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
      await AccountJournalService().deleteAll();
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
  int? accountCategoryId;
  double? amount;
  String? description;
  int? userProfileId;
  DateTime? createdAt;
  DateTime? updatedAt;

  String? idOperatorAndValue;
  String? accountCategoryIdOperatorAndValue;
  String? amountOperatorAndValue;
  String? userProfileIdOperatorAndValue;
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
      accountCategoryId,
      amount,
      description,
      userProfileId,
      createdAt,
      updatedAt,
      idOperatorAndValue,
      accountCategoryIdOperatorAndValue,
      amountOperatorAndValue,
      userProfileIdOperatorAndValue,
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
    accountCategoryId = null;
    amount = null;
    description = null;
    userProfileId = null;
    createdAt = null;
    updatedAt = null;
    idOperatorAndValue = null;
    accountCategoryIdOperatorAndValue = null;
    amountOperatorAndValue = null;
    userProfileIdOperatorAndValue = null;
    createdAtFrom = null;
    createdAtTo = null;
    updatedAtFrom = null;
    updatedAtTo = null;
    setState(() {});
  }
}
